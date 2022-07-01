package com.lec.service;


import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dao.AdminMenuDao;
import com.lec.dto.AdminMenuDto;

public class MenuAllViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		AdminMenuDao aDao = AdminMenuDao.getInstance();
		ArrayList<AdminMenuDto> menus = aDao.listMenu();
		request.setAttribute("mAllView", menus);

	}

}
