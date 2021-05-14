package com.spring.sb.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.spring.sb.Bean.Guest;

public interface IGuestDao {
	
	@Insert("INSERT INTO GUEST VALUES(#{guestno},'1000012',#{id},#{themename},#{g_date},#{guestcontent},#{nickname},'no')")
	boolean g_Insert(Guest guest);

	@Select("SELECT * FROM GUEST")
	boolean guestInfo(Guest guest);

	@Select("select*from guest where id=#{id} and themeno='1000012'")
	List<Guest> getGuestList(String id);
	
}
