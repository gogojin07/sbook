package com.spring.sb.Service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.SessionAttributeMethodArgumentResolver;

import com.spring.sb.Bean.Guest;
import com.spring.sb.Bean.Guestbook;
import com.spring.sb.Bean.Theme;
import com.spring.sb.Bean.User;
import com.spring.sb.Dao.IGuestDao;
import com.spring.sb.Dao.IThemeDao;
import com.spring.sb.Dao.IUserDao;
import com.spring.sb.userClass.Message;

@Service
public class UserMM {
	@Autowired(required = false)
	private IUserDao uDao;
	@Autowired(required = false)
	ModelAndView mav;
	private User ub;
	@Autowired
	private IGuestDao gDao;
	
	public ModelAndView userJoin(User ub,Guestbook gb) {

		mav = new ModelAndView();
		String view = null;
		boolean gbook;
		boolean flag = uDao.userJoin(ub);
		String id = ub.getId();
		String nickname = ub.getNickname();
		System.out.println(id);
		if (flag) {
			mav.addObject("data", new Message("회원가입이 완료되었습니다.", "/"));
			mav.setViewName("Message");
			
			gbook= gDao.GuestCreate(gb,id,nickname);
			mav.addObject("gbook", gbook);
			view = "redirect:/"; // 회원가입완료

		} else {

			view = "redirect:/join";

		}
		mav.setViewName(view);

		return mav;
	}

	public String userInfo() {
		String a = null;
		uDao.userInfo(ub);

		a = ub.getId();

		return a;

	}

	public ModelAndView login(User ub, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String view = null;

		String pwChk = uDao.getPwChk(ub.getId());
		boolean result = uDao.loginChk(ub);
		if (pwChk != null) {
			if (result) {
				ub = uDao.userSelect(ub);
				session.setAttribute("id", ub.getId());
				session.setAttribute("nickname", ub.getNickname());
				session.setAttribute("email", ub.getEmail());
				session.setAttribute("birth", ub.getBirth());
				session.setAttribute("profile", ub.getProfile());
				session.setAttribute("ub", ub);
				view = "redirect:/index?frm=menubar/themelist.jsp";

			} else {// 비번 다를때
				view = "redirect:/";
				mav.addObject("check", 2);
				mav.addObject("message", "비밀번호가 일치하지 않습니다.");
			}
		} else {// 아이디 불일치
			view = "redirect:/";
			mav.addObject("chk", 2); // 1. 성공 2. 시류ㅐ
			mav.addObject("message", "회원정보가 없는 회원입니다.");
		}

		mav.setViewName(view);
		return mav;
	}

	public ModelAndView getuserinfo(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String view = null;
		ub = (User) session.getAttribute("ub");
		System.out.println(ub);
		view = "index";
		mav.setViewName(view);
		return mav;

	}

	public ModelAndView getsearchinfo(User ub) {
		ModelAndView mav = new ModelAndView();
		String view = null;
		List<User> uList = null;

		uList = uDao.getSearchinfo(ub);
		System.out.println(uList);

		if (uList != null && uList.size() != 0) {

			mav.addObject("uList", uList);
			view = "index";

		} else {
			view = "index";
		}

		mav.setViewName(view);
		return mav;

	}

	public ModelAndView myinfoupdate(User ub, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		boolean flag;
		String view = null;
		flag = uDao.userupdate(ub);
		session.invalidate();
		view = "redirect:/";

		mav.setViewName(view);

		return mav;
	}
	

	/*
	 * public ModelAndView idfind(String email, String birth){ String view = null;
	 * ub = uDao.userIdFind(email, birth); System.out.println(ub); if (ub == null) {
	 * 
	 * } view="login"; mav.setViewName(view); return mav; }
	 * 
	 * public ModelAndView pwfind(String id, String email) { ub =
	 * uDao.userPwFind(id, email); return mav; }
	 */
	public Map<String, Object> idFind(Map<String, Object> paramMap) {
		Map<String, Object> resultMap = new HashMap();
		resultMap.put("status", "fail");
		String email = paramMap.get("email").toString();
		String birth = paramMap.get("date").toString();
		
		Map<String, Object> resultData = new HashMap<>();
		String id = null;
		 id = uDao.selectUserIdByEmailAndBirth(email, birth);
		if(id == null) {
			return resultMap;
		}
		else {			
			resultMap.put("id", id);
			resultMap.put("status", "success");				
		}
			return resultMap;
	}

	public Map<String, Object> pwFind(Map<String, Object> paramMap) {
		Map<String, Object> resultMap = new HashMap();
		resultMap.put("status", "fail");
		String id = paramMap.get("id").toString();
		String email = paramMap.get("email").toString();
		
		Map<String, Object> resultData = new HashMap<>();
		String pw = null;
		pw = uDao.selectUserPwByIdAndEmail(id, email);
		if(pw == null) {
			return resultMap;
		}
		else {			
			resultMap.put("pw", pw);
			resultMap.put("status", "success");				
		}
			return resultMap;
	}
	public ModelAndView myinfodelete(User ub, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String view = null;
		
		uDao.replyDelete(ub);
		uDao.guestDelete(ub);
		uDao.guestbookDelete(ub);
		uDao.pageDelete(ub);
		uDao.themeDelete(ub);
		uDao.userdelete(ub);
		session.invalidate();
		view = "redirect:/";

		mav.setViewName(view);

		return mav;
	}
	public int idChk(String id) {
		System.out.println("서비스="+id);
		int result = uDao.idChk(id);
		System.out.println("service="+id);
		return result;
	} 

	
	

}
