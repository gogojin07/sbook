package com.spring.sb.Bean;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("guest")
@Data
@Accessors(chain = true)
public class Guest {
	private int guestno;
	private String id;
	@DateTimeFormat(pattern = "yyyy년 MM월 dd일")
	private Date g_date;
	private String guestcontent;
	private String nickname;
	private String profile;
	private int gbnumber;
}
