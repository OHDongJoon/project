package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.MenuReivewDao;

public class ReivewDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int mgroup = Integer.parseInt(request.getParameter("mgroup"));
		int mstep = Integer.parseInt(request.getParameter("mstep"));
		int mindent = Integer.parseInt(request.getParameter("mindent"));
		MenuReivewDao reivewDao = MenuReivewDao.getInstance();
		int result = reivewDao.deleteReivew(mgroup, mstep, mindent);
		if(result == MenuReivewDao.SUCCESS) {
			request.setAttribute("reivewDelete", "글 삭제 성공");
		}else {
			request.setAttribute("reivewDelete", "글 삭제 실패 ");
		}

	}

}
