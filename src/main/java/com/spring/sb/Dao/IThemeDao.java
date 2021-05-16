package com.spring.sb.Dao;

import java.util.List;


import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring.sb.Bean.Theme;
import com.spring.sb.Bean.User;




public interface IThemeDao {
	@Select("SELECT * FROM theme where id=#{id} and open is not null")
	 List<Theme> getThemeList(@Param("pageNum") Integer pageNum,@Param("id") String id);

	@Select("SELECT COUNT(*) FROM THEME")
	int getThemeCount();

	@Select("select*from theme where themeNo=#{themeNo, jdbcType=NUMERIC}")
	Theme getThemedetail(Integer themeNo);

	@Select("select*from theme where themeno=#{themeNo}")
	List<Theme> getThemeupdate(Theme tb);
	
	@Insert("INSERT INTO theme VALUES(seq_theme.nextval,#{id},#{themename},#{color},#{open},#{diaryopen},#{calendaropen})")
	boolean themecreate(Theme tb);

	@Update("update theme set themename=#{themename},color=#{color},open=#{open},diaryopen=#{diaryopen},calendaropen=#{calendaropen} where themeno=#{themeNo}")
	boolean Themeupdate(Theme tb);
	
	@Delete("delete from page where themeNo=#{themeNo}")
	boolean themepageDelete(Theme tb);
	
	@Delete("delete from theme where themeNo=#{themeNo}")
	boolean themeDelete(Theme tb);

	@Insert("INSERT INTO theme VALUES(seq_theme.nextval,#{id},'방명록','#000000','on','on','on')")
	boolean GuestCreate(Theme tb);
}
