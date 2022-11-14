package semi.culture.mvc.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.common.util.PageInfo;
import semi.culture.mvc.member.model.service.MemberService;
import semi.culture.mvc.member.model.vo.DipLike;
import semi.culture.mvc.member.model.vo.Member;
import semi.culture.mvc.member.model.vo.TicketBookList;
import semi.culture.mvc.noticeboard.model.service.NoticeService;
import semi.culture.mvc.noticeboard.model.vo.Notice;
import semi.culture.mvc.qnaboard.model.vo.Qna;
import semi.culture.mvc.reviewboard.model.vo.Review;
import semi.culture.mvc.show.model.service.ShowService;
import semi.culture.mvc.show.model.vo.ShowDetail;

@WebServlet("/myPage")
public class MyPageServlet extends MyHttpServlet{
	
	private static final long serialVersionUID = 1L;
	MemberService service = new MemberService();
	NoticeService noticeService = new NoticeService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Mypage servlet in");
		
		HttpSession session = req.getSession();
		Member member = (Member)session.getAttribute("loginMember");
		
		
		if(member == null) {
			resp.sendRedirect(req.getContextPath()+"/login.jsp");
			return;
		}
		
		String user_id = member.getUser_id();
		PageInfo pageInfo = new PageInfo(1, 10, noticeService.findAllNoticeCount(), 10);
		List<TicketBookList> tblPresent= null;
		List<TicketBookList> tblPast = null;
		List<Review> reviewList = null;
		List<ShowDetail> dipListPrm = null;
		List<Notice> noticeList = null;
		List<Qna> myQnaList = null;
		try {
			
			// 현 예매내역
			tblPresent =  service.getTicketBookList(user_id);
			
			// 과거 예매내역
			tblPast = service.getTicketBookListPast(user_id);
			
			// 리뷰
			reviewList = service.getReviewsByUserId(user_id);
			
			// 찜
			List<DipLike> dipList = service.getDipLikeList(user_id);
			List<String> idList = new ArrayList<>();
			
			if(dipList.size()>0) {
				for(int i = 0; i<dipList.size();i++) {
					idList.add(dipList.get(i).getPrfid());
				}
			}
			dipListPrm = getPrfmDetail(idList);
			
			// 공지
			noticeList = noticeService.findNoticeList(pageInfo);
			
			// 내 문의 내역
			myQnaList = service.findMyQnaList(user_id);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		req.setAttribute("tblPresent", tblPresent);
		req.setAttribute("tblPast", tblPast);
		req.setAttribute("reviewList", reviewList);
		req.setAttribute("dipListPrm", dipListPrm);
		req.setAttribute("noticeList", noticeList);
		req.setAttribute("myQnaList", myQnaList);
		
		req.getRequestDispatcher("/myPage.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	public List<ShowDetail>getPrfmDetail(List<String> idList) {
		List<ShowDetail> list = new ArrayList<>();
		ShowService ss = new ShowService();
		for(int i = 0 ; i<idList.size() ; i++) {
			list.add(ss.getShowDetailByPrfmId(idList.get(i)));
		}
		
		return list;
	}

	@Override
	public String getServletName() {
		// TODO Auto-generated method stub
		return "MyPageServlet";
	}

}
