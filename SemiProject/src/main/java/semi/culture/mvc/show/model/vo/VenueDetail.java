package semi.culture.mvc.show.model.vo;

public class VenueDetail {
	private String hall_id;
	private String fcltynm;
	private String adres;
	private String seatscale;
	private String relateurl;
	private String telno;
	private String la;
	private String lo;
	public VenueDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public VenueDetail(String hall_id, String fcltynm, String adres, String seatscale, String relateurl, String telno,
			String la, String lo) {
		super();
		this.hall_id = hall_id;
		this.fcltynm = fcltynm;
		this.adres = adres;
		this.seatscale = seatscale;
		this.relateurl = relateurl;
		this.telno = telno;
		this.la = la;
		this.lo = lo;
	}
	public String getHall_id() {
		return hall_id;
	}
	public void setHall_id(String hall_id) {
		this.hall_id = hall_id;
	}
	public String getFcltynm() {
		return fcltynm;
	}
	public void setFcltynm(String fcltynm) {
		this.fcltynm = fcltynm;
	}
	public String getAdres() {
		return adres;
	}
	public void setAdres(String adres) {
		this.adres = adres;
	}
	public String getSeatscale() {
		return seatscale;
	}
	public void setSeatscale(String seatscale) {
		this.seatscale = seatscale;
	}
	public String getRelateurl() {
		return relateurl;
	}
	public void setRelateurl(String relateurl) {
		this.relateurl = relateurl;
	}
	public String getTelno() {
		return telno;
	}
	public void setTelno(String telno) {
		this.telno = telno;
	}
	public String getLa() {
		return la;
	}
	public void setLa(String la) {
		this.la = la;
	}
	public String getLo() {
		return lo;
	}
	public void setLo(String lo) {
		this.lo = lo;
	}
	@Override
	public String toString() {
		return "VenueDetail [hall_id=" + hall_id + ", fcltynm=" + fcltynm + ", adres=" + adres + ", seatscale="
				+ seatscale + ", relateurl=" + relateurl + ", telno=" + telno + ", la=" + la + ", lo=" + lo + "]";
	}
	
	
}
