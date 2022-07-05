package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.MenuReivewDao;
import com.lec.dto.MenuReivewDto;

public class ReivewReplyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int mid = Integer.parseInt(request.getParameter("mid"));
		MenuReivewDao reivewDao = MenuReivewDao.getInstance();
		MenuReivewDto originReivew = reivewDao.modifyView_replyView(mid);
		request.setAttribute("originReivew", originReivew);
	}

}
