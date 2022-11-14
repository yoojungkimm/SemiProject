package semi.culture.mvc.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.mvc.member.model.service.MemberService;
import semi.culture.mvc.member.model.vo.Member;
import semi.culture.mvc.member.model.vo.TicketBookList;

@WebServlet("/bookCompleteList")
public class BookCompleteServlet extends MyHttpServlet {
	

	private static final long serialVersionUID = 1L;
	MemberService service = new MemberService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		Member member = (Member) session.getAttribute("loginMember");

		if (member == null) {
			resp.sendRedirect(req.getContextPath()+"/login.jsp");
			return;
		}
		
		String user_id = member.getUser_id();
		List<TicketBookList> tblList = service.getTicketBookList(user_id);
		
		req.setAttribute("tblList", tblList);
		
	
		req.getRequestDispatcher("/bookCompleteFromHeader.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	@Override
	public String getServletName() {
		return "bookCompleteServlet";
	}

}
