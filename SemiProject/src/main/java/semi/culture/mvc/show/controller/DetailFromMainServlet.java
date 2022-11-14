package semi.culture.mvc.show.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
import semi.culture.mvc.show.model.vo.Stadium;

@WebServlet("/detailFromMain")
public class DetailFromMainServlet extends MyHttpServlet {

	private static final long serialVersionUID = 1L;
	ShowService service = new ShowService();
	ReviewService reviewService = new ReviewService();
	MemberService memberService = new MemberService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String prfmid = req.getParameter("prfmid");
		ShowDetail showDetail = service.getShowDetailByPrfmId(prfmid);
		System.out.println(showDetail);

		Stadium stadium = service.getStadiumByHallId(showDetail.getHall_id());
		System.out.println(stadium);

		String category = "연극";
		if (showDetail.getGenrenm() != null) {
			category = showDetail.getGenrenm();
		}
		List<ShowDetail> showList = new ArrayList<>();

		switch (category) {

		case "클래식":
			showList = service.ClassicAllList();
			break;
		case "연극":
			showList = service.DramaAllList();
			break;
		case "뮤지컬":
			showList = service.MuAllList();
			break;
		case "국악":
			showList = service.KoreanAllList();
			break;

		}

		List<DipLike> dipLike = null;
		// 만약에 로그인 상태면 찜록 업어가
		try {
			Member member = getSessionMember(req);

			if (member != null) {
				dipLike = memberService.getDipLikeList(member.getUser_id());
				req.setAttribute("dipLike", dipLike);
			}
		} catch (Exception e) {
		}

		PageInfo pageInfo = new PageInfo(1, 10, reviewService.findAllCountReview(), 10);
		List<Review> reviewList = reviewService.findAll(pageInfo);
		req.setAttribute("showDetail", showDetail);
		req.setAttribute("stadium", stadium);
		req.setAttribute("showList", showList);
		req.setAttribute("reviewList", reviewList);

		req.getRequestDispatcher("/detailFromMain.jsp").forward(req, resp);
	}

	@Override
	public String getServletName() {

		return "DetailFromMainServlet";
	}

}
