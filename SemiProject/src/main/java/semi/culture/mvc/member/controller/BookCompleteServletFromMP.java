package semi.culture.mvc.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.mvc.member.model.service.MemberService;
import semi.culture.mvc.member.model.vo.TicketBookList;

@WebServlet("/bookComplete")
public class BookCompleteServletFromMP extends MyHttpServlet{

	private static final long serialVersionUID = 1L;
	MemberService service = new MemberService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("bookCompleteServlet In");
		
		int ticketing_no = Integer.parseInt(req.getParameter("ticketing_no"));
		
		String user_id = req.getParameter("user_id");
		
		TicketBookList ticketBook = new TicketBookList();
		List<TicketBookList> tblList = service.getTicketBookList(user_id);
		for(TicketBookList tble : tblList) {
			if(tble.getTicketing_no() == ticketing_no) {
				ticketBook = tble;
			}
		}
		
		req.setAttribute("ticketBook", ticketBook);
		System.out.println(ticketBook);
		
		String date = ticketBook.getPreviewDate().substring(0,10);
		ticketBook.setPreviewDate(date);
		req.getRequestDispatcher("/bookCompleteFromMP.jsp").forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	@Override
	public String getServletName() {
		return "BookCompleteServletFromMP";
	}

}
