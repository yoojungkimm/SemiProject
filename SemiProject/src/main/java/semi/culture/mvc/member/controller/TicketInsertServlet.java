package semi.culture.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.mvc.member.model.service.MemberService;
import semi.culture.mvc.member.model.vo.Member;
import semi.culture.mvc.member.model.vo.TicketBookList;
import semi.culture.mvc.show.model.service.ShowService;

@WebServlet("/ticketInsert")
public class TicketInsertServlet extends MyHttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService service = new MemberService();

	@Override
	public String getServletName() {

		return "TicketInsertServlet";
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Member loginMember = getSessionMember(req);
		String seatPrice = req.getParameter("seatInfo").strip();
		String count = req.getParameter("peopleCount").strip();
		String prfid = req.getParameter("prfid");
		String total = Integer.toString(Integer.parseInt(seatPrice) * Integer.parseInt(count));
		System.out.println(seatPrice+"/"+count);
		ShowService sService = new ShowService();
		
		try {
			
			
			if (loginMember != null) { // 정상흐름
				
				TicketBookList ticketBook = new TicketBookList();
				ticketBook.setUser_id(loginMember.getUser_id());
				ticketBook.setPrfid(prfid);
				ticketBook.setPrfnm(sService.getShowDetailByPrfmId(prfid).getPrfnm());
				ticketBook.setPreviewDate(req.getParameter("day"));
				ticketBook.setPrice(total);
				ticketBook.setPersonCount(count);
				System.out.println(ticketBook);
				int result = service.insertBookTicket(ticketBook);
				
				if(result > 0) {
					
					req.setAttribute("result", result);
					req.setAttribute("loginMember", loginMember);
					req.setAttribute("price", total);
					req.setAttribute("count", count);
					req.setAttribute("ticketBook", ticketBook);
					req.getRequestDispatcher("/bookComplete.jsp").forward(req, resp);
					return;
				} else {
					sendCommonPage("예매가 실패했습니다. (code=102)", "/showSelect?prfid="+prfid, req, resp);
				}
				
				return;
			}
		} catch (Exception e) {
		}
		sendCommonPage("로그인 후 사용할 수 있습니다.", "/showSelect?prfid="+prfid, req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		doGet(req, resp);
		
//		try {
//			Member loginMember = getSessionMember(req);
//
//			if (loginMember == null) {
//				sendCommonPage("잘못된 접근입니다. (code=101)", "/", req, resp);
//				return;
//			}
//			
//			TicketBookList ticketBook = new TicketBookList();
//			ticketBook.setUser_id(req.getParameter("user_id"));
//			ticketBook.setPrfid(req.getParameter("prfid"));
//			ticketBook.setPrfnm(req.getParameter("prfnm"));
//			ticketBook.setPreviewDate(req.getParameter("day"));
//			
//			int result = service.insertBookTicket(ticketBook);
//					
//			if(result > 0) {
//				sendCommonPage("예매가 성공적으로 완료되었습니다", "/", req, resp);
//			} else {
//				sendCommonPage("예매가 실패했습니다. (code=102)", "/", req, resp);
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//			sendCommonPage("정상적으로 처리할수 없습니다. (code=103)",  "/", req, resp);
//		}
	}

}
