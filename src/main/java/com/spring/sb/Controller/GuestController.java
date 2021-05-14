package com.spring.sb.Controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.sb.Bean.Guest;
import com.spring.sb.Service.GuestMM;

@Controller
public class GuestController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	@Autowired
	private  GuestMM gm;
	ModelAndView mav;
	String view = null;
	@GetMapping(value="/Guestwrite")
	public ModelAndView calendar(){
		logger.info("방명록 작성");
		mav.addObject(view = "Guestwrite.jsp");
		return mav;
	}
	@RequestMapping(value="g_Insert", method=RequestMethod.POST)
	public ModelAndView g_insert(@ModelAttribute Guest guest, HttpSession session) {
		logger.info("방명록 작성완료");
		System.out.println("컨트롤러="+guest);
		String id=(String) session.getAttribute("id");
		System.out.println("id="+id);
		mav=gm.g_Insert(guest);
		return mav;
	}

/*	@GetMapping(value="/guestlist")
	public ModelAndView g_List(int themeNo, HttpSession session) {
		mav=gm.getgList(themeNo, session);
		return mav;*/
	//}
}
