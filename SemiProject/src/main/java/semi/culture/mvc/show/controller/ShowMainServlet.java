package semi.culture.mvc.show.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.common.util.PageInfo;
import semi.culture.mvc.noticeboard.model.service.NoticeService;
import semi.culture.mvc.noticeboard.model.vo.Notice;
import semi.culture.mvc.qnaboard.model.service.QnaService;
import semi.culture.mvc.qnaboard.model.vo.Qna;
import semi.culture.mvc.reviewboard.model.service.ReviewService;
import semi.culture.mvc.reviewboard.model.vo.Review;
import semi.culture.mvc.show.model.service.ShowService;
import semi.culture.mvc.show.model.vo.ShowDetail;
import semi.culture.mvc.show.model.vo.ShowRank;

@WebServlet("/main2")
public class ShowMainServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	ShowService showService = new ShowService();
	ReviewService reviewService = new ReviewService();
	NoticeService noticeService = new NoticeService();
	QnaService qnaService = new QnaService();
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<ShowDetail> musicalRankList = showService.MusicalRankList();
		List<ShowDetail> classicRankList = showService.ClassicRankList();
				
		List<ShowDetail> DramaRankList = showService.DramaRankList();
		List<ShowDetail> triditionalRankList = showService.getKoreanDetailForMainRank();
		List<ShowDetail> muListAll = null;
		List<ShowDetail> koListAll = null;
		List<ShowDetail> clListAll = null;
		
		
		
		List<ShowRank> rankSeoul = showService.findShowSeoulRank();
		List<ShowRank> rankKuyngki = showService.findShowKuyngRank();
		List<ShowRank> rankKuyngsang = showService.findShowKuyngSangRank();
		List<ShowRank> rankJeolla= showService.findShowJeollaRank();
		
		PageInfo pageInfoReview = new PageInfo(1,1,reviewService.findAllCountReview(),10);
		List<Review> reviewList = reviewService.findAll(pageInfoReview);
		
		
		PageInfo pageInfoNotice = new PageInfo(1, 1, noticeService.findAllNoticeCount(), 10);
		List<Notice> noticeList = noticeService.findNoticeList(pageInfoNotice);
		
		PageInfo pageInfoQna = new PageInfo(1,1,qnaService.findAllQnaCount(),10);
		List<Qna> qnaList = qnaService.findAll(pageInfoQna);
		
		

		
		muListAll=showService.MuAllList();
		koListAll=showService.KoreanAllList();
		clListAll=showService.ClassicAllList();
		
		req.setAttribute("muListAll", muListAll);
		req.setAttribute("koListAll", koListAll);
		req.setAttribute("clListAll", clListAll);
		
		req.setAttribute("musicalRankList", musicalRankList);
		req.setAttribute("classicRankList", classicRankList);
		req.setAttribute("DramaRankList", DramaRankList);
		req.setAttribute("triditionalRankList", triditionalRankList);
		req.setAttribute("rankSeoul", rankSeoul);
		req.setAttribute("rankKuyngki", rankKuyngki);
		req.setAttribute("rankKuyngsang", rankKuyngsang);
		req.setAttribute("rankJeolla", rankJeolla);
		req.setAttribute("reviewList", reviewList);
		req.setAttribute("noticeList", noticeList);
		req.setAttribute("qnaList", qnaList);
		
		req.getRequestDispatcher("/main2.jsp").forward(req, resp);
		
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	
	@Override
	public String getServletName() {
		return "ShowMainServlet";
	}

}
