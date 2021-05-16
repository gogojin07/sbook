package com.spring.sb.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.spring.sb.Bean.Guest;
import com.spring.sb.Bean.Guestbook;
import com.spring.sb.Bean.Theme;

public interface IGuestDao {
	
	@Insert("INSERT INTO GUEST VALUES(#{guestno},#{id},#{g_date},#{guestcontent},#{nickname},'no',gn_seq.nextval)")
	boolean g_Insert(Guest guest);

	@Select("SELECT * FROM GUEST")
	boolean guestInfo(Guest guest);

	@Select("select*from guest where guestno=#{guestno}")
	List<Guest> getGuestList(int guestno);

	@Insert("INSERT INTO guestbook VALUES(g_seq.nextval,#{id},'방명록',#{nickname})")
	boolean GuestCreate(Guestbook gb,@Param("id") String id,@Param("nickname") String nickname);

	@Select("select *from guestbook where id=#{id} ")
	List<Guestbook> getGuestBookList(@Param("id") String id);
	
}
