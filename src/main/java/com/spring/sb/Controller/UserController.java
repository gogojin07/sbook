package com.spring.sb.Controller;

import java.util.HashMap;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.sb.Bean.Guestbook;
import com.spring.sb.Bean.User;
import com.spring.sb.Service.UserMM;

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
		logger.info("로그인");
		return "login";
	}

//회원가입
	@GetMapping(value = "/join")
	public String join() {
		logger.info("회원가입페이지");
		return "join"; //
	}

//회원가입완료
	@PostMapping(value = "/userjoin")
	public ModelAndView userjoin(User ub, Guestbook gb) {
		System.out.println(ub);
		logger.info("회원가입완료");
		mav = um.userJoin(ub, gb);

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
	public ModelAndView idfindfrm(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		logger.info("idFind 페이지");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("idfindfrm");
		return mav;
	}

	// 아이디찾기
	@PostMapping("/idfind")
	@ResponseBody
	public Map<String, Object> post_idFind(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, @RequestParam Map<String, Object> paramMap) {
		logger.info("idFind 기능");

		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("status", "fail");

		Map<String, Object> resultIdFindMap = new HashMap<>();
		resultIdFindMap = um.idFind(paramMap);

		if (resultIdFindMap == null) {
			return resultMap;
		} else {
			if (resultIdFindMap.get("status") != null && resultIdFindMap.get("id") != null) {
				resultMap.put("status", "success");
				resultMap.put("id", resultIdFindMap.get("id").toString());
				return resultMap;
			}
		}
		return resultMap;
	}

	// 비밀번호찾기페이지
	@GetMapping(value = "/pwfindfrm")
	public ModelAndView pwfindfrm() {
		logger.info("pwfindfrm 페이지");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pwfindfrm");
		return mav;
	}

	// 비밀번호찾기기
	@PostMapping("/pwfind")
	@ResponseBody
	public Map<String, Object> post_pwFind(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, @RequestParam Map<String, Object> paramMap) {
		logger.info("pwFind 기능");

		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("status", "fail");

		Map<String, Object> resultPwFindMap = new HashMap<>();
		resultPwFindMap = um.pwFind(paramMap);

		if (resultPwFindMap == null) {
			return resultMap;
		} else {
			if (resultPwFindMap.get("status") != null && resultPwFindMap.get("pw") != null) {
				resultMap.put("status", "success");
				resultMap.put("pw", resultPwFindMap.get("pw").toString());
				return resultMap;
			}
		}
		return resultMap;
	}

//회원탈퇴
	@PostMapping(value = "myinfodelete")
	public ModelAndView myinfodelete(User ub, HttpSession session) {
		System.out.println("회원탈퇴시작" + ub);
		mav = um.myinfodelete(ub, session);

		return mav;
	}

	// 아이디 중복체크
	@GetMapping(value = "userjoin/userIdChk")
	public @ResponseBody int idChk(String id) {
		logger.info("아이디체크");
		System.out.println(id);
		int result = um.idChk(id);
		System.out.println("컨트롤1=" + id);
		return result;
	}
}
