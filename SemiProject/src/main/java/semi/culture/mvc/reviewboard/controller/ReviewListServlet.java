package semi.culture.mvc.reviewboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.common.util.PageInfo;
import semi.culture.mvc.reviewboard.model.service.ReviewService;
import semi.culture.mvc.reviewboard.model.vo.Review;

@WebServlet("/review_list")
public class ReviewListServlet extends MyHttpServlet{

	private static final long serialVersionUID = 1L;
	ReviewService service = new ReviewService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		int page = 1;
		try {
			page = Integer.parseInt(req.getParameter("page"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		PageInfo pageInfo = new PageInfo(page, 10, service.findAllCountReview(), 10);
		List<Review> reviewList = service.findAll(pageInfo);
		
		if(reviewList != null && reviewList.size()>0) {
			req.setAttribute("reviewList", reviewList);
			req.setAttribute("pageInfo", pageInfo);
			req.getRequestDispatcher("/review_list.jsp").forward(req, resp);
		} else {
			sendCommonPage("", "/main2", req, resp);
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	@Override
	public String getServletName() {
		return "ReviewListServlet";
	}

}
