package qna;

import java.sql.Date;

public class QnADataBean {
	
	private Integer no;

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getContent() {
		return content;
	} 

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Integer getReStep() {
		return reStep;
	}

	public void setReStep(Integer reStep) {
		this.reStep = reStep;
	}

	public Integer getReLevel() {
		return reLevel;
	}

	public void setReLevel(Integer reLevel) {
		this.reLevel = reLevel;
	}

	public Integer getRefe() {
		return refe;
	}

	public void setRefe(Integer refe) {
		this.refe = refe;
	}

	public Integer getReadcount() {
		return readcount;
	}

	public void setReadcount(Integer readcount) {
		this.readcount = readcount;
	}

	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}

	/** 내용. */
	private String content;

	/** 작성자. */
	private String writer;

	/** 제목. */
	private String subject;

	/** 작성일자. */
	private Date regDate;

	/** re_step. */
	private Integer reStep;

	/** re_level. */
	private Integer reLevel;

	/** refe. */
	private Integer refe;

	/** readcount. */
	private Integer readcount;

	/** category. */
	private Integer category;
}
