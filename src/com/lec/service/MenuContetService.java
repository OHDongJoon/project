package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.AdminMenuDao;
import com.lec.dto.AdminMenuDto;

public class MenuContetService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int foodid = Integer.parseInt(request.getParameter("foodid"));
		AdminMenuDao menuContent = AdminMenuDao.getInstance();
		AdminMenuDto dto = menuContent.contentMenu(foodid);
		System.out.println(dto);
		request.setAttribute("menuContent", dto);

	}

}
