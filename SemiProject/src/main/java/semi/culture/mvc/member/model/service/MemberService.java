package semi.culture.mvc.member.model.service;

import static semi.culture.common.jdbc.JDBCTemplate.close;
import static semi.culture.common.jdbc.JDBCTemplate.commit;
import static semi.culture.common.jdbc.JDBCTemplate.getConnection;
import static semi.culture.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import semi.culture.mvc.member.model.dao.MemberDAO;
import semi.culture.mvc.member.model.vo.DipLike;
import semi.culture.mvc.member.model.vo.Member;
import semi.culture.mvc.member.model.vo.TicketBookList;
import semi.culture.mvc.qnaboard.model.vo.Qna;
import semi.culture.mvc.reviewboard.model.vo.Review;

public class MemberService {

	MemberDAO dao = new MemberDAO();

	// 로그인
	public Member findMemberById(String user_id) {
		Member member = null;
		Connection conn = getConnection();
		member = dao.findMemberById(conn, user_id);

		close(conn);
		return member;

	}
	// 1-회원가입

	public int insertMember(Member member) {
		int result = 0;
		Connection conn = getConnection();

		result = dao.InsertMember(conn, member);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return result;
	}

	// 회원정보수정

	public int updateMember(Member member) {
		int result = 0;
		Connection conn = getConnection();

		result = dao.updateMember(conn, member);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return result;
	}

	// 현재예매내역 조회

	public List<TicketBookList> getTicketBookList(String user_id) {
		List<TicketBookList> list = new ArrayList<>();
		Connection conn = getConnection();

		list = dao.getTicketBookList(conn, user_id);

		if (list != null) {
			System.out.println("success");
			close(conn);
			
			return list;
		} else {
			System.out.println("fail");
		}
		return list;
	}

	public List<TicketBookList> getTicketBookListPast(String user_id) {
		List<TicketBookList> list = new ArrayList<>();
		Connection conn = getConnection();

		list = dao.getTicketBookListPast(conn, user_id);

		if (list != null) {
			System.out.println("success");
			close(conn);
			return list;
		} else {
			System.out.println("fail");
		}
		return list;
	}

	// 찜내역 조회

	public List<DipLike> getDipLikeList(String user_id) {
		List<DipLike> list = new ArrayList<>();
		Connection conn = getConnection();

		list = dao.getDipLikeList(conn, user_id);

		if (list != null) {
			System.out.println("success");
			close(conn);
			return list;
		} else {
			System.out.println("fail");
		}
		return list;

	}
	// 찜하기
	public int InsertDipLikeList(DipLike dl) {
		int result = 0;
		Connection conn = getConnection();

		result = dao.InsertDipLikeList(conn, dl);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return result;
	}

	// 찜해제

	public int DeleteDipLikeList(int like_num) {
		int result = 0;
		Connection conn = getConnection();

		result = dao.DeleteDipLikeList(conn, like_num);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return result;
	}
	// 내 리뷰 조회
	public List<Review> getReviewsByUserId(String user_id) {
		List<Review> list = new ArrayList<>();
		Connection conn = getConnection();

		list = dao.getReviewsByUserId(conn, user_id);

		if (list != null) {
			System.out.println("success");
			close(conn);
			return list;
		} else {
			System.out.println("fail");
		}
		return list;

	}
	// 예매 
	public int insertBookTicket(TicketBookList tbl) {
		int result = 0;
		Connection conn = getConnection();

		result = dao.insertBookTicket(conn, tbl);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return result;
	}
	// 예약 취소
	public int deleteBookTicket(int ticketing_no) {
		int result = 0;
		Connection conn = getConnection();

		result = dao.deleteBookTicket(conn, ticketing_no);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return result;
	}
	// 내 문의 내역
	
	public List<Qna> findMyQnaList(String user_id){
		Connection conn = getConnection();
		List<Qna> list = dao.findMyQnaList(conn, user_id);
		if (list != null) {
			System.out.println("findMyQnaList success");
			close(conn);
			return list;
		} else {
			System.out.println("findMyQnaList fail");
		}
		close(conn);
		return list;
		
	}
	
	public TicketBookList findTicketBookListByNo(int ticketing_no) {
		Connection conn = getConnection();
		TicketBookList tbl = dao.findTicketBookListByNo(conn, ticketing_no);
		
		if (tbl != null) {
			System.out.println("success");
			close(conn);
			return tbl;
		} else {
			System.out.println("fail");
		}
		close(conn);
		return tbl;
	}
	public boolean isDuplicated(String userId) {
		
		Connection conn = getConnection();
		Member member = dao.findMemberById(conn, userId);
		
		if(member==null) {
			return false; // 아이디 쓸수 있음
		}else {
			return true; // 중복됨
		}
	}
	
	
	public static void main(String[] args) {
		
		MemberService ms = new MemberService();
		/*
		List<TicketBookList> tblPast = ms.getTicketBookListPast("user01");
		
		System.out.println(tblPast);
		
		List<Qna> list = ms.findMyQnaList("user01");
		
		System.out.println(list);
		
		TicketBookList tbl = ms.findTicketBookListByNo(19);
		
		System.out.println(tbl);
		*/
		
		List<Qna> qnaList = ms.findMyQnaList("user01");
		System.out.println(qnaList);
		
		
		
	}

	
	
	

}
