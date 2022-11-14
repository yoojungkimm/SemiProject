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

import semi.culture.common.util.PageInfo;
import semi.culture.mvc.show.model.service.ShowService;
import semi.culture.mvc.show.model.vo.ShowDetail;

@WebServlet("/classic")
public class ClassicListServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	private ShowService service = new ShowService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ShowDetail> listRank = null; // 랭킹
		List<ShowDetail> listAll = null; //전체 리스트
		
		
		
	
		
//		클래식 추천 리스트
		listRank = service.ClassicRankList();
		req.setAttribute("listRank",listRank);
		
		listAll=service.ClassicAllList();
		req.setAttribute("listAll", listAll);
//		System.out.println(listAll);
		
		req.getRequestDispatcher("/classic.jsp").forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}
