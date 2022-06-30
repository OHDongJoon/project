package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dao.CustomerDao;
import com.lec.dto.CustomerDto;

public class CLoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String cId = request.getParameter("cId");
		String cPw = request.getParameter("cPw");
		CustomerDao cDao = CustomerDao.getInstance();
		int result = cDao.loginCheck(cId, cPw);
		if(result == CustomerDao.SUCCESS) {
			HttpSession session = request.getSession();
			CustomerDto customer = cDao.getCustomer(cId);
			session.setAttribute("customer", customer);
		}else {
			request.setAttribute("loginErrorMsg", "아이디와 비번을 확인하세요");
		}

	}

}