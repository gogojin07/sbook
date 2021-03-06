package com.spring.sb.Dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring.sb.Bean.Page;
import com.spring.sb.Bean.Reply;

public interface IPageDao {

	@Insert("INSERT INTO PAGE VALUES(P_SEQ.NEXTVAL,#{themeNo},#{id},#{pagecontent},#{p_date},'20210403',#{pageopen},#{pagesheet})")
	boolean create(Page page);

	@Select("SELECT * FROM PAGE")
	boolean pageInfo(Page page);

	@Select("select * from page where themeNo=#{themeNo} order by p_date desc")
	List<Page> getPageList(@Param("themeNo") int themeNo, @Param("pageNum") Integer pageNum);

	@Select("SELECT COUNT(*) FROM page")
	int getPageCount();

	@Delete("delete from page where pageNo=#{pageNo}")
	boolean pageDelete(Page pb);

	@Select("select *from reply where pageNo=#{pageNo}")
	List<Reply> getReplyList(Integer pageNo);

	//글수정
	@Update("update page set pagecontent=#{pagecontent}, p_date=#{p_date}, writedate=#{writedate}, pageopen=#{pageopen}, pagesheet=#{pagesheet} where pageNo=#{pageNo}")
	boolean pageUpdate(Page pg);

	//글 수정 페이지
	@Select("select*from page where pageNo=#{pageNo}")
	List<Page> getPageupdate(Page pg);
}
