package com.spring.sb.Bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;
import oracle.sql.NUMBER;

@Alias("theme")
@Data
@Accessors(chain = true)
public class Theme {

	private int themeNo;
	private String id;
	private String themename;
	private String color;
	private String open;
	private String diaryopen;
	private String calendaropen;
	private String search;
}
