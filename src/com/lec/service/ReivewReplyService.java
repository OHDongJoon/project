package com.lec.service;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dao.MenuReivewDao;
import com.lec.dto.CustomerDto;

public class ReivewReplyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// mgroup , mstep , mindent pageNum
		// customer cName , cId , 
		// 글 mtitle ,  mcontent 본문 ,  mphoto 사진  
		HttpSession session = request.getSession();
		String cid = ((CustomerDto)session.getAttribute("customer")).getcId();
		System.out.println(cid);
		int foodid = Integer.parseInt(request.getParameter("foodid"));
		String mtitle = request.getParameter("mtitle");
		String mcontent = request.getParameter("mcontent");
		int mgroup = Integer.parseInt(request.getParameter("mgroup"));
		int mstep = Integer.parseInt(request.getParameter("mstep"));
		int mindent = Integer.parseInt(request.getParameter("mindent"));
		String mip = request.getRemoteAddr();
		MenuReivewDao reivewDao = MenuReivewDao.getInstance();
		
		System.out.println(foodid);
		System.out.println(mtitle);
		System.out.println(mcontent);
		System.out.println(mgroup);
		System.out.println(mstep);
		System.out.println(mindent);
		System.out.println(mip);
		int result = reivewDao.replyReivew(cid,foodid, mtitle, mcontent, mgroup, mstep, mindent, mip);
		
		if(result == MenuReivewDao.SUCCESS) {
			request.setAttribute("reply", "답변 성공");
		}else {
			request.setAttribute("reply", "답변 글  실패");
		}
		
	}

}
//int result = replyDao.replyReivew(mid, cid, foodid, mtitle, mcontent, mphoto, mgroup, mstep, mindent, mip)
