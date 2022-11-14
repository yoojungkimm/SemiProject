package semi.culture.mvc.reviewboard.model.service;
import static semi.culture.common.jdbc.JDBCTemplate.close;
import static semi.culture.common.jdbc.JDBCTemplate.commit;
import static semi.culture.common.jdbc.JDBCTemplate.getConnection;
import static semi.culture.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import semi.culture.common.util.PageInfo;
import semi.culture.mvc.reviewboard.model.dao.ReviewDAO;
import semi.culture.mvc.reviewboard.model.vo.Review;
import semi.culture.mvc.reviewboard.model.vo.ReviewReply;

public class ReviewService {
	
	ReviewDAO dao = new ReviewDAO();
	
	// 리뷰 쓰기
	public int insertReview(Review review) {
		
		int result = 0;
		Connection conn = getConnection();
		
		result = dao.insertReview(conn, review);
		
		if(result>0) {
			System.out.println("success");
			commit(conn);
			
		}else {
			System.out.println("fail");
			rollback(conn);
		}
		
		close(conn);
			
		return result;
	}
	
	// 리뷰 상세글 조회하기
	public Review findReviewByNo(int reviewnum, boolean counting) {
		
		Review review = null;
		Connection conn = getConnection();
		
		review = dao.findReviewByNo(conn, reviewnum);
		
		if(counting) {
			dao.updateReviewCount(conn, review);
		}
		
		if(review == null) {
			System.out.println("fail");
		}else {
			System.out.println("success");
		}
		
		close(conn);
		
		return review;
	}
	
	// 리뷰 댓글 조회
	public List<ReviewReply> getCommnetByNo(int reviewnum){
		
		Connection conn = getConnection();
		
		List<ReviewReply> list = dao.getCommnetByNo(conn, reviewnum);
		
		if(list!=null) {
			System.out.println("success");
		}else {
			System.out.println("fail");
		}
		close(conn);
		return list;
		
	}
	
	// 리뷰 조회수 카운트
	public int updateReviewCount(Review review) {
		
		int result = 0;
		Connection conn = getConnection();
		
		result = dao.updateReviewCount(conn, review);
		
		if(result>0) {
			System.out.println("okkk");
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	// 리뷰 댓글 작성
	public int insertCommnet(ReviewReply comment) {
		
		int result = 0;
		Connection conn = getConnection();
		
		result = dao.insertCommnet(conn, comment);
		
		if(result>0) {
			System.out.println("okkkkkkkk");
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 리뷰 삭제
	public int deleteReview(int reviewNum) {
		
		int result = 0;
		Connection conn = getConnection();
		
		result = dao.deleteReview(conn, reviewNum);
		if(result>0) {
			System.out.println("okkkkkkkk");
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	// 리뷰 댓글 삭제
	public int deleteReviewComment(int rcommentNum) {
		int result = 0;
		Connection conn = getConnection();
		
		result = dao.deleteReviewComment(conn, rcommentNum);
		if(result>0) {
			System.out.println("okkkkkkkk");
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	// 리뷰 전체 리스트 가져오기
	public List<Review> findAll(PageInfo pageInfo) {
		
		List<Review> list = new ArrayList<>();
		Connection conn = getConnection();
		list = dao.findAll(conn, pageInfo);
		
		if(list!=null) {
			System.out.println("대따댔어");
		}else {
			System.out.println("ㅠㅠ");
		}
		
		close(conn);
		
		return list;
		
	}
	// 전체 리뷰 게시글 수
	public int findAllCountReview() {
		Connection conn = getConnection();
		int result = 0;
		
		result = dao.findAllCountReview(conn);
		
		if(result>0) {
			System.out.println("okk");
		}else {
			System.out.println("nono");
		}
		
		return result;
		
	}
	
	//리뷰업뎃
	public int UpdateReview(Review review) {
		Connection conn = getConnection();
		int result = 0;
		
		result = dao.UpdateReview(conn,review);
		
		if(result>0) {
			System.out.println("okk");
			commit(conn);
		}else {
			System.out.println("nono");
			rollback(conn);
		}
		return result;
	}
	
	//리뷰댓 하나 가져오기
	public ReviewReply getReviewReplyByCommentNum(int rcommentNum) {
		Connection conn = getConnection();
		ReviewReply reviewReply= dao.getReviewReplyByCommentNum(conn, rcommentNum);
		
		if(reviewReply!=null) {
			System.out.println("대따댔어");
		}else {
			System.out.println("ㅠㅠ");
		}
		
		close(conn);
		
		return reviewReply;
	}
	
	public static void main(String[] args) {
		
		ReviewService rs = new ReviewService();
		ReviewReply rr = rs.getReviewReplyByCommentNum(6);
		System.out.println(rr);
		
		
	}
	
}
