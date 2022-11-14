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

@WebServlet("/QnA_edit")
public class QnaEditServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	private QnaService service = new QnaService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member loginMember = getSessionMember(req);
		
		
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		Qna board = service.findBoardByNo(boardNo, false);
		
		if(loginMember.getUser_id().equals(board.getWriter_id()) == false) { // 작성자 확인
			sendCommonPage("수정 권환이 없습니다.", "/QnaView?boardNo="+boardNo, req, resp);
		} else {
			
			req.setAttribute("board", board);
			req.getRequestDispatcher("/QnA_edit.jsp").forward(req, resp);
		}
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			Member loginMember = getSessionMember(req);
			
			if(loginMember == null) {
				sendCommonPage("로그인 후 이용해주세요.", "/QnA_list", req, resp);
			}
		try {
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			Qna board = service.findBoardByNo(boardNo, false);
			
			
			
			board.setNo(Integer.parseInt(req.getParameter("boardNo")));
			board.setTitle(req.getParameter("title"));
			board.setWriter_id(req.getParameter("writer"));
			board.setContent(req.getParameter("content"));
			
			System.out.println(board);
			
			
			
			int result = service.save(board); // DB에 update
			
			if(result > 0) {
				sendCommonPage("게시글이 정상적으로 업데이트 되었습니다.", "/QnA_list", req, resp);
			}else {
				sendCommonPage("게시글을 업데이트 할수 없습니다!! (code=202)", "/QnA_list", req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("게시글을 수정할수 없습니다.(code=203)", "/QnA_list", req, resp);
		}
	}

	@Override
	public String getServletName() {
		return "QnaEditServlet";
	}
}
