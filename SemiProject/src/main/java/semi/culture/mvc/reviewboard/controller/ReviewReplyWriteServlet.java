package semi.culture.mvc.reviewboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.mvc.member.model.vo.Member;
import semi.culture.mvc.reviewboard.model.service.ReviewService;
import semi.culture.mvc.reviewboard.model.vo.ReviewReply;

@WebServlet("/reply_write")
public class ReviewReplyWriteServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	ReviewService service = new ReviewService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		try {
			String reply = req.getParameter("reply");
			int reviewNum = Integer.parseInt(req.getParameter("reviewNum"));
			Member member = getSessionMember(req);
			
			ReviewReply reviewReply = new ReviewReply();
			reviewReply.setRccontent(reply);
			reviewReply.setReviewnum(reviewNum);
			reviewReply.setUser_id(member.getUser_id());
			
			int result = service.insertCommnet(reviewReply);
			
			if(result>0) {
				sendCommonPage("리플이 등록되었습니다.", "/review_view?reviewNum="+reviewNum, req, resp);
				return;
			}else {
				sendCommonPage("리플이 등록에 실패했습니다. 운영팀에 문의 바랍니다.", "/review_view?reviewNum="+reviewNum, req, resp);
			}
			
		} catch(Exception e) {}
		
	}

	@Override
	public String getServletName() {
		return "ReviewReplyWriteServlet";
	}
	
	

}
