package semi.culture.mvc.show.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.mvc.show.model.service.ShowService;
import semi.culture.mvc.show.model.vo.ShowDetail;

@WebServlet("/koreanSearch")
public class KoreanSearch extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private ShowService service = new ShowService();
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Map<String, String> searchMap = new HashMap<>();
		List<ShowDetail> Searchlist = null;
		List<ShowDetail> listRank = null;
		try {
			String prfnmValue = req.getParameter("prfnmValue");
			String prfcastValue = req.getParameter("prfcastValue");
			String adresValue = req.getParameter("adresValue");
			String dateValue = req.getParameter("dateValue");
			
			
			
			if(prfnmValue != null && prfnmValue.length()>0) {
				searchMap.put("prfnm",prfnmValue);
			}else {
				searchMap.put("prfnm", "");
			}
			if(prfcastValue != null && prfcastValue.length()>0) {
				searchMap.put("prfcast",prfcastValue);
			}else {
				searchMap.put("prfcast", "");
			}
			if(adresValue != null && adresValue.length()>0) {
				searchMap.put("adres",adresValue);
			}else {
				searchMap.put("adres", "");
			}
			if(dateValue != null && dateValue.length()>0) {
				searchMap.put("date",dateValue);
			}else {
				searchMap.put("date", "2022.07.30");
			}
			
		} catch (Exception e) {	}

		Searchlist = service.findKoreanDetail(searchMap);
		
		//검색결과로 리스트 보내기
		req.setAttribute("Searchlist", Searchlist);
		System.out.println(Searchlist);
		
		//랭크 보내기
		listRank = service.KoreanRankList();
		req.setAttribute("listRank",listRank);
		
		
		
		req.getRequestDispatcher("/koreanSearch.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
