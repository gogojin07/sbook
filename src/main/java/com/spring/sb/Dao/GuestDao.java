package com.spring.sb.Dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.sb.Bean.Guest;
@Repository
public class GuestDao {
	private SqlSessionTemplate tql;
	
	public boolean Cinsert(Guest guest) {
		System.out.println("dao왔니?="+guest);
		return tql.selectOne("guestMapper.insert",guest);
	}
}
