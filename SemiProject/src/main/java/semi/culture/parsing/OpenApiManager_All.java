package semi.culture.parsing;

import java.net.HttpURLConnection;

import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import semi.culture.mvc.show.model.vo.BoxOffice;
import semi.culture.mvc.show.model.vo.Show;
import semi.culture.mvc.show.model.vo.ShowDetail;
import semi.culture.mvc.show.model.vo.VenueDetail;

public class OpenApiManager_All {
	private static String serviceKey = "=e74ed1e887f04e1290c39bf25638df6f";

	public static String getServiceKey() {
		return serviceKey;
	}

	public static List<Show> showListByXML(String from, String to) {

		List<Show> showList = new ArrayList<>();
		String serviceKey = getServiceKey();
		try {

			StringBuilder urlBuilder = new StringBuilder("http://kopis.or.kr/openApi/restful/pblprfr"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("service", "UTF-8") + serviceKey); /* Service Key */
			urlBuilder.append("&" + URLEncoder.encode("stdate", "UTF-8") + "=" + URLEncoder.encode(from, "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("eddate", "UTF-8") + "=" + URLEncoder.encode(to, "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("cpage", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("rows", "UTF-8") + "=" + URLEncoder.encode("1500", "UTF-8"));
			URL url = new URL(urlBuilder.toString());
			System.out.println(urlBuilder);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/xml");

			int code = conn.getResponseCode();
			System.out.println("Response code: " + code);

			if (code < 200 || code > 300) {
				System.out.println("페이지가 잘못되었습니다.");
				return null;
			}

			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(conn.getInputStream());

			doc.getDocumentElement().normalize();

			System.out.println("Root Element: " + doc.getDocumentElement().getNodeName());
			System.out.println("======================================");

			NodeList nList = doc.getElementsByTagName("db");

			// System.out.println("list tag length : " + nList.getLength());

			for (int i = 0; i < nList.getLength(); i++) {
				Node node = nList.item(i);
				// System.out.println("\nCurrent Element : " + node.getNodeName());
				if (node.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) node;

					String id = getStrData(eElement, "mt20id");
					String prfNm = getStrData(eElement, "prfnm");
					String prfpdFrom = getStrData(eElement, "prfpdfrom");
					String prfpdTo = getStrData(eElement, "prfpdto");
					String fcltyNm = getStrData(eElement, "fcltynm");
					String genre = getStrData(eElement, "genrenm");
					// System.out.println("공연id : " + id);
					// System.out.println("공연명" + prfNm);
					// System.out.println("시작일:" + prfpdFrom);
					// System.out.println("종료일:" + prfpdTo);
					// System.out.println("시설명:" + fcltyNm);
					// System.out.println("장르:" + genre);
					showList.add(new Show(id, prfNm, prfpdFrom, prfpdTo, fcltyNm, genre));

				}
			}
			conn.disconnect();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return showList;

	}

	public static List<ShowDetail> showDetiledByXML(List<String> listID) {

		List<ShowDetail> SDlist = new ArrayList<ShowDetail>();
		String serviceKey = getServiceKey();

		try {

			for (String id : listID) {

				StringBuilder urlBuilder = new StringBuilder("http://kopis.or.kr/openApi/restful/pblprfr");
				urlBuilder = new StringBuilder("http://www.kopis.or.kr/openApi/restful/pblprfr/" + id); /* URL */
				urlBuilder.append("?" + URLEncoder.encode("service", "UTF-8") + serviceKey); /* Service Key */
				URL url = new URL(urlBuilder.toString());
				// System.out.println(urlBuilder);

				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");
				conn.setRequestProperty("Content-type", "application/xml");

				int code = conn.getResponseCode();
				// System.out.println("Response code: " + code);

				if (code < 200 || code > 300) {
					System.out.println("페이지가 잘못되었습니다.");
				}

				DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				DocumentBuilder db = dbf.newDocumentBuilder();
				Document doc = db.parse(conn.getInputStream());

				doc.getDocumentElement().normalize();

				// System.out.println("Root Element: " +
				// doc.getDocumentElement().getNodeName());
				// System.out.println("======================================");

				NodeList nList = doc.getElementsByTagName("db");

				nList = doc.getElementsByTagName("db");

				for (int i = 0; i < nList.getLength(); i++) {
					Node node = nList.item(i);
					if (node.getNodeType() == Node.ELEMENT_NODE) {
						Element eElement = (Element) node;

						String prfid = getStrData(eElement, "mt20id").strip();
						String hall_id = getStrData(eElement, "mt10id").strip();
						String prfnm = getStrData(eElement, "prfnm").strip();
						String prfpdfrom = getStrData(eElement, "prfpdfrom").strip();
						String prfpdto = getStrData(eElement, "prfpdto").strip();
						String fcltynm = getStrData(eElement, "fcltynm").strip();
						String prfcast = getStrData(eElement, "prfcast").strip();
						String prfruntime = getStrData(eElement, "prfruntime").strip();
						String prfage = getStrData(eElement, "prfage").strip();
						String pcseguidance = getStrData(eElement, "pcseguidance").strip();
						String poster = getStrData(eElement, "poster").strip();
						String sty = getStrData(eElement, "sty").strip();
						String genrenm = getStrData(eElement, "genrenm").strip();
						String prfstate = getStrData(eElement, "prfstate").strip();
						String styurls = getStrData(eElement, "styurls").strip();
						String dtguidance = getStrData(eElement, "dtguidance").strip();

						SDlist.add(new ShowDetail(prfid, hall_id, prfnm, prfpdfrom, prfpdto, fcltynm, prfcast,
								prfruntime, prfage, pcseguidance, poster, sty, genrenm, prfstate, styurls, dtguidance));

					}
				}
				conn.disconnect();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SDlist;
	}

	public List<String> venueListByXML() {
		List<String> list = new ArrayList<>();
		String serviceKey = getServiceKey();
		try {

			StringBuilder urlBuilder = new StringBuilder("http://www.kopis.or.kr/openApi/restful/prfplc"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("service", "UTF-8") + serviceKey); /* Service Key */
			urlBuilder.append("&" + URLEncoder.encode("cpage", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("rows", "UTF-8") + "=" + URLEncoder.encode("2300", "UTF-8"));
			URL url = new URL(urlBuilder.toString());
			System.out.println(urlBuilder);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/xml");

			int code = conn.getResponseCode();
			System.out.println("Response code: " + code);

			if (code < 200 || code > 300) {
				System.out.println("페이지가 잘못되었습니다.");
				return null;
			}

			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(conn.getInputStream());

			doc.getDocumentElement().normalize();

			System.out.println("Root Element: " + doc.getDocumentElement().getNodeName());
			System.out.println("========================================================");

			NodeList nList = doc.getElementsByTagName("db");

			// System.out.println("list tag length : " + nList.getLength());

			for (int i = 0; i < nList.getLength(); i++) {
				Node node = nList.item(i);
				// System.out.println("\nCurrent Element : " + node.getNodeName());
				if (node.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) node;

					String mt10id = getStrData(eElement, "mt10id");

					list.add(mt10id);
				}
				conn.disconnect();
			}
		} catch (Exception e) {
			e.printStackTrace();

		}

		return list;

	}

	public List<VenueDetail> venueDetailedByXML(List<String> listID) {

		List<VenueDetail> vdList = new ArrayList<>();
		StringBuilder urlBuilder = null;
		URL url = null;
		HttpURLConnection conn = null;
		String serviceKey = getServiceKey();
		try {

			for (String id : listID) {

				urlBuilder = new StringBuilder("http://www.kopis.or.kr/openApi/restful/prfplc/" + id); /* URL */
				urlBuilder.append("?" + URLEncoder.encode("service", "UTF-8") + serviceKey); /* Service Key */
				url = new URL(urlBuilder.toString());
				// System.out.println(urlBuilder);

				conn = (HttpURLConnection) url.openConnection();
				conn.setRequestMethod("GET");
				conn.setRequestProperty("Content-type", "application/xml");

				int code = conn.getResponseCode();
				// System.out.println("Response code: " + code);

				if (code < 200 || code > 300) {
					System.out.println("페이지가 잘못되었습니다.");
				}

				DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
				DocumentBuilder db = dbf.newDocumentBuilder();
				Document doc = db.parse(conn.getInputStream());

				doc.getDocumentElement().normalize();

				NodeList nList = doc.getElementsByTagName("dbs");

				for (int i = 0; i < nList.getLength(); i++) {
					Node node = nList.item(i);
					if (node.getNodeType() == Node.ELEMENT_NODE) {
						Element eElement = (Element) node;
						String hall_id = getStrData(eElement, "mt10id").strip();
						String fcltynm = getStrData(eElement, "fcltynm").strip();
						String adres = getStrData(eElement, "adres").strip();
						String seatscale = getStrData(eElement, "seatscale").strip();
						String relateurl = getStrData(eElement, "relateurl").strip();
						String telno = getStrData(eElement, "telno").strip();
						String la = getStrData(eElement, "la").strip();
						String lo = getStrData(eElement, "lo").strip();

						VenueDetail vd = new VenueDetail(hall_id, fcltynm, adres, seatscale, relateurl, telno, la, lo);
						vdList.add(vd);

					}
				}
				conn.disconnect();

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return vdList;

	}

	public static List<BoxOffice> boxOfficeListByXML(String date) {

		List<BoxOffice> boxList = new ArrayList<>();
		String serviceKey = getServiceKey();
		try {

			StringBuilder urlBuilder = new StringBuilder("http://kopis.or.kr/openApi/restful/boxoffice"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("service", "UTF-8") + serviceKey); /* Service Key */
			urlBuilder.append("&" + URLEncoder.encode("ststype", "UTF-8") + "=" + URLEncoder.encode("day", "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("date", "UTF-8") + "=" + URLEncoder.encode(date, "UTF-8"));
			System.out.println(urlBuilder.toString());
			URL url = new URL(urlBuilder.toString());

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/xml");

			int code = conn.getResponseCode();
			System.out.println("Response code: " + code);

			if (code < 200 || code > 300) {
				System.out.println("페이지가 잘못되었습니다.");
				return null;
			}

			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(conn.getInputStream());

			doc.getDocumentElement().normalize();

			System.out.println("Root Element: " + doc.getDocumentElement().getNodeName());
			System.out.println("======================================");

			NodeList nList = doc.getElementsByTagName("boxof");

			System.out.println("list tag length : " + nList.getLength());

			for (int i = 0; i < nList.getLength(); i++) {
				Node node = nList.item(i);
				// System.out.println("\nCurrent Element : " + node.getNodeName());
				if (node.getNodeType() == Node.ELEMENT_NODE) {
					Element eElement = (Element) node;
					String area = getStrData(eElement, "area");
					String prfdtcnt = getStrData(eElement, "prfdtcnt");
					String prfpd = getStrData(eElement, "prfpd");
					String cate = getStrData(eElement, "cate");
					String prfplcnm = getStrData(eElement, "prfplcnm");
					String prfnm = getStrData(eElement, "prfnm");
					String rnum = getStrData(eElement, "rnum");
					String seatcnt = getStrData(eElement, "seatcnt");
					String prfid = getStrData(eElement, "mt20id");
					
					BoxOffice bo = new BoxOffice(prfid, prfnm, area, rnum, prfdtcnt, prfpd, cate, prfplcnm, seatcnt);
					boxList.add(bo);
				}
			}
			conn.disconnect();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return boxList;
	}

	private static String getStrData(Element eElement, String tagName) {
		try {
			String str = "업데이트예정";

			if (eElement.getElementsByTagName(tagName).item(0) != null) {
				str = eElement.getElementsByTagName(tagName).item(0).getTextContent();
			}
			return str;
		} catch (Exception e) {
			return "-";
		}

	}

}