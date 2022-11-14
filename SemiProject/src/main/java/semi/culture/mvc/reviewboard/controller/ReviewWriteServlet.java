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

@WebServlet("/review_write")
public class ReviewWriteServlet extends MyHttpServlet{
	ReviewService service = new ReviewService();
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Member member = null;
		try {
			member = getSessionMember(req);
		}catch(Exception e) {}
		
		if(member == null) {
			sendCommonPage("회원만이 리뷰를 작성할 수 있습니다", "/login", req, resp);
			return;
		}
		
		req.getRequestDispatcher("/review_write.jsp").forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		Member member = getSessionMember(req);
		String title = "";
		String content = "";
		String writer = "";
		String rating = "";
		try {
			
			title = req.getParameter("title");
			content = req.getParameter("content");
			writer = req.getParameter("writer");
			rating = req.getParameter("rating");
			
			if(writer.equals(member.getUser_id())==false) {
				sendCommonPage("포스팅이 거절 되었습니다.", "/review_list", req, resp);
				return;
			}
			
			Review review = new Review();
			
			review.setRtitle(title);
			review.setRcontent(content);
			review.setStar(rating);
			review.setUser_id(writer);
			System.out.println(review);
			
			int result = service.insertReview(review);
			
			if(result>0) {
				sendCommonPage("포스팅이 완료되었습니다.", "/review_list", req, resp);
			}else {
				sendCommonPage("포스팅이 실패했습니다. 운영팀으로 문의바랍니다.", "/review_list", req, resp);
			}
			
		}catch(Exception e) {}
		
		
	}
	@Override
	public String getServletName() {
		return "ReviewWriteServlet";
	}
	
	

}
