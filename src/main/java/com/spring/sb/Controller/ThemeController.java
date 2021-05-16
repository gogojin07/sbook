package com.spring.sb.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.runners.Parameterized.Parameter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.sb.Bean.Guest;
import com.spring.sb.Bean.Guestbook;
import com.spring.sb.Bean.Page;
import com.spring.sb.Bean.Reply;
import com.spring.sb.Bean.Theme;
import com.spring.sb.Bean.User;
import com.spring.sb.Service.GuestMM;
import com.spring.sb.Service.PageMM;
import com.spring.sb.Service.ReplyMM;
import com.spring.sb.Service.ThemeMM;
import com.spring.sb.Service.UserMM;

@Controller
public class ThemeController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired(required = false)
	private UserMM um; // 회원관리 서비스 클래스

	@Autowired(required = false)
	private ThemeMM tm;
	@Autowired(required = false)
	private UserController uc;
	@Autowired(required = false)
	private PageMM pm;
	@Autowired(required = false)
	private ReplyMM rm;
	@Autowired(required = false)
	private GuestMM gm;
	// 필드로만
	ModelAndView mav;

	// 로그인 후 첫화면
	@GetMapping(value = "/index")
	public ModelAndView index(@RequestParam("frm") String frm, Integer pageNum, HttpSession session, User ub,
			Theme tb, Integer themeNo, Guestbook gb, Guest g) {

		String view = null;
		System.out.println(frm);
		switch (frm) {
		// 첫화면 유저 테마 불러오기
		case "menubar/themelist.jsp":
			logger.info("메인화면테스트");
			mav = tm.getThemeList(pageNum, session);
			break;
		// 글쓰기
		/*
		 * case "writefrm.jsp": logger.info("글쓰기"); mav = tm.getThemeList(pageNum,
		 * session); mav.addObject(view = "wirtefrm"); break;
		 */
		// 수정할 모든 테마 불러오기
		case "themeset.jsp":
			logger.info("테마수정페이지");
			mav = tm.getThemeList(pageNum, session);
			mav.addObject(view = "themeset.jsp");
			break;
		// 내정보 불러오기
		case "myinfo.jsp":
			System.out.println(session.getAttribute("ub"));
			mav = um.getuserinfo(session);
			logger.info("내정보보기");
			break;
		// 내정보 수정하는페이지 불러오기
		case "myinfoupdatefrm.jsp":
			System.out.println("내정보수정페이지");
			mav = um.getuserinfo(session);
			break;
			//검색
		case "searchfrm.jsp":
			mav = um.getsearchinfo(ub);
			System.out.println("검색결과1" + ub);
			break;
			//검색후화면
		case "themesearchlist.jsp":
			mav = tm.getsearchthemelist(pageNum, session, ub);
			break;
		// 테마 업데이트
		case "themeupdatefrm.jsp":
			mav = tm.getthemeupdatelist(tb);
			System.out.println(tb);
			break;
		// 페이지보기
		case "pageview.jsp":

			mav = pm.getPage(themeNo, pageNum);

			System.out.println(themeNo);

			break;
		case "searchpageview.jsp":
			mav=pm.getPage(themeNo, pageNum);
			break;
		case "Guestwrite.jsp" :
			logger.info("방명록 작성");
			Guest gt =new Guest();
			mav.addObject(view = "Guestwrite.jsp");
		break;
		case "guestList.jsp" :
			System.out.println("화긴");
			mav=gm.getgList(session,gb);
			break;

		}
		return mav;

	}


	// 테마생성
	@PostMapping(value = "/themecreate")
	public ModelAndView themecreate(HttpSession session, Theme tb) {
		logger.info("테마생성");
		System.out.println(tb);

		mav = tm.themecreate(tb, session);

		return mav;
	}
	// 글쓰기

	@PostMapping(value = "insert")
	public ModelAndView pageinsert(@ModelAttribute Page page) {
		System.out.println("컨트롤러" + page);
		logger.info("글쓰기 완료");
		mav = pm.create(page);
		return mav;
	}
	// 테마업데이트
	@PostMapping(value = "themeupdate")
	public ModelAndView themeupdate(Theme tb) {

		System.out.println("테마업데이트시작" + tb);
		mav = tm.themeupdate(tb);
		return mav;

	}
	//테마삭제
	@PostMapping(value ="themedelete")
	public ModelAndView themedelete(Theme tb) {
		System.out.println("테마삭제시작");
		mav=tm.themedelete(tb);
		return mav;
	}
	//페이지삭제
	@PostMapping(value="pagedelete")
	public ModelAndView pagedelete(Page pb) {
		System.out.println("페이지삭제시작");
		mav=pm.pagedelete(pb);
		
		return mav;
	}
//	댓글보기
	@RequestMapping(value = "/content", method= RequestMethod.GET)
	public ModelAndView getReply(Integer pageNo, HttpSession session) {
		mav=pm.getReply(pageNo,session);
		return mav;
	}
	//댓글 쓰기
	@PostMapping(value = "replyInsert")
	public ModelAndView replyInsert(Reply rb){
		String view=null;
		System.out.println(rb);

		mav=rm.replyInsert(rb);
		
		return mav;
	}
}
