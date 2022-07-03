package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.AdminMenuDao;
import com.lec.dto.AdminMenuDto;

public class MenuModifyViewService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int foodid = Integer.parseInt(request.getParameter("foodid"));
		AdminMenuDao menuModify = AdminMenuDao.getInstance();
		AdminMenuDto dto = menuModify.modifyMenuView(foodid);
		request.setAttribute("menuContent", dto);

	}

}
