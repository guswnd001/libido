package model;

import java.sql.Timestamp;

public class Board {

	private int num;
	private String boardid;
	private String kind;
	private String writer;
	private String subject;
	private String email;
	private String passwd;
	private Timestamp reg_date;
	private int readcount;
	private int ref;
	private int re_level;
	private int re_step;
	private String content;
	private String ip;
	private String filename;
	private int filesize;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getBoardid() {
		return boardid;
	}
	public void setBoardid(String boardid) {
		this.boardid = boardid;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRe_level() {
		return re_level;
	}
	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFilesize() {
		return filesize;
	}
	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}
	
	
	@Override
	public String toString() {
		return "BoardDataBean [num=" + num + ", boardid=" + boardid + ", kind=" + kind + ", writer=" + writer
				+ ", subject=" + subject + ", email=" + email + ", passwd=" + passwd + ", reg_date=" + reg_date
				+ ", readcount=" + readcount + ", ref=" + ref + ", re_level=" + re_level + ", re_step=" + re_step
				+ ", content=" + content + ", ip=" + ip + ", filename=" + filename + ", filesize=" + filesize + "]";
	}
}
