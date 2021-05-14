package com.spring.sb.Dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.sb.Bean.Page;



@Repository
public class PageDao{
	private SqlSessionTemplate tpl;
	
	public boolean create(Page page) {
		System.out.println("여기까지"+page);
		return tpl.selectOne("pageMapper.insert",page);
	}
}
