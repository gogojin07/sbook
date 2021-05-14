package com.spring.sb.Controller;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.JdbcAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.ViewNameMethodReturnValueHandler;

import com.spring.sb.Bean.User;
import com.spring.sb.Service.UserMM;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import oracle.jdbc.proxy.annotation.Post;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired(required = false)
	private UserMM um; // 회원관리 서비스 클래스
	@Autowired(required = false)
	private ThemeController tc;
	// 필드로만
	ModelAndView mav;

	@GetMapping(value = "/")
	public String login() {
		/*
		 * String a=null; a=um.userInfo(); System.out.println(a);
		 */
		logger.info("로그인");
		return "login";
	}

//회원가입
	@GetMapping(value = "/join")
	public String join() {
		logger.info("회원가입페이지");
		return "join"; // .jsp
	}

//회원가입완료
	@PostMapping(value = "/userjoin")
	public ModelAndView userjoin(User ub) {
		System.out.println(ub);
		logger.info("회원가입완료");
		mav = um.userJoin(ub);

		return mav;
	}

	// 로그인완료
	@PostMapping(value = "/access")
	public ModelAndView login(User ub, HttpSession session) {
		mav = um.login(ub, session);

		return mav; // .jsp
	}

	// 로그아웃
	@GetMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 세션초기화
		return "redirect:/"; // post,get---->get만
	}

	// 내정보 수정
	@PostMapping(value = "myinfoupdate")
	public ModelAndView myinfoupdate(User ub, HttpSession session) {
		System.out.println("내정보수정하기" + ub);
		mav = um.myinfoupdate(ub, session);
		return mav;
	}

	// 아이디찾기페이지
	@GetMapping(value = "/idfindfrm")
	public String idfindfrm() {
		System.out.println("ID나옴");
		return "idfindfrm";
	}

//아이디찾기
	@PostMapping(value = "/idfind")
	public ModelAndView idfind(String email, String birth){
		System.out.println("email=" + email + "_생일=" + birth);
		um.idfind(email, birth);
		return mav;
	}

//비밀번호찾기페이지
	@GetMapping(value = "/pwfindfrm")
	public String pwfindfrm() {
		System.out.println("PW나옴");
		return "pwfindfrm";
	}

//비밀번호찾기
	@GetMapping(value = "/pwfind")
	public ModelAndView pwfind(String id, String email) {
		um.pwfind(id, email);
		return mav;
	}
//회원탈퇴
	@PostMapping(value="myinfodelete")
	public ModelAndView myinfodelete(User ub, HttpSession session) {
		System.out.println("회원탈퇴시작"+ub);
		mav=um.myinfodelete(ub, session);
		
		return mav;
	}
	//아이디 중복체크
	@GetMapping(value="userjoin/userIdChk")
	public @ResponseBody int idChk(String id) {
		logger.info("아이디체크");
		System.out.println(id);
		int result = um.idChk(id);
		System.out.println("컨트롤1="+id);
		return result;
	}
}
