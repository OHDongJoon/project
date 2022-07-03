package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.NoticeDao;

public class NoticeDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int nid =Integer.parseInt(request.getParameter("nid"));
		NoticeDao noticeDao = NoticeDao.getInstance();
		int result = noticeDao.deleteNotice(nid);
		if(result == NoticeDao.SUCCESS) {
			request.setAttribute("noticeDeleteResult", result);
		}else {
			request.setAttribute("noticeDeleteResult", result);
		}

	}

}
