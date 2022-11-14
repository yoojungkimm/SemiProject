package semi.culture.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.mvc.member.model.service.MemberService;
import semi.culture.mvc.member.model.vo.Member;

@WebServlet("/Memberupdate")
public class MemberUpdateServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	MemberService service = new MemberService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 세션 정보 체크해서 세션 없으면 로그인 페이지로 있으면 멤버 정보 가지고 화면이동
		
		Member member = getSessionMember(req);
		
		if(member == null) {
			sendCommonPage("로그인이 필요합니다.", "/login.jsp", req, resp);
		} else {
			req.setAttribute("member", member);
			req.getRequestDispatcher("/update.jsp").forward(req, resp);
		}
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("업데이트 정보 넘어옴");
		req.setCharacterEncoding("utf-8");
		String userPwd = req.getParameter("userPwd");
		String userName = req.getParameter("userName");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		
		Member member = new Member();
		member.setUser_id(getSessionMember(req).getUser_id());
		member.setUser_pw(userPwd);
		member.setUser_name(userName);
		member.setUser_phone(phone);
		member.setUser_email(email);
		System.out.println(member);
		int result = service.updateMember(member);
		System.out.println(result);
		if(result>0) {
			setSessionMember(req, member);
			sendCommonPage("회원정보수정에 성공했습니다.", "/main2", req, resp);
		}else {
			sendCommonPage("회원정보수정에 실패했습니다.", "/main2", req, resp);

		}
		
	}
	
	@Override
	public String getServletName() {
		return "MemberUpdateServlet";
	}

}
