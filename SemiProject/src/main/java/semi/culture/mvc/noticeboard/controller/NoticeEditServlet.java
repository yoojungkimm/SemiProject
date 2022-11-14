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
import semi.culture.mvc.qnaboard.model.vo.Qna;

@WebServlet("/notice_edit")
public class NoticeEditServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	private NoticeService service = new NoticeService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Member loginMember = getSessionMember(req);
			int noticeNo = Integer.parseInt(req.getParameter("noticeNo"));
			Notice notice = service.findNoticeByNo(noticeNo, false);
			
			if(loginMember.getUser_id().equals("admina")) { // 관리자만 가능
				// 정상 흐름
				
				req.setAttribute("notice", notice);
				req.getRequestDispatcher("/notice_edit.jsp").forward(req, resp);
				return;
			}
			
		} catch (Exception e) {
			
		}
		sendCommonPage("관리자만 이용할 수 있습니다.", "/notice_list", req, resp);
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int noticeNo = Integer.parseInt(req.getParameter("noticeNo"));
			Notice notice = service.findNoticeByNo(noticeNo, false);
			
			
			notice.setNoticeNum(Integer.parseInt(req.getParameter("noticeNo")));
			notice.setNoticeTitile(req.getParameter("title"));
			notice.setNoticeContent(req.getParameter("content"));
			
			System.out.println(notice);
			
			
			
			int result = service.insertNotice(notice); // DB에 update
			
			if(result > 0) {
				sendCommonPage("게시글이 정상적으로 업데이트 되었습니다.", "/notice_list", req, resp);
			}else {
				sendCommonPage("게시글을 업데이트 할수 없습니다!! (code=202)", "/notice_list", req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
			sendCommonPage("게시글을 수정할수 없습니다.(code=203)", "/notice_list", req, resp);
		}
	}
	
	
	@Override
	public String getServletName() {
		return "NoticeEdit";
	}

}
