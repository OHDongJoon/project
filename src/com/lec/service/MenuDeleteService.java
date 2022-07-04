package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.AdminMenuDao;

public class MenuDeleteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int foodid = Integer.parseInt(request.getParameter("foodid"));
		AdminMenuDao menuDao = AdminMenuDao.getInstance();
		int result = menuDao.deleteMenu2(foodid); // 후기글 먼저 삭제 
		System.out.println(result + "개 글 삭제됨");
		result = menuDao.deleteMenu(foodid); // 후기글 삭제후 메뉴 삭제
		if(result == AdminMenuDao.SUCCESS) {
			request.setAttribute("menuDeleteResult", "메뉴 호로로로 삭제완료 ");
		}else {
			request.setAttribute("menuDeleteResult", "메뉴 삭제 실패");
		}

	}

}
