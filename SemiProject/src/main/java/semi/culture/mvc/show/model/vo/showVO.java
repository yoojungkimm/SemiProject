package semi.culture.mvc.show.model.vo;

public class showVO {
String prfid;
String hall_id;
String prfnm;
String prfpdfrom;
String prfpdto;
String fcltynm;
String genrenm;
String prfcast;
String prfruntime;
String prfage;
String pcseguidance;
String Timedtguidance;
String poster;
String Sty;
String prfstate;
String Styurls;


public showVO() {
	super();
	// TODO Auto-generated constructor stub
}


public showVO(String prfid, String hall_id, String prfnm, String prfpdfrom, String prfpdto, String fcltynm,
		String prfcast, String prfruntime, String prfage, String pcseguidance, String genrenm, String timedtguidance,
		String poster, String sty, String prfstate, String styurls) {
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
	return "==================================== \n showVO \n- ?????? id = " + prfid + "\n- ????????? id=" + hall_id + "\n- ?????? ?????? = " + prfnm + "\n- ?????? ?????? ?????? = " + prfpdfrom
			+ "\n- ?????? ?????? ?????? = " + prfpdto + "\n- ????????? ?????? = " + fcltynm + "\n- ????????? = " + prfcast + "\n- ???????????? = " + prfruntime
			+ "\n- ?????? ?????? = " + prfage + "\n- ?????? ?????? = " + pcseguidance + "\n- ?????? = " + genrenm + "\n- ?????? ?????? ?????? = "
			+ Timedtguidance + "\n- ????????? = " + poster + "\n- ????????? = " + Sty + "\n- ????????????=" + prfstate + "\n- Styurls=" + Styurls
			+ "]";
	

}


	
	
	
	
}
