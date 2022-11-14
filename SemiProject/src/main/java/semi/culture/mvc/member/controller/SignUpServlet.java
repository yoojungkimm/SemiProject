package semi.culture.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.mvc.member.model.service.MemberService;
import semi.culture.mvc.member.model.vo.Member;

@WebServlet("/enroll")
public class SignUpServlet extends MyHttpServlet{

	private static final long serialVersionUID = 1L;
	MemberService service = new MemberService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.sendRedirect(req.getContextPath()+"/signup.jsp");
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("회원가입 서블릿 들어옴");
		req.setCharacterEncoding("utf-8");
		resp.setCharacterEncoding("utf-8");
		
		Member member = new Member();
		
		String user_id = req.getParameter("user_id");
		String pwd = req.getParameter("pwd");
		String userName = req.getParameter("userName");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		
		member.setUser_id(user_id);
		member.setUser_pw(pwd);
		member.setUser_name(userName);
		member.setUser_phone(phone);
		member.setUser_email(email);
		
		int result = service.insertMember(member);
		
		if(result>0) {
			req.setAttribute("userName", userName);
			req.getRequestDispatcher("/signIn.jsp").forward(req, resp);
		}else {
			sendCommonPage("회원가입에 실패했습니다","/main2.jsp", req, resp);
		}
		
		
		
	}
	@Override
	public String getServletName() {
		return "SignUpServlet";
	}

}
