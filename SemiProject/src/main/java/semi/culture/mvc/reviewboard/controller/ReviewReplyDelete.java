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

@WebServlet("/reply_delete")
public class ReviewReplyDelete extends MyHttpServlet{

	private static final long serialVersionUID = 1L;
	ReviewService service = new ReviewService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Member member = getSessionMember(req);
		int replyNum = Integer.parseInt(req.getParameter("replyNum"));
		ReviewReply reviewReply = service.getReviewReplyByCommentNum(replyNum);
		
		if(member.getUser_id().equals(reviewReply.getUser_id())==false) {
			sendCommonPage("삭제에 실패했습니다. 운영팀에 문의 바랍니다.", "/review_list", req, resp);
			return;
		}
		
		int result = service.deleteReviewComment(replyNum);
		
		if(result>0) {
			sendCommonPage("댓글이 삭제되었습니다.","/review_view?reviewNum="+reviewReply.getReviewnum(),req,resp);
			return;
		} else {
			sendCommonPage("삭제에 실패했습니다. 운영팀에 문의 바랍니다.", "/review_list", req, resp);
		}
		
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doGet(req, resp);
	}
	
	@Override
	public String getServletName() {
		return "ReviewReplyDelete";
	}

}
