package qna;

import java.sql.Timestamp;

public class QnADataBean {
	private int no;			// 글번호 / 제목글 or 답변글 
	private String writer;		// 작성자
	private String subject;		// 글제목
	private String passwd;		// 비밀번호
	private Timestamp reg_date;	// 작성일
	private int readcount;		// 조회수
	private int refe;			// 그룹화 아이디
	private int re_step;		// 글순서
	private int re_level;		// 글레벨
	private String content;		// 글내용
	private int category;		// 글 목적 구분(공지사항)
	private int sid;			// 음식점 아이디
	private int did;			// 배달업체 아이디
	private String id;			// 관리자 아이디
	
	
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
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRefe() {
		return refe;
	}
	public void setRefe(int refe) {
		this.refe = refe;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}









