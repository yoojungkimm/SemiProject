package semi.culture.mvc.show.model.vo;

public class Show {
	String id;
	String prfNm;
	String prfpdFrom;
	String prfpdTo;
	String fcltyNm;
	String genre;
	
	public Show() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Show(String id, String prfNm, String prfpdFrom, String prfpdTo, String fcltyNm, String genre) {
		super();
		this.id = id;
		this.prfNm = prfNm;
		this.prfpdFrom = prfpdFrom;
		this.prfpdTo = prfpdTo;
		this.fcltyNm = fcltyNm;
		this.genre = genre;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPrfNm() {
		return prfNm;
	}

	public void setPrfNm(String prfNm) {
		this.prfNm = prfNm;
	}

	public String getPrfpdFrom() {
		return prfpdFrom;
	}

	public void setPrfpdFrom(String prfpdFrom) {
		this.prfpdFrom = prfpdFrom;
	}

	public String getPrfpdTo() {
		return prfpdTo;
	}

	public void setPrfpdTo(String prfpdTo) {
		this.prfpdTo = prfpdTo;
	}

	public String getFcltyNm() {
		return fcltyNm;
	}

	public void setFcltyNm(String fcltyNm) {
		this.fcltyNm = fcltyNm;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	@Override
	public String toString() {
		return "====================== \n 공연id : " + id + "\n 공연 이름 : " + prfNm + "\n 공연시작일자 : " + prfpdFrom + "\n 공연종료일자 : " + prfpdTo
				+ "\n 극장 : " + fcltyNm + "\n 장르 : " + genre + "]";
	}
	
	
}
