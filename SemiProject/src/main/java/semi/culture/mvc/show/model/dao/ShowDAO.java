package semi.culture.mvc.show.model.dao;

import static semi.culture.common.jdbc.JDBCTemplate.close;
import static semi.culture.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import semi.culture.mvc.show.model.vo.ShowDetail;
import semi.culture.mvc.show.model.vo.ShowRank;
import semi.culture.mvc.show.model.vo.Stadium;

public class ShowDAO {

	// 뮤지컬 쿼리 갯수
	public int getMusicalDetailCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM tbl_detail where genrenm like '%뮤지컬%' ";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}

	// 연극 쿼리 갯수
	public int getDramaDetailCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM tbl_detail where genrenm like '%연극%' ";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}

	// 클래식 쿼리 갯수
	public int getClassicDetailCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM tbl_detail where genrenm like '%클래식%' ";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}

	// 국악 쿼리 갯수
	public int getKoreanDetailCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM tbl_detail where genrenm like '%국악%' ";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return result;
	}

	// 뮤지컬 검색
	public List<ShowDetail> findMusicalDetail(Connection conn, Map<String, String> searchMap) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ShowDetail> list = new ArrayList<ShowDetail>();
		String query = "SELECT  *  " + "from	tbl_detail D " + "	JOIN tbl_hall H ON(D.hall_id = H.hall_id) "
				+ "	WHERE 1=1 " + "	AND d.genrenm like '%뮤지컬%' ";

		if (searchMap.containsKey("prfnm")) {
			query += "AND d.prfnm LIKE ? ";
		}
		if (searchMap.containsKey("prfcast")) {
			query += "AND d.prfcast LIKE ? ";
		}
		if (searchMap.containsKey("adres")) {
			query += "AND h.adres LIKE ? ";
		}
		if (searchMap.containsKey("date")) {
			query += "AND ? between d.prfpdfrom and d.prfpdto ";
		}

		try {
			pstmt = conn.prepareStatement(query);
			int count = 1;

			if (searchMap.containsKey("prfnm")) {
				pstmt.setString(count++, "%" + searchMap.get("prfnm") + "%");
			}
			if (searchMap.containsKey("prfcast")) {
				pstmt.setString(count++, "%" + searchMap.get("prfcast") + "%");
			}
			if (searchMap.containsKey("adres")) {
				pstmt.setString(count++, "%" + searchMap.get("adres") + "%");
			}
			if (searchMap.containsKey("date")) {
				pstmt.setString(count++, searchMap.get("date"));
			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				ShowDetail show = new ShowDetail();
				show.setPrfid(rs.getString("prfid"));
				show.setHall_id(rs.getString("hall_id"));
				show.setPrfnm(rs.getString("prfnm"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setFcltynm(rs.getString("fcltynm"));
				show.setPrfcast(rs.getString("prfcast"));
				show.setPrfruntime(rs.getString("prfruntime"));
				show.setPrfage(rs.getString("prfage"));
				show.setPcseguidance(rs.getString("pcseguidance"));
				show.setGenrenm(rs.getString("genrenm"));
				show.setTimedtguidance(rs.getString("Timedtguidance"));
				show.setPoster(rs.getString("poster"));
				show.setSty(rs.getString("Sty"));
				show.setPrfstate(rs.getString("prfstate"));
				show.setStyurls(rs.getString("Styurls"));
				list.add(show);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	// 클래식 검색
	public List<ShowDetail> findClassicDetail(Connection conn, Map<String, String> searchMap) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ShowDetail> list = new ArrayList<ShowDetail>();
		String query = "SELECT  *  " + "from	tbl_detail D " + "	JOIN tbl_hall H ON(d.hall_id = h.hall_id) "
				+ "	WHERE 1=1 " + "	AND d.genrenm like '%클래식%' ";

		if (searchMap.containsKey("prfnm")) {
			query += "AND d.prfnm LIKE ? ";
		}
		if (searchMap.containsKey("prfcast")) {
			query += "AND d.prfcast LIKE ? ";
		}
		if (searchMap.containsKey("adres")) {
			query += "AND h.adres LIKE ? ";
		}
		if (searchMap.containsKey("date")) {
			query += "AND ? between d.prfpdfrom and d.prfpdto ";
		}

		try {
			pstmt = conn.prepareStatement(query);
			int count = 1;

			if (searchMap.containsKey("prfnm")) {
				pstmt.setString(count++, "%" + searchMap.get("prfnm") + "%");
			}
			if (searchMap.containsKey("prfcast")) {
				pstmt.setString(count++, "%" + searchMap.get("prfcast") + "%");
			}
			if (searchMap.containsKey("adres")) {
				pstmt.setString(count++, "%" + searchMap.get("adres") + "%");
			}
			if (searchMap.containsKey("date")) {
				pstmt.setString(count++, searchMap.get("date"));
			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				ShowDetail show = new ShowDetail();
				show.setPrfid(rs.getString("prfid"));
				show.setHall_id(rs.getString("hall_id"));
				show.setPrfnm(rs.getString("prfnm"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setFcltynm(rs.getString("fcltynm"));
				show.setPrfcast(rs.getString("prfcast"));
				show.setPrfruntime(rs.getString("prfruntime"));
				show.setPrfage(rs.getString("prfage"));
				show.setPcseguidance(rs.getString("pcseguidance"));
				show.setGenrenm(rs.getString("genrenm"));
				show.setTimedtguidance(rs.getString("Timedtguidance"));
				show.setPoster(rs.getString("poster"));
				show.setSty(rs.getString("Sty"));
				show.setPrfstate(rs.getString("prfstate"));
				show.setStyurls(rs.getString("Styurls"));
				list.add(show);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	// 연극 검색
	public List<ShowDetail> findDramaDetail(Connection conn, Map<String, String> searchMap) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ShowDetail> list = new ArrayList<ShowDetail>();
		String query = "SELECT  *  " + "from	tbl_detail D " + "	JOIN tbl_hall H ON(d.hall_id = h.hall_id) "
				+ "	WHERE 1=1 " + "	AND d.genrenm like '%연극%' ";

		if (searchMap.containsKey("prfnm")) {
			query += "AND d.prfnm LIKE ? ";
		}
		if (searchMap.containsKey("prfcast")) {
			query += "AND d.prfcast LIKE ? ";
		}
		if (searchMap.containsKey("adres")) {
			query += "AND h.adres LIKE ? ";
		}
		if (searchMap.containsKey("date")) {
			query += "AND ? between d.prfpdfrom and d.prfpdto ";
		}

		try {
			pstmt = conn.prepareStatement(query);
			int count = 1;

			if (searchMap.containsKey("prfnm")) {
				pstmt.setString(count++, "%" + searchMap.get("prfnm") + "%");
			}
			if (searchMap.containsKey("prfcast")) {
				pstmt.setString(count++, "%" + searchMap.get("prfcast") + "%");
			}
			if (searchMap.containsKey("adres")) {
				pstmt.setString(count++, "%" + searchMap.get("adres") + "%");
			}
			if (searchMap.containsKey("date")) {
				pstmt.setString(count++, searchMap.get("date"));
			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				ShowDetail show = new ShowDetail();
				show.setPrfid(rs.getString("prfid"));
				show.setHall_id(rs.getString("hall_id"));
				show.setPrfnm(rs.getString("prfnm"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setFcltynm(rs.getString("fcltynm"));
				show.setPrfcast(rs.getString("prfcast"));
				show.setPrfruntime(rs.getString("prfruntime"));
				show.setPrfage(rs.getString("prfage"));
				show.setPcseguidance(rs.getString("pcseguidance"));
				show.setGenrenm(rs.getString("genrenm"));
				show.setTimedtguidance(rs.getString("Timedtguidance"));
				show.setPoster(rs.getString("poster"));
				show.setSty(rs.getString("Sty"));
				show.setPrfstate(rs.getString("prfstate"));
				show.setStyurls(rs.getString("Styurls"));
				list.add(show);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	// 국악 검색
	public List<ShowDetail> findKoreanDetail(Connection conn, Map<String, String> searchMap) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ShowDetail> list = new ArrayList<ShowDetail>();
		String query = "SELECT  *  " + "from	tbl_detail D " + "	JOIN tbl_hall H ON(d.hall_id = h.hall_id) "
				+ "	WHERE 1=1 " + "	AND d.genrenm like '%국악%' ";

		if (searchMap.containsKey("prfnm")) {
			query += "AND d.prfnm LIKE ? ";
		}
		if (searchMap.containsKey("prfcast")) {
			query += "AND d.prfcast LIKE ? ";
		}
		if (searchMap.containsKey("adres")) {
			query += "AND h.adres LIKE ? ";
		}
		if (searchMap.containsKey("date")) {
			query += "AND ? between d.prfpdfrom and d.prfpdto ";
		}

		try {
			pstmt = conn.prepareStatement(query);
			int count = 1;

			if (searchMap.containsKey("prfnm")) {
				pstmt.setString(count++, "%" + searchMap.get("prfnm") + "%");
			}
			if (searchMap.containsKey("prfcast")) {
				pstmt.setString(count++, "%" + searchMap.get("prfcast") + "%");
			}
			if (searchMap.containsKey("adres")) {
				pstmt.setString(count++, "%" + searchMap.get("adres") + "%");
			}
			if (searchMap.containsKey("date")) {
				pstmt.setString(count++, searchMap.get("date"));
			}

			rs = pstmt.executeQuery();
			while (rs.next()) {
				ShowDetail show = new ShowDetail();
				show.setPrfid(rs.getString("prfid"));
				show.setHall_id(rs.getString("hall_id"));
				show.setPrfnm(rs.getString("prfnm"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setFcltynm(rs.getString("fcltynm"));
				show.setPrfcast(rs.getString("prfcast"));
				show.setPrfruntime(rs.getString("prfruntime"));
				show.setPrfage(rs.getString("prfage"));
				show.setPcseguidance(rs.getString("pcseguidance"));
				show.setGenrenm(rs.getString("genrenm"));
				show.setTimedtguidance(rs.getString("Timedtguidance"));
				show.setPoster(rs.getString("poster"));
				show.setSty(rs.getString("Sty"));
				show.setPrfstate(rs.getString("prfstate"));
				show.setStyurls(rs.getString("Styurls"));
				list.add(show);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	public List<ShowDetail> MusicalRankList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ShowDetail> list = new ArrayList<ShowDetail>();
		String query = "SELECT d.prfid, d.prfnm, d.poster, d.prfpdfrom, d.prfpdto, d.fcltynm, d.prfage, d.pcseguidance "
				+ "from tbl_rank  r " + "JOIN tbl_detail d ON(d.prfid = r.prfid) "
				+ "	WHERE  r.cate like '%뮤지컬%' order by r.rnum";

		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ShowDetail show = new ShowDetail();
				show.setPrfid(rs.getString("prfid"));
				show.setFcltynm(rs.getString("fcltynm"));
				show.setPrfnm(rs.getString("prfnm"));
				show.setPrfage(rs.getString("prfage"));
				show.setPcseguidance(rs.getString("pcseguidance"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setPoster(rs.getString("poster"));
				list.add(show);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	public List<ShowDetail> KoreanRankList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ShowDetail> list = new ArrayList<ShowDetail>();
		String query = "SELECT d.prfid, d.prfnm, d.poster, d.prfpdfrom, d.prfpdto, d.fcltynm, d.prfage  "
				+ "from	tbl_rank  r " + "JOIN tbl_detail d ON(d.prfid = r.prfid) "
				+ "	WHERE  r.cate like '%국악%' order by r.rnum";

		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ShowDetail show = new ShowDetail();
				show.setPrfid(rs.getString("prfid"));
				show.setPrfnm(rs.getString("prfnm"));
				show.setFcltynm(rs.getString("fcltynm"));
				show.setPrfage(rs.getString("prfage"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setPoster(rs.getString("poster"));
				list.add(show);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	public List<ShowDetail> ClassicRankList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ShowDetail> list = new ArrayList<ShowDetail>();
		String query = "SELECT d.prfid, d.prfnm, d.poster, d.prfpdfrom, d.prfpdto, d.fcltynm, d.prfage, d.pcseguidance  "
				+ "from	tbl_rank  r " + "JOIN tbl_detail d ON(d.prfid = r.prfid) "
				+ "	WHERE  r.cate like '%클래식%' order by r.rnum";

		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ShowDetail show = new ShowDetail();
				show.setPrfid(rs.getString("prfid"));
				show.setPrfnm(rs.getString("prfnm"));
				show.setFcltynm(rs.getString("fcltynm"));
				show.setPcseguidance(rs.getString("pcseguidance"));
				show.setPrfage(rs.getString("prfage"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setPoster(rs.getString("poster"));
				list.add(show);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	public List<ShowDetail> DramaRankList(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ShowDetail> list = new ArrayList<ShowDetail>();
		String query = "SELECT d.prfid, d.prfnm, d.poster, d.prfpdfrom, d.prfpdto, d.fcltynm, d.prfage, d.pcseguidance "
				+ "from tbl_rank  r " + "JOIN tbl_detail d ON(d.prfid = r.prfid) "
				+ "	WHERE  r.cate like '%연극%' order by r.rnum";

		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ShowDetail show = new ShowDetail();
				show.setPrfid(rs.getString("prfid"));
				show.setPrfnm(rs.getString("prfnm"));
				show.setFcltynm(rs.getString("fcltynm"));
				show.setPrfage(rs.getString("prfage"));
				show.setPcseguidance(rs.getString("pcseguidance"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setPoster(rs.getString("poster"));
				list.add(show);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}
		return list;
	}

	/*
	 * // 뮤지컬 랭킹검색 public List<ShowRank> MusicalRank(Connection conn) {
	 * List<ShowRank> list = new ArrayList<>(); PreparedStatement pstmt = null;
	 * ResultSet rs = null; try { String query =
	 * "SELECT * FROM tbl_rank WHERE cate like '뮤지컬' order by rnum"; pstmt =
	 * conn.prepareStatement(query); rs = pstmt.executeQuery();
	 * 
	 * while (rs.next()) { ShowRank showRank = new ShowRank();
	 * showRank.setRank_id(rs.getString("rank_id"));
	 * showRank.setPrfid(rs.getString("prfid"));
	 * showRank.setPrfnm(rs.getString("prfnm"));
	 * showRank.setArea(rs.getString("area"));
	 * showRank.setRnum(rs.getString("rnum"));
	 * showRank.setPrfdtcnt(rs.getString("prfdtcnt"));
	 * showRank.setPrfpd(rs.getString("prfpd"));
	 * showRank.setCate(rs.getString("cate"));
	 * showRank.setPrfplcnm(rs.getString("prfplcnm"));
	 * showRank.setSeatcnt(rs.getString("seatcnt"));
	 * 
	 * list.add(showRank); } } catch (Exception e) { e.printStackTrace(); } finally
	 * { close(rs); close(pstmt); } return list; }
	 * 
	 * // 연극 랭킹검색 public List<ShowRank> DramaRank(Connection conn) { List<ShowRank>
	 * list = new ArrayList<>(); PreparedStatement pstmt = null; ResultSet rs =
	 * null; try { String query =
	 * "SELECT * FROM tbl_rank WHERE cate like '연극' order by rnum"; pstmt =
	 * conn.prepareStatement(query); rs = pstmt.executeQuery();
	 * 
	 * while (rs.next()) { ShowRank showRank = new ShowRank();
	 * showRank.setRank_id(rs.getString("rank_id"));
	 * showRank.setPrfid(rs.getString("prfid"));
	 * showRank.setPrfnm(rs.getString("prfnm"));
	 * showRank.setArea(rs.getString("area"));
	 * showRank.setRnum(rs.getString("rnum"));
	 * showRank.setPrfdtcnt(rs.getString("prfdtcnt"));
	 * showRank.setPrfpd(rs.getString("prfpd"));
	 * showRank.setCate(rs.getString("cate"));
	 * showRank.setPrfplcnm(rs.getString("prfplcnm"));
	 * showRank.setSeatcnt(rs.getString("seatcnt"));
	 * 
	 * list.add(showRank);
	 * 
	 * } } catch (Exception e) { e.printStackTrace(); } finally { close(rs);
	 * close(pstmt); } return list; }
	 * 
	 * // 국악 랭킹검색 public List<ShowRank> KoreanRank(Connection conn) { List<ShowRank>
	 * list = new ArrayList<>(); PreparedStatement pstmt = null; ResultSet rs =
	 * null; try { String query =
	 * "SELECT * FROM tbl_rank WHERE cate like '국악' order by rnum"; pstmt =
	 * conn.prepareStatement(query); rs = pstmt.executeQuery();
	 * 
	 * while (rs.next()) { ShowRank showRank = new ShowRank();
	 * showRank.setRank_id(rs.getString("rank_id"));
	 * showRank.setPrfid(rs.getString("prfid"));
	 * showRank.setPrfnm(rs.getString("prfnm"));
	 * showRank.setArea(rs.getString("area"));
	 * showRank.setRnum(rs.getString("rnum"));
	 * showRank.setPrfdtcnt(rs.getString("prfdtcnt"));
	 * showRank.setPrfpd(rs.getString("prfpd"));
	 * showRank.setCate(rs.getString("cate"));
	 * showRank.setPrfplcnm(rs.getString("prfplcnm"));
	 * showRank.setSeatcnt(rs.getString("seatcnt"));
	 * 
	 * list.add(showRank); } } catch (Exception e) { e.printStackTrace(); } finally
	 * { close(rs); close(pstmt); } return list; }
	 * 
	 * // 클래식 랭킹 검색 public List<ShowRank> classicRank(Connection conn) {
	 * List<ShowRank> list = new ArrayList<>(); PreparedStatement pstmt = null;
	 * ResultSet rs = null; try { String query =
	 * "SELECT * FROM tbl_rank WHERE cate like '클래식' order by rnum"; pstmt =
	 * conn.prepareStatement(query); rs = pstmt.executeQuery();
	 * 
	 * while (rs.next()) { ShowRank showRank = new ShowRank();
	 * showRank.setRank_id(rs.getString("rank_id"));
	 * showRank.setPrfid(rs.getString("prfid"));
	 * showRank.setPrfnm(rs.getString("prfnm"));
	 * showRank.setArea(rs.getString("area"));
	 * showRank.setRnum(rs.getString("rnum"));
	 * showRank.setPrfdtcnt(rs.getString("prfdtcnt"));
	 * showRank.setPrfpd(rs.getString("prfpd"));
	 * showRank.setCate(rs.getString("cate"));
	 * showRank.setPrfplcnm(rs.getString("prfplcnm"));
	 * showRank.setSeatcnt(rs.getString("seatcnt"));
	 * 
	 * list.add(showRank); } } catch (Exception e) { e.printStackTrace(); } finally
	 * { close(rs); close(pstmt); } return list; }
	 * 
	 */

	// 뮤지컬 전체 리스트
	public List<ShowDetail> MuAllList(Connection conn) {
		List<ShowDetail> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String query = "SELECT * FROM tbl_detail WHERE genrenm like '뮤지컬'";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ShowDetail show = new ShowDetail();
				show.setPrfid(rs.getString("prfid"));
				show.setHall_id(rs.getString("hall_id"));
				show.setPrfnm(rs.getString("prfnm"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setFcltynm(rs.getString("fcltynm"));
				show.setPrfcast(rs.getString("prfcast"));
				show.setPrfruntime(rs.getString("prfruntime"));
				show.setPrfage(rs.getString("prfage"));
				show.setPcseguidance(rs.getString("pcseguidance"));
				show.setGenrenm(rs.getString("genrenm"));
				show.setTimedtguidance(rs.getString("Timedtguidance"));
				show.setPoster(rs.getString("poster"));
				show.setSty(rs.getString("Sty"));
				show.setPrfstate(rs.getString("prfstate"));
				show.setStyurls(rs.getString("Styurls"));
				list.add(show);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	// 국악 전체 리스트
	public List<ShowDetail> KoreanAllList(Connection conn) {
		List<ShowDetail> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String query = "SELECT * FROM tbl_detail WHERE genrenm like '국악'";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ShowDetail show = new ShowDetail();
				show.setPrfid(rs.getString("prfid"));
				show.setHall_id(rs.getString("hall_id"));
				show.setPrfnm(rs.getString("prfnm"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setFcltynm(rs.getString("fcltynm"));
				show.setPrfcast(rs.getString("prfcast"));
				show.setPrfruntime(rs.getString("prfruntime"));
				show.setPrfage(rs.getString("prfage"));
				show.setPcseguidance(rs.getString("pcseguidance"));
				show.setGenrenm(rs.getString("genrenm"));
				show.setTimedtguidance(rs.getString("Timedtguidance"));
				show.setPoster(rs.getString("poster"));
				show.setSty(rs.getString("Sty"));
				show.setPrfstate(rs.getString("prfstate"));
				show.setStyurls(rs.getString("Styurls"));
				list.add(show);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	// 클래식 전체 리스트
	public List<ShowDetail> ClassicAllList(Connection conn) {
		List<ShowDetail> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String query = "SELECT * FROM tbl_detail WHERE genrenm like '클래식'";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ShowDetail show = new ShowDetail();
				show.setPrfid(rs.getString("prfid"));
				show.setHall_id(rs.getString("hall_id"));
				show.setPrfnm(rs.getString("prfnm"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setFcltynm(rs.getString("fcltynm"));
				show.setPrfcast(rs.getString("prfcast"));
				show.setPrfruntime(rs.getString("prfruntime"));
				show.setPrfage(rs.getString("prfage"));
				show.setPcseguidance(rs.getString("pcseguidance"));
				show.setGenrenm(rs.getString("genrenm"));
				show.setTimedtguidance(rs.getString("Timedtguidance"));
				show.setPoster(rs.getString("poster"));
				show.setSty(rs.getString("Sty"));
				show.setPrfstate(rs.getString("prfstate"));
				show.setStyurls(rs.getString("Styurls"));
				list.add(show);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	// 연극 전체 리스트
	public List<ShowDetail> DramaAllList(Connection conn) {
		List<ShowDetail> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String query = "SELECT * FROM tbl_detail WHERE genrenm like '연극'";
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ShowDetail show = new ShowDetail();
				show.setPrfid(rs.getString("prfid"));
				show.setHall_id(rs.getString("hall_id"));
				show.setPrfnm(rs.getString("prfnm"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setFcltynm(rs.getString("fcltynm"));
				show.setPrfcast(rs.getString("prfcast"));
				show.setPrfruntime(rs.getString("prfruntime"));
				show.setPrfage(rs.getString("prfage"));
				show.setPcseguidance(rs.getString("pcseguidance"));
				show.setGenrenm(rs.getString("genrenm"));
				show.setTimedtguidance(rs.getString("Timedtguidance"));
				show.setPoster(rs.getString("poster"));
				show.setSty(rs.getString("Sty"));
				show.setPrfstate(rs.getString("prfstate"));
				show.setStyurls(rs.getString("Styurls"));
				list.add(show);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	// 작품 상세

	public ShowDetail getShowDetailByPrfmId(Connection conn, String prfid) {
		ShowDetail showDetail = new ShowDetail();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM tbl_detail WHERE prfid = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, prfid);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				showDetail.setPrfid(rs.getString("prfid"));
				showDetail.setHall_id(rs.getString("hall_id"));
				showDetail.setPrfnm(rs.getString("prfnm"));
				showDetail.setPrfpdfrom(rs.getString("prfpdfrom"));
				showDetail.setPrfpdto(rs.getString("prfpdto"));
				showDetail.setFcltynm(rs.getString("fcltynm"));
				showDetail.setPrfcast(rs.getString("prfcast"));
				showDetail.setPrfruntime(rs.getString("prfruntime"));
				showDetail.setPrfage(rs.getString("prfage"));
				showDetail.setPcseguidance(rs.getString("pcseguidance"));
				showDetail.setGenrenm(rs.getString("genrenm"));
				showDetail.setTimedtguidance(rs.getString("Timedtguidance"));
				showDetail.setPoster(rs.getString("poster"));
				showDetail.setSty(rs.getString("Sty"));
				showDetail.setPrfstate(rs.getString("prfstate"));
				showDetail.setStyurls(rs.getString("Styurls"));
			}

			return showDetail;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return showDetail;
	}

	// 공연장 가져오기

	public Stadium getStadiumByHallId(Connection conn, String hall_id) {
		Stadium stadium = new Stadium();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM TBL_Hall WHERE hall_id = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, hall_id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				stadium.setHall_id(rs.getString("hall_id"));
				stadium.setFcltynm(rs.getString("fcltynm"));
				stadium.setAdres(rs.getString("adres"));
				stadium.setSeatscale(rs.getInt("seatscale"));
				stadium.setRelateurl(rs.getString("relateurl"));
				stadium.setTelno(rs.getString("Telno"));
				stadium.setLa(rs.getString("la"));
				stadium.setLo(rs.getString("lo"));
			}

			return stadium;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return stadium;
	}

	// 지역별 랭킹 가져오기(서울)
	public List<ShowRank> findShowSeoulRank(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ShowRank> list = new ArrayList<>();
		String query = "SELECT * FROM TBL_Rank R join tbl_detail D USING(prfid) "
				+ "WHERE area LIKE '%서울%'  ORDER BY RNUM ";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.getConnection().prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ShowRank rank = new ShowRank();
				rank.setArea(rs.getString("area"));
				rank.setRank_id(rs.getString("rank_id"));
				rank.setPrfnm(rs.getString("prfnm"));
				rank.setPrfid(rs.getString("prfid"));
				rank.setRnum(rs.getInt("rnum"));
				rank.setPrfdtcnt(rs.getString("prfdtcnt"));
				rank.setPrfpd(rs.getString("prfpd"));
				rank.setCate(rs.getString("cate"));
				rank.setPrfplcnm(rs.getString("prfplcnm"));
				rank.setSeatcnt(rs.getInt("seatcnt"));
				rank.setPoster(rs.getString("poster"));
				list.add(rank);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;
	}

	// 지역별 랭킹 가져오기(경기)
	public List<ShowRank> findShowKuyngRank(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ShowRank> list = new ArrayList<>();
		String query = "SELECT * FROM TBL_Rank R join tbl_detail D USING(prfid) WHERE area LIKE '%경기%' ORDER BY RNUM ";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.getConnection().prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ShowRank rank = new ShowRank();
				rank.setPrfid(rs.getString("prfid"));
				rank.setArea(rs.getString("area"));
				rank.setRank_id(rs.getString("rank_id"));
				rank.setPrfnm(rs.getString("prfnm"));
				rank.setPrfid(rs.getString("prfid"));
				rank.setRnum(rs.getInt("rnum"));
				rank.setPrfdtcnt(rs.getString("prfdtcnt"));
				rank.setPrfpd(rs.getString("prfpd"));
				rank.setCate(rs.getString("cate"));
				rank.setSeatcnt(rs.getInt("seatcnt"));
				rank.setPoster(rs.getString("poster"));
				list.add(rank);

			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;
	}

	// 지역별 랭킹 가져오기(경상도)
	public List<ShowRank> findShowKuyngSangRank(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ShowRank> list = new ArrayList<>();
		String query = "SELECT * FROM TBL_Rank R join tbl_detail  D USING(prfid) WHERE area LIKE '%대구%' OR area LIKE '%부산%'  OR area LIKE '%울산%' OR area Like '경북' ORDER BY RNUM ";

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.getConnection().prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ShowRank rank = new ShowRank();
				rank.setArea(rs.getString("area"));
				rank.setPrfid(rs.getString("prfid"));
				rank.setRank_id(rs.getString("rank_id"));
				rank.setPrfnm(rs.getString("prfnm"));
				rank.setPrfid(rs.getString("prfid"));
				rank.setRnum(rs.getInt("rnum"));
				rank.setPrfdtcnt(rs.getString("prfdtcnt"));
				rank.setPrfpd(rs.getString("prfpd"));
				rank.setCate(rs.getString("cate"));
				rank.setSeatcnt(rs.getInt("seatcnt"));
				rank.setPoster(rs.getString("poster"));
				list.add(rank);

			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;
	}

	// 지역별 랭킹 가져오기(전라충천)
	public List<ShowRank> findShowJeollaRank(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ShowRank> list = new ArrayList<>();
		String query = "SELECT * FROM TBL_Rank R join tbl_detail D USING(prfid) WHERE area LIKE '%대전%' OR area LIKE '%전라%'  OR area LIKE '%충청%' ORDER BY RNUM ";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.getConnection().prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ShowRank rank = new ShowRank();
				rank.setArea(rs.getString("area"));
				rank.setPrfid(rs.getString("prfid"));

				rank.setRank_id(rs.getString("rank_id"));
				rank.setPrfnm(rs.getString("prfnm"));
				rank.setPrfid(rs.getString("prfid"));
				rank.setRnum(rs.getInt("rnum"));
				rank.setPrfdtcnt(rs.getString("prfdtcnt"));
				rank.setPrfpd(rs.getString("prfpd"));
				rank.setCate(rs.getString("cate"));
				rank.setSeatcnt(rs.getInt("seatcnt"));
				rank.setPoster(rs.getString("poster"));
				list.add(rank);

			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}

		return list;
	}
	// 메인에 깔기 위한 국악 
	public List<ShowDetail> getKoreanDetailForMainRank(Connection conn) {
		List<ShowDetail> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM TBL_Detail WHERE genrenm LIKE '%국악%' AND prfstate='공연중' ";

		try {
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ShowDetail show = new ShowDetail();
				show.setPrfid(rs.getString("prfid"));
				show.setPrfnm(rs.getString("prfnm"));
				show.setFcltynm(rs.getString("fcltynm"));
				show.setPrfage(rs.getString("prfage"));
				show.setPcseguidance(rs.getString("pcseguidance"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setPoster(rs.getString("poster"));
				list.add(show);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	// 공연 전체 리스트
		public List<ShowDetail> AllList(Connection conn) {
			List<ShowDetail> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				String query = "SELECT * FROM TBL_DETAIL";
				pstmt = conn.prepareStatement(query);
				rs = pstmt.executeQuery();

				while (rs.next()) {
					ShowDetail show = new ShowDetail();
					show.setPrfid(rs.getString("prfid"));
					show.setHall_id(rs.getString("hall_id"));
					show.setPrfnm(rs.getString("prfnm"));
					show.setPrfpdfrom(rs.getString("prfpdfrom"));
					show.setPrfpdto(rs.getString("prfpdto"));
					show.setFcltynm(rs.getString("fcltynm"));
					show.setPrfcast(rs.getString("prfcast"));
					show.setPrfruntime(rs.getString("prfruntime"));
					show.setPrfage(rs.getString("prfage"));
					show.setPcseguidance(rs.getString("pcseguidance"));
					show.setGenrenm(rs.getString("genrenm"));
					show.setTimedtguidance(rs.getString("Timedtguidance"));
					show.setPoster(rs.getString("poster"));
					show.setSty(rs.getString("Sty"));
					show.setPrfstate(rs.getString("prfstate"));
					show.setStyurls(rs.getString("Styurls"));
					list.add(show);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return list;
		}

		
		// 뮤지컬 메인 검색
		public List<ShowDetail> MusicalMainSearchList(Connection conn,String prfnm) {
			List<ShowDetail> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String query = "SELECT * FROM tbl_detail WHERE genrenm like '뮤지컬' and prfnm like '?' ";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, prfnm );
				rs = pstmt.executeQuery();
				
				
				while (rs.next()) {
					ShowDetail show = new ShowDetail();
					show.setPrfid(rs.getString("prfid"));
					show.setHall_id(rs.getString("hall_id"));
					show.setPrfnm(rs.getString("prfnm"));
					show.setPrfpdfrom(rs.getString("prfpdfrom"));
					show.setPrfpdto(rs.getString("prfpdto"));
					show.setFcltynm(rs.getString("fcltynm"));
					show.setPrfcast(rs.getString("prfcast"));
					show.setPrfruntime(rs.getString("prfruntime"));
					show.setPrfage(rs.getString("prfage"));
					show.setPcseguidance(rs.getString("pcseguidance"));
					show.setGenrenm(rs.getString("genrenm"));
					show.setTimedtguidance(rs.getString("Timedtguidance"));
					show.setPoster(rs.getString("poster"));
					show.setSty(rs.getString("Sty"));
					show.setPrfstate(rs.getString("prfstate"));
					show.setStyurls(rs.getString("Styurls"));
					list.add(show);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			return list;
		}
		
		
		// 클래식 메인검색 리스트
				public List<ShowDetail> ClassicMainSearchList(Connection conn,String prfnm) {
					List<ShowDetail> list = new ArrayList<>();
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String query = "SELECT * FROM tbl_detail WHERE genrenm like '클래식' and prfnm like '?' ";
					try {
						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, "%" + prfnm + "%");
						rs = pstmt.executeQuery();
						
						
						while (rs.next()) {
							ShowDetail show = new ShowDetail();
							show.setPrfid(rs.getString("prfid"));
							show.setHall_id(rs.getString("hall_id"));
							show.setPrfnm(rs.getString("prfnm"));
							show.setPrfpdfrom(rs.getString("prfpdfrom"));
							show.setPrfpdto(rs.getString("prfpdto"));
							show.setFcltynm(rs.getString("fcltynm"));
							show.setPrfcast(rs.getString("prfcast"));
							show.setPrfruntime(rs.getString("prfruntime"));
							show.setPrfage(rs.getString("prfage"));
							show.setPcseguidance(rs.getString("pcseguidance"));
							show.setGenrenm(rs.getString("genrenm"));
							show.setTimedtguidance(rs.getString("Timedtguidance"));
							show.setPoster(rs.getString("poster"));
							show.setSty(rs.getString("Sty"));
							show.setPrfstate(rs.getString("prfstate"));
							show.setStyurls(rs.getString("Styurls"));
							list.add(show);
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						close(rs);
						close(pstmt);
					}
					return list;
				}
				
				
				
				// 연극 메인검색  리스트
				public List<ShowDetail> DramaMainSearchList(Connection conn,String prfnm) {
					List<ShowDetail> list = new ArrayList<>();
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String query = "SELECT * FROM tbl_detail WHERE genrenm like '연극' and prfnm like '?'";
					try {
						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, prfnm);
						rs = pstmt.executeQuery();
						
						
						while (rs.next()) {
							ShowDetail show = new ShowDetail();
							show.setPrfid(rs.getString("prfid"));
							show.setHall_id(rs.getString("hall_id"));
							show.setPrfnm(rs.getString("prfnm"));
							show.setPrfpdfrom(rs.getString("prfpdfrom"));
							show.setPrfpdto(rs.getString("prfpdto"));
							show.setFcltynm(rs.getString("fcltynm"));
							show.setPrfcast(rs.getString("prfcast"));
							show.setPrfruntime(rs.getString("prfruntime"));
							show.setPrfage(rs.getString("prfage"));
							show.setPcseguidance(rs.getString("pcseguidance"));
							show.setGenrenm(rs.getString("genrenm"));
							show.setTimedtguidance(rs.getString("Timedtguidance"));
							show.setPoster(rs.getString("poster"));
							show.setSty(rs.getString("Sty"));
							show.setPrfstate(rs.getString("prfstate"));
							show.setStyurls(rs.getString("Styurls"));
							list.add(show);
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						close(rs);
						close(pstmt);
					}
					return list;
				}
				
				
				
				// 국악 메인검색 전체 리스트
				public List<ShowDetail> KoreanMainSearchList(Connection conn,String prfnm) {
					List<ShowDetail> list = new ArrayList<>();
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					String query = "SELECT * FROM tbl_detail WHERE genrenm like '국악' and prfnm like '?' ";
					try {
						pstmt = conn.prepareStatement(query);
						pstmt.setString(1, prfnm );
						rs = pstmt.executeQuery();
						
						
						while (rs.next()) {
							ShowDetail show = new ShowDetail();
							show.setPrfid(rs.getString("prfid"));
							show.setHall_id(rs.getString("hall_id"));
							show.setPrfnm(rs.getString("prfnm"));
							show.setPrfpdfrom(rs.getString("prfpdfrom"));
							show.setPrfpdto(rs.getString("prfpdto"));
							show.setFcltynm(rs.getString("fcltynm"));
							show.setPrfcast(rs.getString("prfcast"));
							show.setPrfruntime(rs.getString("prfruntime"));
							show.setPrfage(rs.getString("prfage"));
							show.setPcseguidance(rs.getString("pcseguidance"));
							show.setGenrenm(rs.getString("genrenm"));
							show.setTimedtguidance(rs.getString("Timedtguidance"));
							show.setPoster(rs.getString("poster"));
							show.setSty(rs.getString("Sty"));
							show.setPrfstate(rs.getString("prfstate"));
							show.setStyurls(rs.getString("Styurls"));
							list.add(show);
						}
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						close(rs);
						close(pstmt);
					}
					return list;
				}
		
		
		
		
		
		
	public List<ShowDetail> getMainSearchQuery(Connection conn, String word) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<ShowDetail> list = new ArrayList<>();
		String query = "SELECT * FROM TBL_Detail WHERE fcltynm LIKE ? OR prfnm LIKE ? OR fcltynm LIKE ? "
				+ "OR genrenm LIKE ? OR Sty LIKE ? OR prfstate LIKE ? ";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + word + "%");
			pstmt.setString(2, "%" + word + "%");
			pstmt.setString(3, "%" + word + "%");
			pstmt.setString(4, "%" + word + "%");
			pstmt.setString(5, "%" + word + "%");
			pstmt.setString(6, "%" + word + "%");

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ShowDetail show = new ShowDetail();
				show.setPrfid(rs.getString("prfid"));
				show.setHall_id(rs.getString("hall_id"));
				show.setPrfnm(rs.getString("prfnm"));
				show.setPrfpdfrom(rs.getString("prfpdfrom"));
				show.setPrfpdto(rs.getString("prfpdto"));
				show.setFcltynm(rs.getString("fcltynm"));
				show.setPrfcast(rs.getString("prfcast"));
				show.setPrfruntime(rs.getString("prfruntime"));
				show.setPrfage(rs.getString("prfage"));
				show.setPcseguidance(rs.getString("pcseguidance"));
				show.setGenrenm(rs.getString("genrenm"));
				show.setTimedtguidance(rs.getString("Timedtguidance"));
				show.setPoster(rs.getString("poster"));
				show.setSty(rs.getString("Sty"));
				show.setPrfstate(rs.getString("prfstate"));
				show.setStyurls(rs.getString("Styurls"));
				list.add(show);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(rs);
		}
		return list;
	}

	public static void main(String[] args) {

	}
}