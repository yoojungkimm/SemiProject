package semi.culture.mvc.reviewboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.mvc.reviewboard.model.service.ReviewService;

@WebServlet("/review_delete")
public class ReviewDeleteServlet extends MyHttpServlet {
	ReviewService service = new ReviewService();
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int reviewNum = Integer.parseInt(req.getParameter("reviewNum"));
			int result = service.deleteReview(reviewNum);
			if(result > 0) {
				sendCommonPage("리뷰가 삭제되었습니다", "/review_list", req, resp);
				return;
			}else {
				sendCommonPage("게시글 삭제에 실패했습니다. 운영팀에 문의 바랍니다.", "review_list", req, resp);
			}
		} catch (Exception e) {
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}
	
	@Override
	public String getServletName() {
		
		return "ReviewDeleteServlet";
	}
	
	

}
