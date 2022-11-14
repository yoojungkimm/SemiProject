package semi.culture.mvc.member.model.dao;

import static semi.culture.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import semi.culture.mvc.member.model.vo.DipLike;
import semi.culture.mvc.member.model.vo.Member;
import semi.culture.mvc.member.model.vo.TicketBookList;
import semi.culture.mvc.qnaboard.model.vo.Qna;
import semi.culture.mvc.reviewboard.model.vo.Review;

public class MemberDAO {

	// 1-회원가입

	public int InsertMember(Connection conn, Member member) {

		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO TBL_User(user_id,user_pw,user_name,user_phone,user_email) VALUES (?,?,?,?,?)";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUser_id());
			pstmt.setString(2, member.getUser_pw());
			pstmt.setString(3, member.getUser_name());
			pstmt.setString(4, member.getUser_phone());
			pstmt.setString(5, member.getUser_email());

			result = pstmt.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	// 2-회원정보조회 for 로그인/회원정보 수정

	public Member findMemberById(Connection conn, String user_id) {

		PreparedStatement pstmt = null;
		Member member = null;
		ResultSet rs = null;

		String query = "SELECT * FROM TBL_User WHERE user_id = ?";
		try {

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				member = new Member();
				member.setUser_id(rs.getString("user_id"));
				member.setUser_pw(rs.getString("user_pw"));
				member.setUser_name(rs.getString("user_name"));
				member.setUser_phone(rs.getString("user_phone"));
				member.setUser_email(rs.getString("user_email"));
			}

			return member;

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close(rs);
			close(pstmt);
		}
		return member;
	}

	// 3-회원정보 수정

	public int updateMember(Connection conn, Member member) {

		PreparedStatement pstmt = null;
		int result = 0;
		String user_id = member.getUser_id();
		System.out.println(user_id);
		String query = "UPDATE TBL_User "
				+ "SET user_pw= ? , user_name= ?, user_phone= ? , user_email= ? WHERE user_id = ? ";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUser_pw());
			pstmt.setString(2, member.getUser_name());
			pstmt.setString(3, member.getUser_phone());
			pstmt.setString(4, member.getUser_email());
			pstmt.setString(5, member.getUser_id());

			result = pstmt.executeUpdate();
			return result;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(pstmt);
		}

		return result;
	}

	// 4-예매내역(현)

	public List<TicketBookList> getTicketBookList(Connection conn, String user_id) {
//		private int Ticketing_no;
//		private String user_id;
//		private String prfid;
//		private String prfnm;
//		private Date PreviewDate;
//		private Date TicketingDate;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<TicketBookList> tblList = new ArrayList<>();

		String query = "SELECT * FROM TBL_Ticketing WHERE user_id = ? AND PreviewDate >= SYSDATE ORDER BY Ticketing_no DESC ";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				TicketBookList tbl = new TicketBookList();

				tbl.setTicketing_no(rs.getInt("Ticketing_no"));
				tbl.setUser_id(user_id);
				tbl.setPrfid(rs.getString("prfid"));
				tbl.setPrfnm(rs.getString("prfnm"));
				tbl.setPreviewDate(rs.getString("PreviewDate"));
				tbl.setTicketingDate(rs.getDate("TicketingDate"));
				tbl.setPrice(rs.getString("price"));
				tbl.setPersonCount(rs.getString("personCount"));

				tblList.add(tbl);
			}

			return tblList;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return null;
	}

	// 5- 과거예매내역
	public List<TicketBookList> getTicketBookListPast(Connection conn, String user_id) {
//		private int Ticketing_no;
//		private String user_id;
//		private String prfid;
//		private String prfnm;
//		private Date PreviewDate;
//		private Date TicketingDate;

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<TicketBookList> tblList = new ArrayList<>();

		String query = "SELECT * FROM TBL_Ticketing WHERE user_id = ? AND PreviewDate < SYSDATE ORDER BY Ticketing_no DESC ";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				TicketBookList tbl = new TicketBookList();

				tbl.setTicketing_no(rs.getInt("Ticketing_no"));
				tbl.setUser_id(user_id);
				tbl.setPrfid(rs.getString("prfid"));
				tbl.setPrfnm(rs.getString("prfnm"));
				tbl.setPreviewDate(rs.getString("PreviewDate"));
				tbl.setTicketingDate(rs.getDate("TicketingDate"));
				tbl.setPrice(rs.getString("price"));
				tbl.setPersonCount(rs.getString("personCount"));
				
				tblList.add(tbl);
			}

			return tblList;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return null;
	}


	public List<DipLike> getDipLikeList(Connection conn, String user_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		List<DipLike> dlList = new ArrayList<>();

		String query = "SELECT * FROM TBL_Like WHERE user_id = ?";
		try {

			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				DipLike dl = new DipLike();

				dl.setLike_no(rs.getInt("Like_no"));
				dl.setPrfid(user_id);
				dl.setPrfid(rs.getString("prfid"));
				dl.setPrfnm(rs.getString("prfnm"));
				dl.setLike_date(rs.getDate("Like_date"));

				dlList.add(dl);
			}

			return dlList;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return dlList;
	}

	// 7- 찜 인서트
	/*
	 * INSERT INTO TBL_Like(Like_no,user_id,id,PerfNm,Like_date) VALUES
	 * (1,'id','perfId','perfNm',sysdate) WHERE user_id = 'user00';
	 */

	public int InsertDipLikeList(Connection conn, DipLike dipLike) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "INSERT INTO TBL_Like(Like_no,user_id,prfid,prfnm,Like_date) "
				+ "VALUES(SEQ_Like.NEXTVAL,?,?,?,SYSDATE) ";
		try {

			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, dipLike.getUser_id());
			pstmt.setString(2, dipLike.getPrfid());
			pstmt.setString(3, dipLike.getPrfnm());

			result = pstmt.executeUpdate();

			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	// 찜해제
	public int DeleteDipLikeList(Connection conn, int like_num) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "DELETE TBL_Like WHERE Like_no = ? ";

		try {

			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, like_num);
			result = pstmt.executeUpdate();
			return result;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	/*
	 * CREATE TABLE TBL_RCommnet ( --리뷰게시판 댓글 RCommentNum NUMBER PRIMARY KEY,
	 * ReviewNum NUMBER, user_id VARCHAR2(1000) NOT NULL, RCContent VARCHAR2(3000)
	 * NULL, RCCreateDate DATE NULL
	 */
//
//CREATE TABLE TBL_Review ( -- 리뷰게시판 
//	ReviewNum  NUMBER   PRIMARY KEY,
//	user_id	    VARCHAR2(1000) NOT NULL,
//	RTitle	        VARCHAR2(1000)	NULL,
//	RContent 	VARCHAR2(3000)	NULL,
//	Star	        VARCHAR2(100)	NULL,
//	RReadCount	NUMBER	NULL,
//	RCreateDate	DATE	NULL
	// 리뷰목록조회
	public List<Review> getReviewsByUserId(Connection conn, String user_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Review> reviewList = new ArrayList<>();
		String query = "SELECT * FROM TBL_Review WHERE user_id = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Review review = new Review();
				review.setReviewnum(rs.getInt("ReviewNum"));
				review.setUser_id(user_id);
				review.setRtitle(rs.getString("RTitle"));
				review.setRcontent(rs.getString("RContent"));
				review.setStar(rs.getString("Star"));
				review.setRreadCount(rs.getInt("RReadCount"));
				review.setRcreateDate(rs.getDate("RCreateDate"));

				reviewList.add(review);
			}

			return reviewList;

		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			close(rs);
			close(pstmt);
		}
		return reviewList;
	}


	public int insertBookTicket(Connection conn, TicketBookList tbl) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = "INSERT INTO TBL_Ticketing(Ticketing_no,user_id,prfid,prfnm,PreviewDate, price, personCount, TicketingDate) "
				+ "VALUES(SEQ_Ticket.NEXTVAL, ?,?,?,?,?,?, SYSDATE) ";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, tbl.getUser_id());
			pstmt.setString(2, tbl.getPrfid());
			pstmt.setString(3, tbl.getPrfnm());
			pstmt.setString(4, tbl.getPreviewDate());
			pstmt.setString(5, tbl.getPrice());
			pstmt.setString(6, tbl.getPersonCount());

			result = pstmt.executeUpdate();

			return result;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 예매 취소하기
	public int deleteBookTicket(Connection conn, int ticketing_no) {

		PreparedStatement pstmt = null;
		int result = 0;
		String query = "DELETE FROM TBL_Ticketing WHERE Ticketing_no = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, ticketing_no);

			result = pstmt.executeUpdate();

			return result;

		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			close(pstmt);
		}

		return result;
	}

	// 내 무느이 내역
	public List<Qna> findMyQnaList(Connection conn, String user_id){
		List<Qna> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query ="SELECT * FROM TBL_Question WHERE WRITER_ID = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Qna qna = new Qna();
				qna.setNo(rs.getInt("NO"));
				qna.setWriter_id(rs.getString("WRITER_ID"));
				qna.setTitle(rs.getString("TITLE"));
				qna.setContent(rs.getString("CONTENT"));
				qna.setType(rs.getString("TYPE"));
				qna.setReadCount(rs.getInt("READCOUNT"));
				qna.setStatus(rs.getString("STATUS"));
				qna.setCreate_date(rs.getDate("CREATE_DATE"));
				qna.setModify_date(rs.getDate("MODIFY_DATE"));
				
				list.add(qna);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}

		return list;
	}
	
	// 예매 번호로 예매 내역 조회
	
	public TicketBookList findTicketBookListByNo(Connection conn, int ticketing_no) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		TicketBookList tbl = new TicketBookList();
		String query = "SELECT * FROM TBL_Ticketing WHERE Ticketing_no = ? ";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, ticketing_no);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				tbl.setTicketing_no(rs.getInt("Ticketing_no"));
				tbl.setUser_id(rs.getString("user_id"));
				tbl.setPrfid(rs.getString("prfid"));
				tbl.setPrfnm(rs.getString("prfnm"));
				tbl.setPreviewDate(rs.getString("PreviewDate"));
				tbl.setTicketingDate(rs.getDate("TicketingDate"));
				tbl.setPrice(rs.getString("price"));
				tbl.setPersonCount(rs.getString("personCount"));
				return tbl;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return tbl;
	}
	
	
}
