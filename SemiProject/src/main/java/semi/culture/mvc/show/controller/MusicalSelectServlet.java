package semi.culture.mvc.show.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.common.util.PageInfo;
import semi.culture.mvc.member.model.service.MemberService;
import semi.culture.mvc.member.model.vo.DipLike;
import semi.culture.mvc.member.model.vo.Member;
import semi.culture.mvc.reviewboard.model.service.ReviewService;
import semi.culture.mvc.reviewboard.model.vo.Review;
import semi.culture.mvc.show.model.service.ShowService;
import semi.culture.mvc.show.model.vo.ShowDetail;

@WebServlet("/musicalSelect")
public class MusicalSelectServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	ShowService service = new ShowService();
	MemberService mService = new MemberService();
	ReviewService rService = new ReviewService();
	ShowService sService = new ShowService();
	PageInfo pageInfo = new PageInfo(1, 5, 10, 5);
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String prfid = req.getParameter("prfid");
		
		try {
			Member loginMember = getSessionMember(req);
			ShowDetail detail = service.getShowDetailByPrfmId(prfid);
			List<Review> review = rService.findAll(pageInfo);
			List<ShowDetail> detailList = sService.MuAllList();
			
			//기능
			if (loginMember != null) {	
			List<DipLike> dipLike = mService.getDipLikeList(loginMember.getUser_id());
			req.setAttribute("dipLike", dipLike);
			}
			
			// 세팅, 던짐
			req.setAttribute("detailList", detailList);
			req.setAttribute("review", review);
			req.setAttribute("detail", detail);
			req.getRequestDispatcher("/detail.jsp").forward(req, resp); // 던짐
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

	@Override
	public String getServletName() {
		
		return "ShowSelectServlet";
	}
}
