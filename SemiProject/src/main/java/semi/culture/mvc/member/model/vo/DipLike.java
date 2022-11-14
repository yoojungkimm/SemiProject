package semi.culture.mvc.member.model.vo;
import java.util.Date;

public class DipLike {
	private int Like_no;
	private String user_id;
	private String prfid;
	private String prfnm;
	private Date Like_date;
	
	public DipLike() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public DipLike(int like_no, String user_id, String prfid, String prfnm, Date like_date) {
		super();
		Like_no = like_no;
		this.user_id = user_id;
		this.prfid = prfid;
		this.prfnm = prfnm;
		Like_date = like_date;
	}
	
	public int getLike_no() {
		return Like_no;
	}
	
	public void setLike_no(int like_no) {
		Like_no = like_no;
	}
	public void setLike_no(String like_no) {
		like_no.strip();
		Like_no = Integer.parseInt(like_no);
	}
	
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public Date getLike_date() {
		return Like_date;
	}
	public void setLike_date(Date like_date) {
		Like_date = like_date;
	}
	
	
	@Override
	public String toString() {
		return "DipLike [Like_no=" + Like_no + ", user_id=" + user_id + ", prfid=" + prfid + ", prfnm=" + prfnm
				+ ", Like_date=" + Like_date + "]";
	}
	
	
	
}
