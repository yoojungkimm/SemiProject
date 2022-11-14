package semi.culture.mvc.qnaboard.model.vo;

import java.util.Date;
import java.util.List;

public class Qna {
	private int no;
	private int rowNum;
	private int writer_no;
	private String writer_id;
	private String title;
	private String content;
	private String type;
	private int readCount;
	private String status;
	private Date create_date;
	private Date modify_date;
	private List<QnaReply> replies;

	public Qna() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Qna(int no, int rowNum, int writer_no, String writer_id, String title, String content, String type,
			int readCount, String status, Date create_date, Date modify_date, List<QnaReply> replies) {
		super();
		this.no = no;
		this.rowNum = rowNum;
		this.writer_no = writer_no;
		this.writer_id = writer_id;
		this.title = title;
		this.content = content;
		this.type = type;
		this.readCount = readCount;
		this.status = status;
		this.create_date = create_date;
		this.modify_date = modify_date;
		this.replies = replies;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getRowNum() {
		return rowNum;
	}

	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}

	public int getWriter_no() {
		return writer_no;
	}

	public void setWriter_no(int writer_no) {
		this.writer_no = writer_no;
	}

	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public Date getModify_date() {
		return modify_date;
	}

	public void setModify_date(Date modify_date) {
		this.modify_date = modify_date;
	}

	public List<QnaReply> getReplies() {
		return replies;
	}

	public void setReplies(List<QnaReply> replies) {
		this.replies = replies;
	}

	@Override
	public String toString() {
		return "Qna [no=" + no + ", rowNum=" + rowNum + ", writer_no=" + writer_no + ", writer_id=" + writer_id
				+ ", title=" + title + ", content=" + content + ", type=" + type + ", readCount=" + readCount
				+ ", status=" + status + ", create_date=" + create_date + ", modify_date=" + modify_date + ", replies="
				+ replies + "]";
	}

}
