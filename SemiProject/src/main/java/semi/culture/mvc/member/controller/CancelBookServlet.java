package semi.culture.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.mvc.member.model.service.MemberService;
@WebServlet("/cancelBook")
public class CancelBookServlet extends MyHttpServlet{
	MemberService service = new MemberService();
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("cancel servlet in");
		int ticketing_no = Integer.parseInt(req.getParameter("Ticketing_no"));
		
		int result = service.deleteBookTicket(ticketing_no);
		
		if(result>0) {
			sendCommonPage("예매가 취소되었습니다", "/bookCompleteList", req, resp);
			return;
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	@Override
	public String getServletName() {
		return "CancelBookServlet";
	}

}
