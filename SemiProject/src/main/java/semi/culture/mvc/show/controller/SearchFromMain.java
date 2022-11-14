package semi.culture.mvc.show.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.mvc.show.model.service.ShowService;
import semi.culture.mvc.show.model.vo.ShowDetail;
import semi.culture.mvc.show.model.vo.ShowRank;

@WebServlet("/searchFromMain")
public class SearchFromMain extends MyHttpServlet {

	private static final long serialVersionUID = 1L;
	ShowService service = new ShowService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("서치프롬메인 들어옴 ");
		String searchWord = req.getParameter("searchWord");
		List<ShowDetail> showList = service.getMainSearchQuery(searchWord);
		List<ShowRank> recommenList = service.findShowSeoulRank();
		
		req.setAttribute("recommenList", recommenList);
		
		if (showList == null || showList.size() < 1) {
			sendCommonPage("검색 결과가 없습니다", "/main2", req, resp);
			return;
		}
		req.setAttribute("showList", showList);
		req.getRequestDispatcher("/searchResultFromMain.jsp").forward(req, resp);
		return;

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);

	}

	@Override
	public String getServletName() {
		return "SearchFromMain";
	}

}
