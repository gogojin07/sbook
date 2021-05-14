package com.spring.sb.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.sb.Bean.Reply;
import com.spring.sb.Service.PageMM;
import com.spring.sb.Service.ReplyMM;

@Controller
public class ReplyController {
	@Autowired(required = false)
	private ReplyMM rm;
	@Autowired(required = false)
	private PageMM pm;
	ModelAndView mav;
	
////	댓글보기
//	@RequestMapping(value = "/replyinsert", method= RequestMethod.POST)
//	public ModelAndView getReply(Integer pageNo, HttpSession session) {
//		mav=pm.getReply(pageNo,session);
//		return mav;
//	}
	
	/*
	 * @PostMapping(value = "replyInsert") public ModelAndView replyInsert(Reply
	 * rb){ String view=null; System.out.println(rb);
	 * 
	 * mav=rm.replyInsert(rb);
	 * 
	 * return mav; }
	 */
}
