package semi.culture.mvc.reviewboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.mvc.reviewboard.model.service.ReviewService;
import semi.culture.mvc.reviewboard.model.vo.Review;
import semi.culture.mvc.reviewboard.model.vo.ReviewReply;

@WebServlet("/review_view")
public class ReviewViewServlet extends MyHttpServlet{
	ReviewService service = new ReviewService();
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int reviewNum = Integer.parseInt(req.getParameter("reviewNum"));
			List<ReviewReply> replyList = service.getCommnetByNo(reviewNum);
			Review review = service.findReviewByNo(reviewNum,true);
			if(review == null) {
				sendCommonPage("게시글 조회에 실패했습니다.", "/review_list", req, resp);
				return;
				
			}
			req.setAttribute("replyList", replyList);
			req.setAttribute("review", review);
			req.getRequestDispatcher("/review_view.jsp").forward(req, resp);
			
		}catch(Exception e) {}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	@Override
	public String getServletName() {
		return "ReviewViewServlet";
	}

}
