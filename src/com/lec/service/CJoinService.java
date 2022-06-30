package com.lec.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dao.CustomerDao;
import com.lec.dto.CustomerDto;

public class CJoinService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		 String cId =request.getParameter("cId");
		  String cPw =request.getParameter("cPw");
		  String cName =request.getParameter("cName");
		  String cEmail =request.getParameter("cEmail");
		  String cBirthStr = request.getParameter("cBirth");
		  Date cBirth = null;
		  if(!cBirthStr.equals("")) {
			  cBirth = Date.valueOf(cBirthStr);
		  }
		  String cAddress =request.getParameter("cAddress");
          CustomerDao cDao = CustomerDao.getInstance();
          CustomerDto customer = new CustomerDto(cId, cPw, cName, cEmail, cBirth, cAddress, null);
          // 회원가입
          int result =cDao.joinCustomer(customer);
          if(result == CustomerDao.SUCCESS) {
        	  HttpSession session = request.getSession();
        	  session.setAttribute("cId", cId);
        	  request.setAttribute("joinResult", "회원가입이 완료되었습니다");
			}else {
				request.setAttribute("joinErrorMsg", "정보가 너무 길어서 회원가입 실패");
			}
	}

}
