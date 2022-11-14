package semi.culture.mvc.qnaboard.controller;

import java.io.IOException;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.PageInfo;
import semi.culture.mvc.qnaboard.model.service.QnaService;
import semi.culture.mvc.qnaboard.model.vo.Qna;

@WebServlet("/QnA_list")
public class QnaListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private QnaService service = new QnaService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int page = 1;
		int boardCount = 0;
		PageInfo pageInfo = null;
		List<Qna> list = null;
		try {
			
			page = Integer.parseInt(req.getParameter("page"));
		} catch (Exception e) {}
		
		boardCount = service.getBoardCount();
		pageInfo = new PageInfo(page, 10, boardCount, 10);
//		pageInfo = new PageInfo(page, 4, boardCount, 10); // 페이지(하단 페이지 버튼)가 4개로 보인다.
//		pageInfo = new PageInfo(page, 10, boardCount, 20); // 게시글이 20개로 보인다.
		list = service.getBoardList(pageInfo);
		
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", pageInfo);
		req.getRequestDispatcher("/QnA_list.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
















