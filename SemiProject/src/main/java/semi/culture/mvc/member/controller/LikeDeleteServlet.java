package semi.culture.mvc.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi.culture.common.util.MyHttpServlet;
import semi.culture.mvc.member.model.service.MemberService;
import semi.culture.mvc.member.model.vo.DipLike;
import semi.culture.mvc.member.model.vo.Member;

@WebServlet("/DeleteDipLike")
public class LikeDeleteServlet extends MyHttpServlet{
	private static final long serialVersionUID = 1L;
	
	private MemberService service = new MemberService();

	@Override
	public String getServletName() {
		
		return "LikeDeleteServlet";
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			Member loginMember = getSessionMember(req);
			String prfid = req.getParameter("prfid");
			int likeNo = 0;
			
			List<DipLike> myDipLike = service.getDipLikeList(loginMember.getUser_id());
			
			for(int i = 0; i < myDipLike.size(); i++) {
				if(myDipLike.get(i).getPrfid().equals(prfid)) {
					likeNo = myDipLike.get(i).getLike_no();
					break;
				}
			}
			
			int result = service.DeleteDipLikeList(likeNo);
			
			if(result > 0) {
				sendCommonPage("찜목록에서 삭제 되었습니다.", "/showSelect?prfid="+prfid, req, resp);
			}else {
				sendCommonPage("찜목록에서 삭제 실패했습니다. (402)", "/showSelect?prfid="+prfid, req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
	
	
}
