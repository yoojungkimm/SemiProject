package semi.culture.mvc.noticeboard.model.vo;

import java.sql.Date;

public class Notice {
	private int noticeNum;
	private String noticeTitile;
	private String noticeContent;
	private int noticeReadCount;
	private Date noticeCreateDate;
	
	
	
	public Notice() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Notice(int noticeNum, String noticeTitile, String noticeContent, int noticeReadCount,
			Date noticeCreateDate) {
		super();
		this.noticeNum = noticeNum;
		this.noticeTitile = noticeTitile;
		this.noticeContent = noticeContent;
		this.noticeReadCount = noticeReadCount;
		this.noticeCreateDate = noticeCreateDate;
	}
	public int getNoticeNum() {
		return noticeNum;
	}
	
	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}
	
	public void setNoticeNum(String noticeNum) {
		noticeNum.strip();
		this.noticeNum = Integer.parseInt(noticeNum);
	}
	
	
	
	public String getNoticeTitile() {
		return noticeTitile;
	}
	public void setNoticeTitile(String noticeTitile) {
		this.noticeTitile = noticeTitile;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public int getNoticeReadCount() {
		return noticeReadCount;
	}
	public void setNoticeReadCount(int noticeReadCount) {
		this.noticeReadCount = noticeReadCount;
	}
	public Date getNoticeCreateDate() {
		return noticeCreateDate;
	}
	public void setNoticeCreateDate(Date noticeCreateDate) {
		this.noticeCreateDate = noticeCreateDate;
	}
	
	
	@Override
	public String toString() {
		return "Notice [noticeNum=" + noticeNum + ", noticeTitile=" + noticeTitile + ", noticeContent=" + noticeContent
				+ ", noticeReadCount=" + noticeReadCount + ", noticeCreateDate=" + noticeCreateDate + "]";
	}

	
	
}
