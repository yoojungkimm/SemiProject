package semi.culture.mvc.show.model.vo;

public class ShowDetail {
	private String prfid;
	private String hall_id;
	private String prfnm;
	private String prfpdfrom;
	private String prfpdto;
	private String fcltynm;
	private String prfcast;
	private String prfruntime;
	private String prfage;
	private String pcseguidance;
	private String genrenm;
	private String Timedtguidance;
	private String poster;
	private String Sty;
	private String prfstate;
	private String Styurls;
	public ShowDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ShowDetail(String prfid, String hall_id, String prfnm, String prfpdfrom, String prfpdto, String fcltynm,
			String prfcast, String prfruntime, String prfage, String pcseguidance, String genrenm,
			String timedtguidance, String poster, String sty, String prfstate, String styurls) {
		super();
		this.prfid = prfid;
		this.hall_id = hall_id;
		this.prfnm = prfnm;
		this.prfpdfrom = prfpdfrom;
		this.prfpdto = prfpdto;
		this.fcltynm = fcltynm;
		this.prfcast = prfcast;
		this.prfruntime = prfruntime;
		this.prfage = prfage;
		this.pcseguidance = pcseguidance;
		this.genrenm = genrenm;
		Timedtguidance = timedtguidance;
		this.poster = poster;
		Sty = sty;
		this.prfstate = prfstate;
		Styurls = styurls;
	}
	public String getPrfid() {
		return prfid;
	}
	public void setPrfid(String prfid) {
		this.prfid = prfid;
	}
	public String getHall_id() {
		return hall_id;
	}
	public void setHall_id(String hall_id) {
		this.hall_id = hall_id;
	}
	public String getPrfnm() {
		return prfnm;
	}
	public void setPrfnm(String prfnm) {
		this.prfnm = prfnm;
	}
	public String getPrfpdfrom() {
		return prfpdfrom;
	}
	public void setPrfpdfrom(String prfpdfrom) {
		this.prfpdfrom = prfpdfrom;
	}
	public String getPrfpdto() {
		return prfpdto;
	}
	public void setPrfpdto(String prfpdto) {
		this.prfpdto = prfpdto;
	}
	public String getFcltynm() {
		return fcltynm;
	}
	public void setFcltynm(String fcltynm) {
		this.fcltynm = fcltynm;
	}
	public String getPrfcast() {
		return prfcast;
	}
	public void setPrfcast(String prfcast) {
		this.prfcast = prfcast;
	}
	public String getPrfruntime() {
		return prfruntime;
	}
	public void setPrfruntime(String prfruntime) {
		this.prfruntime = prfruntime;
	}
	public String getPrfage() {
		return prfage;
	}
	public void setPrfage(String prfage) {
		this.prfage = prfage;
	}
	public String getPcseguidance() {
		return pcseguidance;
	}
	public void setPcseguidance(String pcseguidance) {
		this.pcseguidance = pcseguidance;
	}
	public String getGenrenm() {
		return genrenm;
	}
	public void setGenrenm(String genrenm) {
		this.genrenm = genrenm;
	}
	public String getTimedtguidance() {
		return Timedtguidance;
	}
	public void setTimedtguidance(String timedtguidance) {
		Timedtguidance = timedtguidance;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getSty() {
		return Sty;
	}
	public void setSty(String sty) {
		Sty = sty;
	}
	public String getPrfstate() {
		return prfstate;
	}
	public void setPrfstate(String prfstate) {
		this.prfstate = prfstate;
	}
	public String getStyurls() {
		return Styurls;
	}
	public void setStyurls(String styurls) {
		Styurls = styurls;
	}
	@Override
	public String toString() {
		return "ShowDetail [prfid=" + prfid + ", hall_id=" + hall_id + ", prfnm=" + prfnm + ", prfpdfrom=" + prfpdfrom
				+ ", prfpdto=" + prfpdto + ", fcltynm=" + fcltynm + ", prfcast=" + prfcast + ", prfruntime="
				+ prfruntime + ", prfage=" + prfage + ", pcseguidance=" + pcseguidance + ", genrenm=" + genrenm
				+ ", Timedtguidance=" + Timedtguidance + ", poster=" + poster + ", Sty=" + Sty + ", prfstate="
				+ prfstate + ", Styurls=" + Styurls + "]";
	}
	
	
}
