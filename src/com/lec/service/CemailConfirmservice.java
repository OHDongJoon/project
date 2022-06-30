package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.CustomerDao;

public class CemailConfirmservice implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String cEmail = request.getParameter("cEmail");
		CustomerDao cDao = CustomerDao.getInstance();
		//email 중복체크
		int result = cDao.emailConfirm(cEmail);
		if(result == CustomerDao.NONEXISTENT) {
			request.setAttribute("emailConfirmResult", "사용 가능한 메일입니다");
		}else {
			request.setAttribute("emailConfirmResult", "<b>사용 불가한 중복된 메일</b>");
		}
		
	}

}
