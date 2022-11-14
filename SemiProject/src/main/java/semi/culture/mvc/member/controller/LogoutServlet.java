package semi.culture.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.culture.common.util.MyHttpServlet;

@WebServlet("/logout")
public class LogoutServlet extends MyHttpServlet{


	private static final long serialVersionUID = 1L;


	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		if(session != null) {
			session.invalidate(); // 세션을 없애는 코드
		}
		sendCommonPage("로그아웃 되었습니다", "/main2", req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	
	@Override
	public String getServletName() {
		return "LogoutServlet";
	}
	
}
