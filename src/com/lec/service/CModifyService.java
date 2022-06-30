package com.lec.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dao.CustomerDao;
import com.lec.dto.CustomerDto;

public class CModifyService implements Service {

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
         int result =cDao.modifyCustomer(customer);
         if(result == CustomerDao.SUCCESS) {
       	  HttpSession session = request.getSession();
       	  session.setAttribute("customer",customer);
       	  request.setAttribute("modifyResult", "회원 수정 완료");
			}else {
				request.setAttribute("modifyResult", "회원정보 수정 실패");
			}
	}

}