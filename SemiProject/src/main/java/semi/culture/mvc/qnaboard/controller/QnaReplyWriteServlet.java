package semi.culture.mvc.qnaboard.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.mvc.member.model.vo.Member;
import semi.culture.mvc.qnaboard.model.service.QnaService;
import semi.culture.mvc.qnaboard.model.vo.Qna;
import semi.culture.mvc.qnaboard.model.vo.QnaReply;

@WebServlet("/QnaReply")
public class QnaReplyWriteServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	private QnaService service = new QnaService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Member loginMember = getSessionMember(req);
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			
			//admin 계정만들어서 admin만 댓글 달도록 하기
			if(loginMember.getUser_id().equals("admina") == false) {
				sendCommonPage("리플 등록 권한이 없습니다. (401)", "/QnaView?boardNo="+boardNo , req, resp);
				return;
			}
			
			String writer = req.getParameter("writer");
			String content = req.getParameter("content");
			
			QnaReply reply = new QnaReply();
			reply.setBoard_no(boardNo);
			reply.setWriter_id(writer);
			reply.setContent(content);
			
			int result = service.saveReply(reply);
			
			
			
			if(result > 0) {
				sendCommonPage("리플 등록에 성공하였습니다.", "/QnaView?boardNo="+boardNo, req, resp);
			}else {
				sendCommonPage("리플 등록에 실패하였습니다. (402)", "/QnA_view?boardNo="+boardNo, req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("리플을 정상적으로 등록할수 없습니다. (403)", "/QnA_list" , req, resp);
		}
	}

	@Override
	public String getServletName() {
		return "QnaReplyWrite";
	}

}
