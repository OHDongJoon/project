package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dao.NoticeDao;
import com.lec.dto.AdminDto;

public class NoticeWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession httpSession = request.getSession();
		AdminDto admin =(AdminDto)httpSession.getAttribute("admin");
		if(admin != null) {
			String aid = request.getParameter("aid");
			String atitle = request.getParameter("atitle");
			String acontent = request.getParameter("acontent");
			String aip	= request.getRemoteAddr();
			NoticeDao noticeDao = NoticeDao.getInstance();
			int result = noticeDao.writeNotice(aid, atitle, acontent, aip);
			if(result == NoticeDao.SUCCESS) {
				request.setAttribute("noticeWriteResult", "공지글쓰기성공");
			}else {
				request.setAttribute("noticeWriteResult", "공지글쓰기 실패");
			}
		}else {
			request.setAttribute("noticeWriteResult", "관리자만 쓸 수 있을 테야");
		}

	}

}
