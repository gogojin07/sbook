package com.spring.sb.Service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.sb.Bean.Guestbook;
import com.spring.sb.Bean.Theme;
import com.spring.sb.Bean.User;
import com.spring.sb.Dao.IGuestDao;
import com.spring.sb.Dao.IThemeDao;
import com.spring.sb.userClass.Paging;

@Service
public class ThemeMM {
	@Autowired
	private IThemeDao tDao;
	
	@Autowired
	private IGuestDao gDao;

	ModelAndView mav;

	public ModelAndView getThemeList(Integer pageNum, HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		List<Theme> tList = null;
		List<Guestbook> gList = null;

		pageNum = (pageNum == null) ? 1 : pageNum;

		String id = (String) session.getAttribute("id");
		System.out.println("아이디인가효" + id);
		tList = tDao.getThemeList(pageNum, id);
		gList = gDao.getGuestBookList(id);
		System.out.println("id: " + tList);
		System.out.println(gList);
		System.out.println(gList.get(0));
		
		//if (tList != null && tList.size() != 0) {
			//tList.get(0);

			mav.addObject("gList", gList);
			mav.addObject("tList", tList);
			mav.addObject("paging", getPaging(pageNum));
			view = "index"; // jsp
		//}//}
		
		mav.setViewName(view);
		return mav;
	}

	private String getPaging(Integer pageNum) {
		int maxNum = tDao.getThemeCount(); // 테마의 수
		int listCount = 6;
		int pageCount = 2;
		String themeName = "index"; // url
		Paging paging = new Paging(maxNum, pageNum, listCount, pageCount, themeName);
		return paging.makeHtmlPaging(); // "<이전><a href=3 4><다음>"
	}

	public ModelAndView themeupdate(Theme tb) {
		mav = new ModelAndView();
		String view = null;
		boolean flag;
		String opencheck = null;
		if (opencheck == tb.getOpen()) {
			tb.setOpen("off");
		}

		if (opencheck == tb.getDiaryopen()) {
			tb.setDiaryopen("off");
		}
		if (opencheck == tb.getCalendaropen()) {
			tb.setCalendaropen("off");
			System.out.println(tb);
		}


		flag = tDao.Themeupdate(tb);
		if (flag) {
			view = "redirect:/index?frm=menubar/themelist.jsp";
		}

		mav.setViewName(view);
		return mav;
	}

	public ModelAndView themecreate(Theme tb, HttpSession session) {
		mav = new ModelAndView();
		String view = null;
		System.out.println(tb);
		tb.setId((String) session.getAttribute("id"));
		boolean flag = tDao.themecreate(tb);

		if (flag) {

			view = "redirect:/index?frm=menubar/themelist.jsp"; // 테마생성완료

		} else {

			view = "redirect:/index?frm=menubar/themelist.jsp";
		}
		mav.setViewName(view);

		return mav;

	}

	public ModelAndView getsearchthemelist(Integer pageNum, HttpSession session, User ub) {
		mav = new ModelAndView();
		String view = null;
		List<Theme> tList = null;
		List<Guestbook> gList = null;
		pageNum = (pageNum == null) ? 1 : pageNum;

		/*
		 * if(pageNum<=0) { throw new CommonException("잘못된 페이지번호 입니다."); }
		 */
		String nickname =ub.getNickname();
		String id = ub.getId();
		String se = (String) session.getAttribute("id");
		if (se != id) {

			System.out.println("닉넴은?" + nickname);
			System.out.println("아이디인가효" + id);
			gList = gDao.getGuestBookList(id);
			tList = tDao.getThemeList(pageNum, id);
			System.out.println("방명록?"+gList);
			System.out.println("id: " + tList);
			view = "index";
		} else {
			view = "redirect:/index?frm=menubar/themelist.jsp";
		}

		//if (tList != null && tList.size() != 0) {
		//	tList.get(0);
			mav.addObject("gList", gList);
			mav.addObject("tList", tList);
			mav.addObject("paging", getPaging(pageNum));
			view = "index"; // jsp
		//}

		mav.setViewName(view);
		return mav;
	}

	public ModelAndView getthemeupdatelist(Theme tb) {
		List<Theme> tList = null;
		String view = null;
		
		tList = tDao.getThemeupdate(tb);
		System.out.println(tb);
		view = "index";
		mav.addObject("tList", tList);
		mav.setViewName(view);

		return mav;
	}

	public ModelAndView themedelete(Theme tb) {
		String view=null;
		boolean tdel;
		boolean pdel;
		System.out.println("여기까지옴ㅁ?");
		pdel=tDao.themepageDelete(tb);
		System.out.println("tb");
		tdel=tDao.themeDelete(tb);
		view="redirect:/index?frm=menubar/themelist.jsp";
		
		mav.setViewName(view);
		
		return mav;
	}

}