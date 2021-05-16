package com.spring.sb.Service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.sb.Bean.Guest;
import com.spring.sb.Bean.Guestbook;
import com.spring.sb.Dao.IGuestDao;
@Service
public class GuestMM {
	@Inject
	IGuestDao gDao;
	
	ModelAndView mav;
	public ModelAndView g_Insert(Guest guest) {
		mav = new ModelAndView();
		System.out.println(guest);
		String view = null;
		System.out.println("service"+guest);
		
		boolean falg = gDao.g_Insert(guest);
		System.out.println("service2"+guest);
		
		if(falg) {
			view = "redirect:/index?frm=guestList.jsp";
		}else {
			view = "Guestwrite";
		}
		mav.setViewName(view);
		return mav;
	}
	
	public String g_write() {
		String gue = null;
		Guest guest = new Guest();
		gDao.guestInfo(guest);
		
		gue = guest.getId();
		
		return gue;
	}

	public ModelAndView getgList(HttpSession session, Guestbook gb) {
		mav = new ModelAndView();
		String view = null;
		List<Guest> gList = null;
		int gue =gb.getGuestno();
		System.out.println("gue"+gue);
		//String id = (String) session.getAttribute("id");
		//String id= ;
		//System.out.println("아이디인가효" + id);
		gList=gDao.getGuestList(gue);
		System.out.println("방명록 확인:"+gList);
		mav.addObject("gb", gb);
		mav.addObject("gList", gList);
		view="index";
		mav.setViewName(view);
		return mav;
	}

}
