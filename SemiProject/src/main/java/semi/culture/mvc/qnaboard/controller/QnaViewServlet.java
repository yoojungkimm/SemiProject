package semi.culture.mvc.qnaboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.mvc.qnaboard.model.service.QnaService;
import semi.culture.mvc.qnaboard.model.vo.Qna;

@WebServlet("/QnaView")
public class QnaViewServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	private QnaService service = new QnaService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));

		Qna qna = service.findBoardByNo(boardNo, true);

		if(qna == null) {
			resp.sendRedirect(req.getContextPath() + "/");
			return;
		}
		req.setAttribute("qna", qna);
		
		req.getRequestDispatcher("/QnA_view.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
