package semi.culture.mvc.reviewboard.model.vo;

import java.util.Date;

public class ReviewReply {
	private int rcommentnum; // 리뷰댓글 넘버
	private int reviewnum; // 리뷰 넘버
	private String user_id; // 유저
	private String rccontent; // 리뷰댓글 컨텐츠
	private Date rccreatedate; // 리뷰댓글 날짜

	public ReviewReply() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReviewReply(int rcommentnum, int reviewnum, String user_id, String rccontent, Date rccreatedate) {
		super();
		this.rcommentnum = rcommentnum;
		this.reviewnum = reviewnum;
		this.user_id = user_id;
		this.rccontent = rccontent;
		this.rccreatedate = rccreatedate;
	}

	public int getRcommentnum() {
		return rcommentnum;
	}

	public void setRcommentnum(int rcommentnum) {
		this.rcommentnum = rcommentnum;
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

	public String getRccontent() {
		return rccontent;
	}

	public void setRccontent(String rccontent) {
		this.rccontent = rccontent;
	}

	public Date getRccreatedate() {
		return rccreatedate;
	}

	public void setRccreatedate(Date rccreatedate) {
		this.rccreatedate = rccreatedate;
	}

	@Override
	public String toString() {
		return "ReviewCommnet [rcommentnum=" + rcommentnum + ", reviewnum=" + reviewnum + ", user_id=" + user_id
				+ ", rccontent=" + rccontent + ", rccreatedate=" + rccreatedate + "]";
	}
}
