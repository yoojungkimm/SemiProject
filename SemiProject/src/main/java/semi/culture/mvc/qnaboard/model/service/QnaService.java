package semi.culture.mvc.qnaboard.model.service;

import static semi.culture.common.jdbc.JDBCTemplate.close;
import static semi.culture.common.jdbc.JDBCTemplate.commit;
import static semi.culture.common.jdbc.JDBCTemplate.getConnection;
import static semi.culture.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import semi.culture.common.util.PageInfo;
import semi.culture.mvc.qnaboard.model.dao.QnaDAO;
import semi.culture.mvc.qnaboard.model.vo.Qna;
import semi.culture.mvc.qnaboard.model.vo.QnaReply;

public class QnaService {
	QnaDAO dao = new QnaDAO();

	
	// 전체 게시글 개수
		public int findAllQnaCount() {
			Connection conn = getConnection();
			int result = dao.getBoardCount(conn);

			if (result > 0) {
				System.out.println("okk");
			} else {
				System.out.println("bad");
			}
			close(conn);

			return result;

		}
	

		// 문의글 페이징된 리스트 가져오기
		public List<Qna> findAll(PageInfo pageInfo) {
			List<Qna> list = new ArrayList<>();
			Connection conn = getConnection();

			list = dao.findAll(conn, pageInfo);

			if (list != null) {
				System.out.println("okk");
			} else {
				System.out.println("nono");
			}

			close(conn);
			return list;
		}
	
	public int getBoardCount() {
		Connection conn = getConnection();
		int result = dao.getBoardCount(conn);
		close(conn);
		return result;
	}
	
	public List<Qna> getBoardList(PageInfo pageinfo) {
		Connection conn = getConnection();
		List<Qna> list = dao.findAll(conn, pageinfo);
		close(conn);
		return list;
	}
	
	public int save(Qna qna) {
		Connection conn = getConnection();
		int result = 0;
		
		if(qna.getNo() != 0) {
			result = dao.updateBoard(conn, qna);
		}else {
			result = dao.insertBoard(conn, qna);
		}
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	public Qna findBoardByNo(int no, boolean hasRead) {
		Connection conn = getConnection();
		Qna qna = dao.findBoardByNo(conn, no);
		
		// 조회수 증가 로직
		if(hasRead == true && qna != null) {
			int result = dao.updateReadCount(conn, qna);
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
		}
		
		close(conn);
		return qna;
	}
	
	public int delete(int no) {
		Connection conn = getConnection();
		int result = dao.updateStatus(conn, no, "N");
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int saveReply(QnaReply reply) {
		Connection conn = getConnection();
		int result = dao.insertReply(conn, reply);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public int deleteReply(int replyNo) {
		Connection conn = getConnection();
		
		int result = dao.deleteReply(conn, replyNo);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

}
