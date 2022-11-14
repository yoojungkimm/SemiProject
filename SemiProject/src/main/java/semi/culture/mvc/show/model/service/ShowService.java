package semi.culture.mvc.show.model.service;

import static semi.culture.common.jdbc.JDBCTemplate.close;
import static semi.culture.common.jdbc.JDBCTemplate.commit;
import static semi.culture.common.jdbc.JDBCTemplate.getConnection;
import static semi.culture.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import semi.culture.mvc.show.model.dao.ShowDAO;
import semi.culture.mvc.show.model.vo.ShowDetail;
import semi.culture.mvc.show.model.vo.ShowRank;
import semi.culture.mvc.show.model.vo.Stadium;

public class ShowService {

	ShowDAO dao = new ShowDAO();

	public int getMusicalDetailCount() {
		int result = 0;
		Connection conn = getConnection();

		result = dao.getMusicalDetailCount(conn);

		if (result > 0) {
			System.out.println("okkkk");
			commit(conn);
		} else {
			System.out.println("nono");
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int getDramaDetailCount() {
		int result = 0;
		Connection conn = getConnection();

		result = dao.getDramaDetailCount(conn);

		if (result > 0) {
			System.out.println("okkkk");
			commit(conn);
		} else {
			System.out.println("nono");
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int getClassicDetailCount() {
		int result = 0;
		Connection conn = getConnection();

		result = dao.getClassicDetailCount(conn);

		if (result > 0) {
			System.out.println("okkkk");
			commit(conn);
		} else {
			System.out.println("nono");
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int getKoreanDetailCount() {
		int result = 0;
		Connection conn = getConnection();

		result = dao.getKoreanDetailCount(conn);

		if (result > 0) {
			System.out.println("okkkk");
			commit(conn);
		} else {
			System.out.println("nono");
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public List<ShowDetail> findMusicalDetail( Map<String, String> searchMap) {
		List<ShowDetail> list = new ArrayList<>();
		Connection conn = getConnection();

		list = dao.findMusicalDetail(conn,  searchMap);

		if (list != null) {
			System.out.println("okkkk");

		} else {
			System.out.println("nono");
		}

		close(conn);
		return list;
	}

	public List<ShowDetail> findClassicDetail( Map<String, String> searchMap) {
		List<ShowDetail> list = new ArrayList<>();
		Connection conn = getConnection();

		list = dao.findClassicDetail(conn,  searchMap);

		if (list != null) {
			System.out.println("okkkk");

		} else {
			System.out.println("nono");
		}

		close(conn);
		return list;
	}
	public List<ShowDetail> findDramaDetail( Map<String, String> searchMap){
		List<ShowDetail> list = new ArrayList<>();
		Connection conn = getConnection();

		list = dao.findDramaDetail(conn, searchMap);

		if (list != null) {
			System.out.println("okkkk");

		} else {
			System.out.println("nono");
		}

		close(conn);
		return list;
	}
	
	public List<ShowDetail> findKoreanDetail( Map<String, String> searchMap){
		List<ShowDetail> list = new ArrayList<>();
		Connection conn = getConnection();

		list = dao.findKoreanDetail(conn,  searchMap);

		if (list != null) {
			System.out.println("okkkk");

		} else {
			System.out.println("nono");
		}

		close(conn);
		return list;
	}

	/*
	public List<ShowRank> MusicalRank(){
		List<ShowRank> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.MusicalRank(conn);

		if (list != null) {
			System.out.println("okkkk");

		} else {
			System.out.println("nono");
		}

		close(conn);
		return list;
	}
	
	public List<ShowRank> DramaRank(){
	
		List<ShowRank> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.DramaRank(conn);

		if (list != null) {
			System.out.println("okkkk");

		} else {
			System.out.println("nono");
		}

		close(conn);
		return list;
	}
	
	public List<ShowRank> KoreanRank(){
		List<ShowRank> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.KoreanRank(conn);

		if (list != null) {
			System.out.println("okkkk");

		} else {
			System.out.println("nono");
		}

		close(conn);
		return list;
		
	}
	public List<ShowRank> classicRank(){
		List<ShowRank> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.classicRank(conn);

		if (list != null) {
			System.out.println("okkkk");

		} else {
			System.out.println("nono");
		}

		close(conn);
		return list;
	}
*/
	
	public List<ShowDetail> AllList(){
		List<ShowDetail> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.AllList(conn);
		
		if (list != null) {
			System.out.println("okkkk");

		} else {
			System.out.println("nono");
		}

		close(conn);
		return list;
	}
	
	public List<ShowDetail> MuAllList(){
		List<ShowDetail> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.MuAllList(conn);
		
		if (list != null) {
			System.out.println("okkkk");

		} else {
			System.out.println("nono");
		}

		close(conn);
		return list;
	}
	
	public List<ShowDetail> KoreanAllList(){
		List<ShowDetail> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.KoreanAllList(conn);
		
		if (list != null) {
			System.out.println("okkkk");
			
		} else {
			System.out.println("nono");
		}
		
		close(conn);
		return list;
	}
	
	public List<ShowDetail> ClassicAllList(){
		List<ShowDetail> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.ClassicAllList(conn);
		
		if (list != null) {
			System.out.println("okkkk");
			
		} else {
			System.out.println("nono");
		}
		
		close(conn);
		return list;
	}
	
	public List<ShowDetail> DramaAllList(){
		List<ShowDetail> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.DramaAllList(conn);
		
		if (list != null) {
			System.out.println("okkkk");
			
		} else {
			System.out.println("nono");
		}
		
		close(conn);
		return list;
	}
	
	public List<ShowDetail> MusicalRankList(){
		List<ShowDetail> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.MusicalRankList(conn);
		
		if (list != null) {
			System.out.println("okkkk");
			
		} else {
			System.out.println("nono");
		}
		
		close(conn);
		return list;
	}
	public List<ShowDetail> ClassicRankList(){
		List<ShowDetail> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.ClassicRankList(conn);
		
		if (list != null) {
			System.out.println("okkkk");
			
		} else {
			System.out.println("nono");
		}
		
		close(conn);
		return list;
	}
	public List<ShowDetail> DramaRankList(){
		List<ShowDetail> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.DramaRankList(conn);
		
		if (list != null) {
			System.out.println("okkkk");
			
		} else {
			System.out.println("nono");
		}
		
		close(conn);
		return list;
	}
	public List<ShowDetail> KoreanRankList(){
		List<ShowDetail> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.KoreanRankList(conn);
		
		if (list != null) {
			System.out.println("okkkk");
			
		} else {
			System.out.println("nono");
		}
		
		close(conn);
		return list;
	}
	// 작품 상세
	public ShowDetail getShowDetailByPrfmId(String prfid) {
		ShowDetail showDetail = null;
		Connection conn = getConnection();
		showDetail = dao.getShowDetailByPrfmId(conn, prfid);
		
		if (showDetail != null) {
			System.out.println("okkkk");
			
		} else {
			System.out.println("nono");
		}
		close(conn);
		return showDetail;
	}
	
	public Stadium getStadiumByHallId(String hall_id) {
		Stadium stadium = null;
		Connection conn = getConnection();
		
		stadium = dao.getStadiumByHallId(conn, hall_id);
		
		if (stadium != null) {
			System.out.println("okkkk");
			
		} else {
			System.out.println("nono");
		}
		close(conn);
		return stadium;
	}
	
	
	public List<ShowRank>findShowSeoulRank(){
		List<ShowRank> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.findShowSeoulRank(conn);
	
		if (list != null) {
			System.out.println("okkkk");
			
		} else {
			System.out.println("nono");
		}
		close(conn);
		return list;
	}
	
	public List<ShowRank>findShowKuyngRank() {
		List<ShowRank> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.findShowKuyngRank(conn);
		
		if (list != null) {
			System.out.println("okkkk");
			
		} else {
			System.out.println("nono");
		}
		close(conn);
		return list;
	}
	
	public List<ShowRank>findShowKuyngSangRank(){
		List<ShowRank> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.findShowKuyngSangRank(conn);
		
		if (list != null) {
			System.out.println("okkkk");
			
		} else {
			System.out.println("nono");
		}
		close(conn);
		return list;
	}
	
	public List<ShowRank>findShowJeollaRank(){
		List<ShowRank> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.findShowJeollaRank(conn);
		
		if (list != null) {
			System.out.println("okkkk");
			
		} else {
			System.out.println("nono");
		}
		close(conn);
		return list;
	}
	
	public List<ShowDetail> getKoreanDetailForMainRank(){
		List<ShowDetail> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.getKoreanDetailForMainRank(conn);
		if (list != null) {
			System.out.println("okkkk");
			
		} else {
			System.out.println("nono");
		}
		close(conn);
		return list;
		
	}
	
	
	public List<ShowDetail> MusicalMainSearchList(String word){
		List<ShowDetail> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.MusicalMainSearchList(conn,word);
		if (list != null) {
			System.out.println("okkkk");
			
		} else {
			System.out.println("nono");
		}
		close(conn);
		return list;
	}
	
	public List<ShowDetail> ClassicMainSearchList(String word){
		List<ShowDetail> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.ClassicMainSearchList(conn,word);
		if (list != null) {
			System.out.println("okkkk");
			
		} else {
			System.out.println("nono");
		}
		close(conn);
		return list;
	}
	
	public List<ShowDetail> DramaMainSearchList(String word){
		List<ShowDetail> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.DramaMainSearchList(conn,word);
		if (list != null) {
			System.out.println("okkkk");
			
		} else {
			System.out.println("nono");
		}
		close(conn);
		return list;
	}
	
	public List<ShowDetail> KoreanMainSearchList(String word){
		List<ShowDetail> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.KoreanMainSearchList(conn,word);
		if (list != null) {
			System.out.println("okkkk");
			
		} else {
			System.out.println("nono");
		}
		close(conn);
		return list;
	}
	
	public List<ShowDetail> getMainSearchQuery(String word){
		List<ShowDetail> list = new ArrayList<>();
		Connection conn = getConnection();
		
		list = dao.getMainSearchQuery(conn,word);
		if (list != null) {
			System.out.println("okkkk");
			
		} else {
			System.out.println("nono");
		}
		close(conn);
		return list;
	}
	
	
	
	
	
	
	public static void main(String[] args) {
		ShowService ss = new ShowService();
		/*
		PageInfo info = new PageInfo(1, 10, ss.getMusicalDetailCount(), 10);
		Map<String, String> map = new HashMap<>();
		List<ShowDetail> list = ss.findKoreanDetail(info, map);
		System.out.println(list.size());
		for (ShowDetail sd : list) {
			System.out.println(sd);
		}
		
		
		List<Show> sr = ss.DramaAllList();
		
		System.out.println(sr.size());
		
		for(Show srr: sr) {
			System.out.println(srr);
		}*/
		
		List<ShowDetail> list = ss.getMainSearchQuery("겨울");
		
		
		for(ShowDetail sd : list) {
			System.out.println(sd);
		}
		
		
	}
}
