package semi.culture.mvc.noticeboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.mvc.noticeboard.model.service.NoticeService;
import semi.culture.mvc.noticeboard.model.vo.Notice;

@WebServlet("/NoticeView")
public class NoticeViewServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private NoticeService service = new NoticeService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int NoticeNo = Integer.parseInt(req.getParameter("NoticeNo"));

		Notice notice = service.findNoticeByNo(NoticeNo,true);

		if(notice == null) {
			resp.sendRedirect(req.getContextPath() + "/");
			return;
		}
		req.setAttribute("notice", notice);
		System.out.println(notice);
		req.getRequestDispatcher("/notice_view.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
