package semi.culture.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.mvc.member.model.service.MemberService;

@WebServlet("/checkId")
public class MemberCheckIdServletForAJAX extends MyHttpServlet
{
	private static final long serialVersionUID = 1L;
	
	private MemberService service = new MemberService();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		System.out.println("들어옴");
		String userId = req.getParameter("userId");
		System.out.println("중복 확인 Id : " + userId);
		
		boolean isDuplicated = service.isDuplicated(userId);
		System.out.println(isDuplicated);
		if(isDuplicated == true) { // 사용중이다.
			resp.getWriter().append("used");
		} else { // 사용안되는 중
			resp.getWriter().append("unused");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	@Override
	public String getServletName() {
		// TODO Auto-generated method stub
		return "MemberCheckIdServletForAJAX";
	}
}
