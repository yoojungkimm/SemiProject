package semi.culture.mvc.member.model.vo;
import java.util.Date;

public class TicketBookList {
	private int Ticketing_no;
	private String user_id;
	private String prfid;
	private String prfnm;
	private String price;
	private String personCount;
	private String PreviewDate;
	private Date TicketingDate;
	
	public TicketBookList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TicketBookList(int ticketing_no, String user_id, String prfid, String prfnm, String price,
			String personCount, String previewDate, Date ticketingDate) {
		super();
		Ticketing_no = ticketing_no;
		this.user_id = user_id;
		this.prfid = prfid;
		this.prfnm = prfnm;
		this.price = price;
		this.personCount = personCount;
		PreviewDate = previewDate;
		TicketingDate = ticketingDate;
	}

	public int getTicketing_no() {
		return Ticketing_no;
	}

	public void setTicketing_no(int ticketing_no) {
		Ticketing_no = ticketing_no;
	}

	public void setTicketing_no(String ticketing_no) {
		Ticketing_no = Integer.parseInt(ticketing_no);
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

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getPersonCount() {
		return personCount;
	}

	public void setPersonCount(String personCount) {
		this.personCount = personCount;
	}

	public String getPreviewDate() {
		return PreviewDate;
	}

	public void setPreviewDate(String previewDate) {
		PreviewDate = previewDate;
	}

	public Date getTicketingDate() {
		return TicketingDate;
	}

	public void setTicketingDate(Date ticketingDate) {
		TicketingDate = ticketingDate;
	}

	@Override
	public String toString() {
		return "TicketBookList [Ticketing_no=" + Ticketing_no + ", user_id=" + user_id + ", prfid=" + prfid + ", prfnm="
				+ prfnm + ", price=" + price + ", personCount=" + personCount + ", PreviewDate=" + PreviewDate
				+ ", TicketingDate=" + TicketingDate + "]";
	}
	
	
}
