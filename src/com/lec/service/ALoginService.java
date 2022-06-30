package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dao.AdminDao;
import com.lec.dto.AdminDto;

public class ALoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String aId = request.getParameter("aId");
		String aPw = request.getParameter("aPw");
		AdminDao aDao = AdminDao.getInstance();
		int result = aDao.aloginCheck(aId, aPw);
		if(result == AdminDao.SUCCESS) {
			HttpSession session = request.getSession();
			AdminDto admin = aDao.getAdmin(aId);
			session.setAttribute("admin", admin);
			request.setAttribute("adminLoginResult", "관리자계정으로 들어오셨습니다");
		}else {
			System.out.println("에러");
			request.setAttribute("adminloginErrorMsg", "아이디와 비번을 확인하세요");
		}

	}

}