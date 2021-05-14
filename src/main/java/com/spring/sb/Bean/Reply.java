package com.spring.sb.Bean;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("reply")
@Data
@Accessors(chain=true)
public class Reply {
	private int replyNo;
	private int pageNo;
	private String id;
	private String replyContent;
	private String profile;
	@DateTimeFormat(pattern = "yyyy년 MM월 dd일")
	private Date r_date;
	private String nickname;
}
