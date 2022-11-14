package semi.culture.mvc.reviewboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.mvc.member.model.vo.Member;
import semi.culture.mvc.reviewboard.model.service.ReviewService;
import semi.culture.mvc.reviewboard.model.vo.Review;

@WebServlet("/review_update")
public class ReviewUpdateServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	ReviewService service = new ReviewService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			int reviewNum = Integer.parseInt(req.getParameter("reviewNum"));
			Review review = service.findReviewByNo(reviewNum, false);
			req.setAttribute("review", review);
			req.getRequestDispatcher("/review_update.jsp").forward(req, resp);
			
		}catch(Exception e) {
			
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		try {
			Member member = getSessionMember(req);
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String rating = req.getParameter("rating"); 
			int reviewNum = Integer.parseInt(req.getParameter("reviewNum"));
			
			Review review = service.findReviewByNo(reviewNum, false);
			
			if(review.getUser_id().equals(member.getUser_id())==false) {
				sendCommonPage("포스팅이 거절되었습니다","/review_list",req,resp);
			}
			
			review.setRtitle(title);
			review.setRcontent(content);
			review.setStar(rating);
			
			int result = service.UpdateReview(review);
			
			if(result>0) {
				sendCommonPage("게시글이 수정되었습니다.","/review_list" , req, resp);
				return;
			}else {
				sendCommonPage("게시글이 수정이 실패했습니다. 운영팀에 문의 바랍니다..","/review_list" , req, resp);
			}
			
			
		}catch(Exception e) {
			
		}
	}

	@Override
	public String getServletName() {
		return "ReviewUpdateServlet";
	}
	
	

}
