package semi.culture.mvc.noticeboard.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.mvc.member.model.vo.Member;
import semi.culture.mvc.noticeboard.model.service.NoticeService;
import semi.culture.mvc.noticeboard.model.vo.Notice;

@WebServlet("/noticeWrite")
public class NoticeWriteServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	private NoticeService service = new NoticeService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Member loginMember = getSessionMember(req);
			if(loginMember.getUser_id().equals("admina")) {
				// 정상 흐름
				req.getRequestDispatcher("/notice_write.jsp").forward(req, resp);
				return;
			}
		} catch (Exception e) {}
		sendCommonPage("관리자만 이용할 수 있습니다.", "/notice_list", req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			Notice notice = new Notice();
			notice.setNoticeTitile(req.getParameter("title").strip()); // white space 정리, null 방지
			notice.setNoticeContent(req.getParameter("content"));
			System.out.println(notice);
			
			int result = service.insertNotice(notice); // DB에 게시글 저장
			
			if(result > 0) {
				sendCommonPage("게시글이 정상적으로 등록되었습니다.", "/notice_list", req, resp);
			}else {
				sendCommonPage("게시글 등록에 실패하였습니다. (code=102)", "/notice_list", req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("정상적으로 처리할수 없습니다. (code=103)",  "/notice_list", req, resp);
		}
	}

	@Override
	public String getServletName() {
		return "NoticeWrite";
	}
}
