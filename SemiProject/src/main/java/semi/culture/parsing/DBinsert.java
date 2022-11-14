package semi.culture.parsing;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import semi.culture.mvc.show.model.vo.BoxOffice;
import semi.culture.mvc.show.model.vo.Show;
import semi.culture.mvc.show.model.vo.ShowDetail;
import semi.culture.mvc.show.model.vo.VenueDetail;

public class DBinsert {
	public static Connection conn = null;
	public static PreparedStatement pstmt = null;
	public static ResultSet rs = null;

	public static String driverClass = "oracle.jdbc.OracleDriver";
	public static String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	public static String user = "WEB";
	public static String password = "WEB";
	static OpenApiManager_All api = new OpenApiManager_All();

	public static void insertVenue() throws SQLException {

		List<String> VenueList = api.venueListByXML();
		List<VenueDetail> VDList = api.venueDetailedByXML(VenueList);
		int count = VDList.size();
		while (count != 0) {

			try {

				Class.forName(driverClass);
				conn = DriverManager.getConnection(url, user, password);

				conn.setAutoCommit(false);

				for (int i = 0; i < VDList.size(); i++) {
					String sql = "INSERT INTO TBL_Hall(hall_id,fcltynm,adres,seatscale,relateurl,Telno,la,lo) "
							+ "VALUES(?,?,?,?,?,?,?,?) ";

					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, VDList.get(i).getHall_id());
					pstmt.setString(2, VDList.get(i).getFcltynm());
					pstmt.setString(3, VDList.get(i).getAdres());
					pstmt.setString(4, VDList.get(i).getSeatscale());
					pstmt.setString(5, VDList.get(i).getRelateurl());
					pstmt.setString(6, VDList.get(i).getTelno());
					pstmt.setString(7, VDList.get(i).getLa());
					pstmt.setString(8, VDList.get(i).getLo());

					pstmt.executeUpdate();
					VDList.remove(i);
					conn.commit();
					count--;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null && rs.isClosed() == false) {
						rs.close();
					}

					if (pstmt != null && pstmt.isClosed() == false) {
						pstmt.close();
					}

					if (conn != null && conn.isClosed() == false) {
						conn.close();
					}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		System.out.println(VDList.size());
	}

	public static void insertBoxOffice(String date) {
		List<BoxOffice> boxList = api.boxOfficeListByXML(date);  
		
		int count = boxList.size();
		int num = 0;
		while(count!=0) {
			try {

				Class.forName(driverClass);
				conn = DriverManager.getConnection(url, user, password);

				conn.setAutoCommit(false);

				for (int i = 0; i < boxList.size(); i++) {
					String sql = "INSERT INTO TBL_Rank(rank_id,prfid,prfnm,area,rnum,prfdtcnt,prfpd,cate,prfplcnm,seatcnt) "
							+ "VALUES(?,?,?,?,?,?,?,?,?,?) ";
					num++;
					String seq = date+num;
					PreparedStatement pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, seq);
					pstmt.setString(2, boxList.get(i).getPrfid());
					pstmt.setString(3, boxList.get(i).getPrfnm());
					pstmt.setString(4, boxList.get(i).getArea());
					pstmt.setInt(5, Integer.parseInt(boxList.get(i).getRnum()));
					pstmt.setInt(6, Integer.parseInt(boxList.get(i).getPrfdtcnt()));
					pstmt.setString(7, boxList.get(i).getPrfpd());
					pstmt.setString(8, boxList.get(i).getCate());
					pstmt.setString(9, boxList.get(i).getPrfplcnm());
					pstmt.setInt(10, Integer.parseInt(boxList.get(i).getSeatcnt()));

					pstmt.executeUpdate();
					boxList.remove(i);
					conn.commit();
					count--;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null && rs.isClosed() == false) {
						rs.close();
					}

					if (pstmt != null && pstmt.isClosed() == false) {
						pstmt.close();
					}

					if (conn != null && conn.isClosed() == false) {
						conn.close();
					}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		
	}
	public static void insertShow() throws SQLException {
		List<Show> list = api.showListByXML("20220725", "20220830");
		List<String> listID = new ArrayList<>();
		for (Show l : list) {
			listID.add(l.getId());
		}

		List<ShowDetail> SDlist = api.showDetiledByXML(listID);
		System.out.println(SDlist.size());
		int count = SDlist.size();

		while (count != 0) {

			try {

				Class.forName(driverClass);
				conn = DriverManager.getConnection(url, user, password);

				conn.setAutoCommit(false);

				for (int i = 0; i < SDlist.size(); i++) {
					String sql = "INSERT INTO TBL_Detail(prfid,hall_id,prfnm,prfpdfrom,prfpdto,fcltynm,prfcast,prfruntime,prfage,pcseguidance, "
							+ "poster,Sty,genrenm,prfstate,Styurls,Timedtguidance) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
					PreparedStatement pstmt = conn.prepareStatement(sql);

					pstmt.setString(1, SDlist.get(i).getPrfid());
					pstmt.setString(2, SDlist.get(i).getHall_id());
					pstmt.setString(3, SDlist.get(i).getPrfnm());
					pstmt.setString(4, SDlist.get(i).getPrfpdfrom());
					pstmt.setString(5, SDlist.get(i).getPrfpdto());
					pstmt.setString(6, SDlist.get(i).getFcltynm());
					pstmt.setString(7, SDlist.get(i).getPrfcast());
					pstmt.setString(8, SDlist.get(i).getPrfruntime());
					pstmt.setString(9, SDlist.get(i).getPrfage());
					pstmt.setString(10, SDlist.get(i).getPcseguidance());
					pstmt.setString(11, SDlist.get(i).getPoster());
					pstmt.setString(12, SDlist.get(i).getSty());
					pstmt.setString(13, SDlist.get(i).getGenrenm());
					pstmt.setString(14, SDlist.get(i).getPrfstate());
					pstmt.setString(15, SDlist.get(i).getStyurls());
					pstmt.setString(16, SDlist.get(i).getTimedtguidance());
					pstmt.executeUpdate();
					conn.commit();
					System.out.println(SDlist.remove(i));
					count--;
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null && rs.isClosed() == false) {
						rs.close();
					}

					if (pstmt != null && pstmt.isClosed() == false) {
						pstmt.close();
					}

					if (conn != null && conn.isClosed() == false) {
						conn.close();
					}
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			for (ShowDetail sd : SDlist) {
				System.out.println(sd);
			}
		}
		System.out.println(SDlist.size());
	}

	public static void main(String[] args) throws SQLException {
		
//		insertVenue();
		
		insertShow();
		
//		insertBoxOffice("20220724");
		
	}
}
