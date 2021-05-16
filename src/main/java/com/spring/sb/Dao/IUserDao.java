package com.spring.sb.Dao;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.spring.sb.Bean.User;



public interface IUserDao {


//	public boolean access(User ub);
	
	@Insert("INSERT INTO SBUSER VALUES(#{id},#{pw},#{email},'no',#{birth},#{nickname},#{birthopen},#{emailopen})")
	boolean userJoin(User ub);
	@Select("Select * from sbuser")
	boolean userInfo(User ub);
	
	@Select("select COUNT(*) from sbuser where id=#{id} and pw=#{pw}")
	boolean loginChk(User ub);
	@Select("select pw from sbuser where id=#{id}")
	String getPwChk(String id);
	
	@Select("select * from sbuser where id=#{id}")
	User userSelect(User ub);
	@Select("select * from sbuser where nickname like#{nickname}")
	List<User> getSearchinfo(User ub);
	
	@Update("update sbuser set profile=#{profile}, nickname=#{nickname}, emailopen=#{emailopen}, birthopen=#{birthopen} where id=#{id}")
	boolean userupdate(User ub);
	
	/*
	 * @Select("select * from sbuser where email=#{email} and birth=#{birth}") User
	 * userIdFind(@Param("email") String email, @Param("birth") String birth);
	 * 
	 * 
	 * @Select("select * from sbuser where id=#{id} and email=#{email}") User
	 * userPwFind(@Param("id") String id, @Param("email") String email);
	 */
	/*
	 * @Select("select id from sbuser where email=#{email} and birth=#{birth}")
	 * String findUserIdByEmailAndBirth(@Param("email") String
	 * email, @Param("birth")
	 */
	@Select("SELECT ID FROM SBUSER WHERE EMAIL = #{email} AND BIRTH = #{birth}")
	String selectUserIdByEmailAndBirth(@Param("email") String email, @Param("birth") String birth);
	    
    @Select("SELECT PW FROM SBUSER WHERE ID = #{id} AND EMAIL = #{email}")
	String selectUserPwByIdAndEmail(@Param("id") String id, @Param("email") String email);
    
    @Delete("delete from sbuser where id=#{id}")
	boolean userdelete(User ub);
    @Delete("delete from theme where id=#{id}")
	boolean themeDelete(User ub);
    @Delete("delete from page where id=#{id}")
	boolean pageDelete(User ub);
    @Delete("delete from reply where id=#{id}")
	boolean replyDelete(User ub);
    @Delete("delete from guest where id=#{id}")
	boolean guestDelete(User ub);
    @Select("select count(*) from sbuser where id=#{id}")
	int idChk(String id);
	
	
//	public String getSecurityPwd(String id);

//	public User getUserInfo(String id);

}
