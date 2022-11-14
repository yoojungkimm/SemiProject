package semi.culture.mvc.reviewboard.model.vo;

import java.util.Date;
import java.util.List;

public class Review {
	private int reviewnum; // 리뷰 넘버
	private String user_id; // 유저
	private String rtitle; // 리뷰 제목
	private String rcontent; // 리뷰 컨텐츠
	private String star; // 리뷰 별
	private int rreadCount; // 리뷰 조회수
	private Date rcreateDate; // 리뷰 작성일

	public Review() {
		super();
		this.rreadCount = 0;
		// TODO Auto-generated constructor stub
	}

	public Review(int reviewnum, String user_id, String rtitle, String rcontent, String star, int rreadCount,
			Date rcreateDate, List<ReviewReply> ReviewReply) {
		super();
		this.reviewnum = reviewnum;
		this.user_id = user_id;
		this.rtitle = rtitle;
		this.rcontent = rcontent;
		this.star = star;
		this.rreadCount = 0;
		this.rcreateDate = rcreateDate;
	}

	public int getReviewnum() {
		return reviewnum;
	}

	public void setReviewnum(int reviewnum) {
		this.reviewnum = reviewnum;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getRtitle() {
		return rtitle;
	}

	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public int getRreadCount() {
		return rreadCount;
	}

	public void setRreadCount(int rreadCount) {
		this.rreadCount = rreadCount;
	}

	public Date getRcreateDate() {
		return rcreateDate;
	}

	public void setRcreateDate(Date rcreateDate) {
		this.rcreateDate = rcreateDate;
	}

	@Override
	public String toString() {
		return "Review [reviewnum=" + reviewnum + ", user_id=" + user_id + ", rtitle=" + rtitle + ", rcontent="
				+ rcontent + ", star=" + star + ", rreadCount=" + rreadCount + ", rcreateDate=" + rcreateDate + "]";
	}





	
}
