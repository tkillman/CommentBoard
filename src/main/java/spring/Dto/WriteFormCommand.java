package spring.Dto;

import java.util.Date;
import java.util.List;

public class WriteFormCommand {

	private String num;
	private String ref;
	private String re_step;
	private String re_level;
	
	private String writer;
	private String subject;
	private String email;
	private String content;
	private String passwd;
	private Date reg_date;
	private String ip;
	private int readcount;
	
	
	
	
	
	
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getRef() {
		return ref;
	}
	public void setRef(String ref) {
		this.ref = ref;
	}
	public String getRe_step() {
		return re_step;
	}
	public void setRe_step(String re_step) {
		this.re_step = re_step;
	}
	public String getRe_level() {
		return re_level;
	}
	public void setRe_level(String re_level) {
		this.re_level = re_level;
	}
	
	
	
	
	
	
	
}
