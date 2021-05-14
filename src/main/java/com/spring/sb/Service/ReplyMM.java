package com.spring.sb.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.sb.Bean.Reply;
import com.spring.sb.Dao.IReplyDao;


@Service
public class ReplyMM {

	@Autowired(required = false)
	private IReplyDao rDao;
	@Autowired(required = false)
	ModelAndView mav;
	
	public ModelAndView replyInsert(Reply rb) {
		String view=null;
		boolean che;
		List<Reply> rList=null;
		
		
		System.out.println("여기까지옴>"+rb);
		che=rDao.replyInsert(rb);
		
		mav.setViewName("/login");
		
		
		return mav;
	}

}