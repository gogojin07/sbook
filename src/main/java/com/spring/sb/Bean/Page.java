package com.spring.sb.Bean;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("page")
@Data
@Accessors(chain=true)
public class Page {
	private int pageNo;
	private int themeNo;
	private String id;
	private String pagecontent;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date p_date; 
	@DateTimeFormat(pattern = "yyyy년 MM월 dd일")
	private Date writedate;
	private String pageopen;
	private String pagesheet;
	
}
