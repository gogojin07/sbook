package com.spring.sb.Service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.sb.Bean.Page;
import com.spring.sb.Bean.Reply;
import com.spring.sb.Dao.IPageDao;
import com.spring.sb.userClass.Paging;

@Service
public class PageMM {

	@Inject
	IPageDao pDao;

	ModelAndView mav;

	public ModelAndView create(Page page) {
		mav = new ModelAndView();
		String view = null;
		
		System.out.println("서비스" + page);
		boolean falg = pDao.create(page);
		System.out.println("서비스2" + page);
		if (falg)
			view = "redirect:/index?frm=menubar/themelist.jsp";
		else
			view = "redirect:/index?frm=menubar/themelist.jsp";
		/*
		 * String content = page.getPagecontent(); String pageopen = page.getPageopen();
		 * String pagesheet = page.getPagesheet(); page.setPagecontent(content);
		 * page.setPageopen(pageopen); page.setPagesheet(pagesheet);
		 */
		mav.setViewName(view);
		return mav;

	}

	public String pagecreate() {
		String p = null;
		Page page = new Page();
		pDao.pageInfo(page);

		p = page.getId();

		return p;
	}

	public ModelAndView getPage(int themeNo, Integer pageNum) {
		mav = new ModelAndView();
		String view = null;
		List<Page> pList = null;
		System.out.println(themeNo);

		pageNum = (pageNum == null) ? 1 : pageNum;
		
		pList = pDao.getPageList(themeNo, pageNum);

		System.out.println(pList);
		if (pList != null && pList.size() != 0) {
			mav.addObject("pList", pList);
			mav.addObject("paging", getPaging(pageNum));
			view = "index";
		} else {
			
			view = "redirect:/index?frm=menubar/themelist.jsp";
		}
		mav.setViewName(view);
		return mav;
	}

	private Object getPaging(Integer pageNum) {
		int maxNum = pDao.getPageCount(); // 글의 수
		int listCount = 2;
		int pageCount = 2;
		String boardName = "index"; // url
		Paging paging = new Paging(maxNum, pageNum, listCount, pageCount, boardName);
		return paging.makeHtmlPaging();
	}

	public ModelAndView pagedelete(Page pb) {
		String view=null;
		
		boolean pdel;
		System.out.println("여기까지옴ㅁ?"+pb);
		pdel=pDao.pageDelete(pb);
		
		view="redirect:/index?frm=menubar/themelist.jsp";
		
		mav.setViewName(view);
		return mav;
	}
	public ModelAndView getReply(Integer pageNo, HttpSession session) {
		mav=new ModelAndView();
		String view=null;
		System.out.println(pageNo);
		mav.addObject("pageNo",pageNo);
		List<Reply> rList= pDao.getReplyList(pageNo);
		
			
		
		
		mav.addObject("rList", rList);
		view="replywrite";
		mav.setViewName(view);
		return mav;
	}



}
