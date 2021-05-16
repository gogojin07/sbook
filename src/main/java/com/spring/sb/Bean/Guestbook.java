package com.spring.sb.Bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;
import lombok.experimental.Accessors;

@Alias("guestbook")
@Data
@Accessors(chain = true)
public class Guestbook {

	private int guestno;
	private String themename;
	private String id;
	private String nickname;
}
