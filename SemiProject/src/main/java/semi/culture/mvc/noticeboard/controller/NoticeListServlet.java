package semi.culture.mvc.noticeboard.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.PageInfo;
import semi.culture.mvc.noticeboard.model.service.NoticeService;
import semi.culture.mvc.noticeboard.model.vo.Notice;

@WebServlet("/notice_list")
public class NoticeListServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private NoticeService service = new NoticeService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int page = 1;
		int count = 0;
		PageInfo pageInfo = null;
		List<Notice> list = null;
		try {
			
			page = Integer.parseInt(req.getParameter("page"));
		} catch (Exception e) {}
		
		count = service.findAllNoticeCount();
		pageInfo = new PageInfo(page, 10, count, 10);
//		pageInfo = new PageInfo(page, 4, boardCount, 10); // 페이지(하단 페이지 버튼)가 4개로 보인다.
//		pageInfo = new PageInfo(page, 10, boardCount, 20); // 게시글이 20개로 보인다.
		list = service.findNoticeList(pageInfo);
		
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", pageInfo);
		req.getRequestDispatcher("/notice_list.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	doGet(req, resp);
	}

}
