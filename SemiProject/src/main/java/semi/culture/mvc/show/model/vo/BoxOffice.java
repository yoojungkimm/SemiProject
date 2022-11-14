package semi.culture.mvc.show.model.vo;

public class BoxOffice {
	private String prfid;
	private String prfnm;
	private String area;
	private String rnum;
	private String prfdtcnt;
	private String prfpd;
	private String cate;
	private String prfplcnm;
	private String seatcnt;
	public BoxOffice() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoxOffice(String prfid, String prfnm, String area, String rnum, String prfdtcnt, String prfpd, String cate,
			String prfplcnm, String seatcnt) {
		super();
		this.prfid = prfid;
		this.prfnm = prfnm;
		this.area = area;
		this.rnum = rnum;
		this.prfdtcnt = prfdtcnt;
		this.prfpd = prfpd;
		this.cate = cate;
		this.prfplcnm = prfplcnm;
		this.seatcnt = seatcnt;
	}
	public String getPrfid() {
		return prfid;
	}
	public void setPrfid(String prfid) {
		this.prfid = prfid;
	}
	public String getPrfnm() {
		return prfnm;
	}
	public void setPrfnm(String prfnm) {
		this.prfnm = prfnm;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getPrfdtcnt() {
		return prfdtcnt;
	}
	public void setPrfdtcnt(String prfdtcnt) {
		this.prfdtcnt = prfdtcnt;
	}
	public String getPrfpd() {
		return prfpd;
	}
	public void setPrfpd(String prfpd) {
		this.prfpd = prfpd;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getPrfplcnm() {
		return prfplcnm;
	}
	public void setPrfplcnm(String prfplcnm) {
		this.prfplcnm = prfplcnm;
	}
	public String getSeatcnt() {
		return seatcnt;
	}
	public void setSeatcnt(String seatcnt) {
		this.seatcnt = seatcnt;
	}
	@Override
	public String toString() {
		return "BoxOffice [prfid=" + prfid + ", prfnm=" + prfnm + ", area=" + area + ", rnum=" + rnum + ", prfdtcnt="
				+ prfdtcnt + ", prfpd=" + prfpd + ", cate=" + cate + ", prfplcnm=" + prfplcnm + ", seatcnt=" + seatcnt
				+ "]";
	}

}
