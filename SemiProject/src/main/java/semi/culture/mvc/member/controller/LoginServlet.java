package semi.culture.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.mvc.member.model.service.MemberService;
import semi.culture.mvc.member.model.vo.Member;

@WebServlet("/login")
public class LoginServlet extends MyHttpServlet{
	
	MemberService service = new MemberService();

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("login servlet in");
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		
		Member member = service.findMemberById(id);
		
		if(member == null) {
			System.out.println("그런 회원 없습니다,");
			req.setAttribute("msg", "아이디가 존재 하지 않습니다.");
			req.getRequestDispatcher("/login.jsp").forward(req, resp);
			
		}
		if(member.getUser_pw().equals(pwd)) {
			System.out.println("login success");
			HttpSession session = req.getSession();
			session.setAttribute("loginMember", member);
			resp.sendRedirect(req.getContextPath() + "/main2");
		}else {
			sendCommonPage("비밀번호가 맞지 않습니다.", "/login.jsp", req, resp);
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath() + "/login.jsp");
	}

	
	@Override
	public String getServletName() {
		return "LoginServlet";
	}
}
