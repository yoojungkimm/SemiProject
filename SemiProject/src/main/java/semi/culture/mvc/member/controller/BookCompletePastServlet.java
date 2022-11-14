package semi.culture.mvc.member.controller;

import java.io.IOException;

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

@WebServlet("/bookComplete2")
public class BookCompletePastServlet extends MyHttpServlet {

	private static final long serialVersionUID = 1L;
	MemberService service = new MemberService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

		Member loginMember = (Member) session.getAttribute("loginMember");

		String userIdCheck = req.getParameter("user_id");
		
		if (userIdCheck.equals(loginMember.getUser_id()) == false) {
			resp.sendRedirect(req.getContextPath() + "/login.jsp");
		}
		
		int ticketing_no = Integer.parseInt(req.getParameter("ticketing_no"));
		
		TicketBookList tbl = service.findTicketBookListByNo(ticketing_no);
		String date = tbl.getPreviewDate().substring(0,10);
		tbl.setPreviewDate(date);
		
		req.setAttribute("tbl", tbl);
		
		req.getRequestDispatcher("/bookCompletePast.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	@Override
	public String getServletName() {
		return "BookCompletePastServlet";
	}

}
