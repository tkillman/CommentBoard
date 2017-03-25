package spring.Dto;

import java.util.Date;

public class CommentCommand {

	
		private	int content_num;  //원글의 번호		
		private String commenter; //작성자
		private String commentt; //댓글
		private	String passwd; //비번
		private	Date reg_date; //날짜
		private String ip; //ip
		private int comment_num; //코멘트 식별번호 	
		
		public int getContent_num() {
			return content_num;
		}
		public void setContent_num(int content_num) {
			this.content_num = content_num;
		}
		public String getCommenter() {
			return commenter;
		}
		public void setCommenter(String commenter) {
			this.commenter = commenter;
		}
		public String getCommentt() {
			return commentt;
		}
		public void setCommentt(String commentt) {
			this.commentt = commentt;
		}
		public String getPasswd() {
			return passwd;
		}
		public void setPasswd(String passwd) {
			this.passwd = passwd;
		}
		public Date getReg_date() {
			return reg_date;
		}
		public void setReg_date(Date reg_date) {
			this.reg_date = reg_date;
		}
		public String getIp() {
			return ip;
		}
		public void setIp(String ip) {
			this.ip = ip;
		}
		public int getComment_num() {
			return comment_num;
		}
		public void setComment_num(int comment_num) {
			this.comment_num = comment_num;
		}
		

		
		
	
}
