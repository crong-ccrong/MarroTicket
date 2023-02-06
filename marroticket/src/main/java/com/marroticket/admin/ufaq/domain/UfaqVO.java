package com.marroticket.admin.ufaq.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class UfaqVO {

	private int ufaqNo;
	private String title;
	private String content;
	private Date regDate;

	public int getUfaqNo() {
		return ufaqNo;
	}

	public void setUfaqNo(int ufaqNo) {
		this.ufaqNo = ufaqNo;
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

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

}
