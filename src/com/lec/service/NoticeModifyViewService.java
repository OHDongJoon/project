package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.NoticeDao;
import com.lec.dto.NoticeDto;

public class NoticeModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		int nid = Integer.parseInt(request.getParameter("nid"));
		NoticeDao noticeDao = NoticeDao.getInstance();
		NoticeDto  dto = noticeDao.modifyNoticeView(nid);
		request.setAttribute("nContent", dto);

	}

}
