package semi.culture.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.mvc.member.model.service.MemberService;
import semi.culture.mvc.member.model.vo.DipLike;
import semi.culture.mvc.member.model.vo.Member;
import semi.culture.mvc.show.model.service.ShowService;

@WebServlet("/InsertDipLike")
public class LikeInsertServlet extends MyHttpServlet{;
	private static final long serialVersionUID = 1L;
	
	private MemberService service = new MemberService();
	
	@Override
	public String getServletName() {
		return "LikeInsertServlet";
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}


@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	Member loginMember = getSessionMember(req);
	ShowService sService = new ShowService();
	String prfid = req.getParameter("prfid");
	String prfnm = sService.getShowDetailByPrfmId(prfid).getPrfnm();
	
	
	
	try {
		DipLike dipLike = new DipLike();
		String user_id = loginMember.getUser_id();
		
		dipLike.setUser_id(user_id);
		dipLike.setPrfid(prfid);
		dipLike.setPrfnm(prfnm);
		
		
		int result = service.InsertDipLikeList(dipLike);
		
		if(result > 0) {
			sendCommonPage("찜목록에 추가 되었습니다.", "/showSelect?prfid="+prfid, req, resp);
		}else {
			sendCommonPage("찜목록에 추가 실패했습니다. (402)", "/showSelect?prfid="+prfid, req, resp);
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
}

	

}
