package com.spring.sb.Bean;

import org.apache.ibatis.type.Alias;
import lombok.Data;
import lombok.experimental.Accessors;
@Alias("user")
@Accessors(chain = true)
@Data
public class User {
	private String id;
	private String pw;
	private String email;
	private int birth; 
	private String nickname;
	private String emailopen;
	private String birthopen;
	private String profile;
}
