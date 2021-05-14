package com.spring.sb.Dao;

import java.util.List;



import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.spring.sb.Bean.Reply;

public interface IReplyDao {
	
	@Insert("INSERT INTO REPLY VALUES(R_SEQ.NEXTVAL,#{pageNo},#{id},#{replyContent},'no',#{r_date}, #{nickname})")
	boolean replyInsert(Reply rb);
	@Select("SELECT * FROM RLIST WHERE REPLYNO=#{rNum}")
	List<Reply> getReplyList(int pageNo);

}
