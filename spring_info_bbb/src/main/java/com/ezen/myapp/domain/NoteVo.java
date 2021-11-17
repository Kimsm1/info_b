package com.ezen.myapp.domain;

public class NoteVo {
	private String no;
	private String send_nick;
	private String recv_nick;
	private String send_time;
	private String content;
	private String ndelyn;
	public String getNdelyn() {
		return ndelyn;
	}
	public void setNdelyn(String ndelyn) {
		this.ndelyn = ndelyn;
	}
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getSend_nick() {
		return send_nick;
	}
	public void setSend_nick(String send_nick) {
		this.send_nick = send_nick;
	}
	public String getRecv_nick() {
		return recv_nick;
	}
	public void setRecv_nick(String recv_nick) {
		this.recv_nick = recv_nick;
	}
	public String getSend_time() {
		return send_time;
	}
	public void setSend_time(String send_time) {
		this.send_time = send_time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
