package semi.culture.mvc.reviewboard.model.dao;

import static semi.culture.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import semi.culture.common.util.PageInfo;
import semi.culture.mvc.reviewboard.model.vo.Review;
import semi.culture.mvc.reviewboard.model.vo.ReviewReply;

public class ReviewDAO {

	// 리뷰 쓰기
	public int insertReview(Connection conn, Review review) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO TBL_Review(ReviewNum,user_id,RTitle,RContent,Star,RReadCount,RCreateDate) "
				+ "VALUES(SEQ_Rev.NEXTVAL,?,?,?,?,0,SYSDATE) ";

		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, review.getUser_id());
			pstmt.setString(2, review.getRtitle());
			pstmt.setString(3, review.getRcontent());
			pstmt.setString(4, review.getStar());

			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 리뷰 업데이트 하기
	
	public int UpdateReview(Connection conn, Review review) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "UPDATE TBL_Review SET RTitle = ?, RContent = ? ,Star = ? WHERE ReviewNum = ? ";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, review.getRtitle());
			pstmt.setString(2, review.getRcontent());
			pstmt.setString(3, review.getStar());
			pstmt.setInt(4, review.getReviewnum());
			
			result = pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	// 리뷰 상세글 조회하기
	public Review findReviewByNo(Connection conn, int reviewnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Review review = null;
		String query = "SELECT * FROM TBL_Review WHERE ReviewNum = ? ";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reviewnum);
			rs = pstmt.executeQuery(); // 던짐
			System.out.println("22");
			review = new Review();
			while(rs.next()) {
				review.setReviewnum(rs.getInt("ReviewNum"));
				review.setUser_id(rs.getString("user_id"));
				review.setRtitle(rs.getString("RTitle"));
				review.setRcontent(rs.getString("RContent"));
				review.setStar(rs.getString("Star"));
				review.setRreadCount(rs.getInt("RReadCount"));
				review.setRcreateDate(rs.getDate("RCreateDate"));
				
				System.out.println("22");

			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return review;
	}

	// 리뷰 댓글 조회
	public List<ReviewReply> getCommnetByNo(Connection conn, int reviewnum) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ReviewReply> list = new ArrayList<ReviewReply>();
		String query = "SELECT RCommentNum, ReviewNum, user_id, RCContent, RCCreateDate FROM tbl_rcommnet WHERE ReviewNum=? "
						+"ORDER BY RCommentNum DESC ";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reviewnum);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewReply commnet = new ReviewReply();
				commnet.setRcommentnum(rs.getInt("RCommentNum"));
				commnet.setReviewnum(rs.getInt("ReviewNum"));
				commnet.setUser_id(rs.getString("user_id"));
				commnet.setRccontent(rs.getString("RCContent"));
				commnet.setRccreatedate(rs.getDate("RCCreateDate"));

				list.add(commnet);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return list;
	}

	// 리뷰 조회수 카운트
	public int updateReviewCount(Connection conn, Review review) {
		PreparedStatement pstmt = null;
		String query = "UPDATE TBL_Review SET RReadCount = ? WHERE ReviewNum = ?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, review.getRreadCount() + 1);
			pstmt.setInt(2, review.getReviewnum());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 리뷰 댓글 작성
	public int insertCommnet(Connection conn, ReviewReply comment) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO TBL_RCommnet(RCommentNum, ReviewNum, user_id, RCContent, RCCreateDate) "
				+ "VALUES(SEQ_RevComment.NEXTVAL, ?, ?, ?, SYSDATE) ";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, comment.getReviewnum());
			pstmt.setString(2, comment.getUser_id());
			pstmt.setString(3, comment.getRccontent());

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 리뷰 삭제
	public int deleteReview(Connection conn, int reviewNum) {
		PreparedStatement pstmt = null;
		String query = "DELETE FROM TBL_Review WHERE ReviewNum = ?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, reviewNum);

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 리뷰 댓글 삭제
	public int deleteReviewComment(Connection conn, int rcommentNum) {
		PreparedStatement pstmt = null;
		String query = "DELETE FROM tbl_rcommnet WHERE RCommentNum = ?";
		int result = 0;

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setInt(1, rcommentNum);

			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	// 리뷰 댓글 하나 가져오기 
	
	public ReviewReply getReviewReplyByCommentNum(Connection conn, int rcommentNum) {
		PreparedStatement pstmt = null;
		ReviewReply reviewReply = new ReviewReply();
		ResultSet rs = null;
		String query = "SELECT * FROM tbl_rcommnet WHERE RCommentNum = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rcommentNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				reviewReply.setUser_id(rs.getString("user_id"));
				reviewReply.setReviewnum(rs.getInt("ReviewNum"));
				reviewReply.setRccontent(rs.getString("RCContent"));
				reviewReply.setRccreatedate(rs.getDate("RCCreateDate"));
				reviewReply.setRcommentnum(rcommentNum);
			}
			return reviewReply;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return reviewReply;
		
	}

	// 리뷰 전체 리스트 가져오기
	public List<Review> findAll(Connection conn, PageInfo pageInfo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Review> list = new ArrayList<Review>();
		String query = "SELECT RNUM, ReviewNum, user_id, RTitle, Star, RContent, RReadCount, RCreateDate FROM " 
				+"(SELECT ROWNUM AS RNUM, ReviewNum, user_id, RTitle, Star, RContent, RReadCount, RCreateDate FROM TBL_Review ORDER BY ReviewNum DESC) "
				+" WHERE RNUM BETWEEN  ? AND ? ";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Review review = new Review();
				review.setReviewnum(rs.getInt("ReviewNum"));
				review.setUser_id(rs.getString("user_id"));
				review.setRtitle(rs.getString("RTitle"));
				review.setRcontent(rs.getString("RContent"));
				review.setStar(rs.getString("Star"));
				review.setRreadCount(rs.getInt("RReadCount"));
				review.setRcreateDate(rs.getDate("RCreateDate"));

				list.add(review);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return list;
	}
	
	//전체 리뷰 개수
	public int findAllCountReview(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		String query = "SELECT COUNT(*) FROM TBL_Review";
		
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

}
