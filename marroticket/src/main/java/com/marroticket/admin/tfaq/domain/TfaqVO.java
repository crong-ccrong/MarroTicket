package com.marroticket.admin.tfaq.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class TfaqVO {

	private int tfaqNo;
	private String title;
	private String content;
	private Date regDate;

	public int getTfaqNo() {
		return tfaqNo;
	}

	public void setTfaqNo(int tfaqNo) {
		this.tfaqNo = tfaqNo;
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
