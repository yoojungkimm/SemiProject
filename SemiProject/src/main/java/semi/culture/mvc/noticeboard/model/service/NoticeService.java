package semi.culture.mvc.noticeboard.model.service;

import static semi.culture.common.jdbc.JDBCTemplate.close;
import static semi.culture.common.jdbc.JDBCTemplate.commit;
import static semi.culture.common.jdbc.JDBCTemplate.getConnection;
import static semi.culture.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import semi.culture.common.util.PageInfo;
import semi.culture.mvc.noticeboard.model.dao.NoticeDAO;
import semi.culture.mvc.noticeboard.model.vo.Notice;

public class NoticeService {
	NoticeDAO dao = new NoticeDAO();

	// 공지사항 등록
	public int insertNotice(Notice notice) {
		Connection conn = getConnection();
		int result = 0;

		if(notice.getNoticeNum() != 0) {
			result = dao.updateNotice(conn, notice);
		}else {
			result = dao.insertNotice(conn, notice);
		}
		if (result > 0) {
			System.out.println("okk");
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;

	}

	// 문의글 전체 리스트 가져오기
	public List<Notice> findNoticeList(PageInfo pageInfo) {
		List<Notice> list = new ArrayList<>();
		
		Connection conn = getConnection();
		
		list = dao.findNoticeList(conn, pageInfo);
		
		if(list!=null) {
			System.out.println("ok");
		}else {
			System.out.println("no");
		}
		
		close(conn);
		return list;
	}
	
	// 상세 게시글을 조회
	public Notice findNoticeByNo(int boardNo, boolean hasRead) {
		Connection conn = getConnection();
		Notice notice = dao.findNoticeByNo(conn, boardNo);
		
		// 조회수 증가 로직
				if(hasRead == true && notice != null) {
					int result = dao.updateReadCount(conn, notice);
					if(result > 0) {
						commit(conn);
					}else {
						rollback(conn);
					}
				}
		
		close(conn);
		
		return notice;
	}
	
	public int findAllNoticeCount() {
		Connection conn = getConnection();
		int result = 0;
		
		result = dao.findAllNoticeCount(conn);
		
		if (result > 0) {
			System.out.println("okk");
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public int updateReadCount(Notice notice) {
		
		Connection conn = getConnection();
		int result = 0;
		
		result = dao.updateReadCount(conn, notice);
		
		if (result > 0) {
			System.out.println("okk");
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	public static void main(String[] args) {
		
		NoticeService ns = new NoticeService();
		int result= 0;
		Notice notice = new Notice();
		// 공지사항 등록
		
		/*
		notice.setNoticeTitile("새로운 운영규칙 안내");
		notice.setNoticeContent("예매 취소 불가하게 되었습니다.");
		result = ns.insertNotice(notice);
		
		
		// 문의 리스트 가져오기
		PageInfo pageInfo = new PageInfo(1,10,ns.findAllNoticeCount(),10);
		List<Notice> list = ns.findNoticeList(pageInfo);
		
		System.out.println(list);
		
		// 상세 게시글 조회 / 조회수
		
		notice = ns.findNoticeByNo(1);
		ns.updateReadCount(notice);
		notice = ns.findNoticeByNo(1);
		System.out.println(notice);
		
		// 전체 게시글 개수
		
		result =ns.findAllNoticeCount();
		
		System.out.println(result);
		*/
		
		
	}
	
}
