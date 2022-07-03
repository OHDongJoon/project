package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.NoticeDao;

public class NoticeModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		int nid = Integer.parseInt(request.getParameter("nid"));
		String atitle = request.getParameter("atitle");
		String acontent = request.getParameter("acontent");
		String aip	= request.getRemoteAddr(); 
		NoticeDao noticeDao = NoticeDao.getInstance();
		int result = noticeDao.modifyNotice(nid, atitle, acontent, aip);
		if(result == NoticeDao.SUCCESS) {
			request.setAttribute("noticeResult", result);
		}else {
			request.setAttribute("noticeResult", result);
		}
      
	}

}
