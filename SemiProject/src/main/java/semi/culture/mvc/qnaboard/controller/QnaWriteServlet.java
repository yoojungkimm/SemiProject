package semi.culture.mvc.qnaboard.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.mvc.member.model.vo.Member;
import semi.culture.mvc.qnaboard.model.service.QnaService;
import semi.culture.mvc.qnaboard.model.vo.Qna;

@WebServlet("/QnaWrite")
public class QnaWriteServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	public static final String SESSION_USER_ID = "loginMember";
	private QnaService service = new QnaService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Member loginMember = getSessionMember(req);
			if(loginMember != null) {
				// 정상 흐름
				req.getRequestDispatcher("/QnA_question.jsp").forward(req, resp);
				return;
			} else {
				
				sendCommonPage("로그인 이후 사용할수 있습니다.", "/QnA_list", req, resp);
			}
		} catch (Exception e) {}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
		
			Qna qna = new Qna();
			qna.setTitle(req.getParameter("title").strip()); // white space 정리, null 방지
			qna.setWriter_id(req.getParameter("writer").strip());
			qna.setContent(req.getParameter("content").trim());
			System.out.println(qna);
			
			int result = service.save(qna); // DB에 게시글 저장
			
			if(result > 0) {
				sendCommonPage("게시글이 정상적으로 등록되었습니다.", "/QnA_list", req, resp);
			}else {
				sendCommonPage("게시글 등록에 실패하였습니다. (code=102)", "/QnA_list", req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("정상적으로 처리할수 없습니다. (code=103)",  "/QnA_list", req, resp);
		}
		
		
		
	}

	@Override
	public String getServletName() {
		return "QnaWriteServlet";
	}
}
