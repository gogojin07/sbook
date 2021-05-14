package com.spring.sb.Dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.sb.Bean.User;



@Repository
public class UserDao {
private SqlSessionTemplate tpl;
	
	public boolean getLoginResult(User ub) {
		return tpl.selectOne("userMapper.getLoginResult",ub);
	}
}
