package com.marroticket.admin.notice.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class NoticeVO {

	private int noticeNo;
	private String title;
	private String content;
	private Date regDate;

}
