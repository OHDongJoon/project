package com.lec.service;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.AdminMenuDao;
import com.lec.dto.AdminMenuDto;

public class MenuAllViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//int avg = Integer.parseInt(request.getParameter("avg"));
		AdminMenuDao aDao = AdminMenuDao.getInstance();
		ArrayList<AdminMenuDto> menus = aDao.listMenu();
//		for(int i = 0; i <menus.size(); i++) {
//			int avg = ((int)menus.get(i).getAvg());
//		}
		request.setAttribute("mAllView", menus);
		

	}

}
