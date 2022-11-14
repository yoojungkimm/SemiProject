package semi.culture.mvc.show.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.mvc.show.model.service.ShowService;
import semi.culture.mvc.show.model.vo.ShowDetail;

@WebServlet("/DramaAllList")
public class DramaAllLIst extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private ShowService service = new ShowService();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<ShowDetail> listAll = null;
		
		listAll=service.DramaAllList();
		req.setAttribute("listAll", listAll);
		
		req.getRequestDispatcher("/dramaAllList.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
