package semi.culture.mvc.show.model.vo;

public class ShowRank {
	private String rank_id;
	private String prfid;
	private String prfnm;
	private String area;
	private int rnum;
	private int prfdtcnt;
	private String prfpd;
	private String cate;
	private String prfplcnm;
	private int seatcnt;
	private String poster;
	public ShowRank() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ShowRank(String rank_id, String prfid, String prfnm, String area, int rnum, int prfdtcnt, String prfpd,
			String cate, String prfplcnm, int seatcnt) {
		super();
		this.rank_id = rank_id;
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
	public String getRank_id() {
		return rank_id;
	}
	public void setRank_id(String rank_id) {
		this.rank_id = rank_id;
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
	public int getRnum() {
		return rnum;
	}
	
	
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public void setRnum(String rnum) {
		rnum.strip();
		this.rnum = Integer.parseInt(rnum);
	}
	
	public int getPrfdtcnt() {
		return prfdtcnt;
	}
	
	public void setPrfdtcnt(int prfdtcnt) {
		this.prfdtcnt = prfdtcnt;
	}
	public void setPrfdtcnt(String prfdtcnt) {
		prfdtcnt.strip();
		this.prfdtcnt = Integer.parseInt(prfdtcnt);
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
	public int getSeatcnt() {
		return seatcnt;
	}
	
	public void setSeatcnt(int seatcnt) {
		this.seatcnt = seatcnt;
	}
	public void setSeatcnt(String seatcnt) {
		seatcnt.strip();
		this.seatcnt = Integer.parseInt(seatcnt);
	}
	
	
	@Override
	public String toString() {
		return "ShowRank [rank_id=" + rank_id + ", prfid=" + prfid + ", prfnm=" + prfnm + ", area=" + area + ", rnum="
				+ rnum + ", prfdtcnt=" + prfdtcnt + ", prfpd=" + prfpd + ", cate=" + cate + ", prfplcnm=" + prfplcnm
				+ ", seatcnt=" + seatcnt + "]";
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	
	
}
