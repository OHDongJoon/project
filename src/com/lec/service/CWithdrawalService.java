package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dao.CustomerDao;
import com.lec.dto.CustomerDto;


public class CWithdrawalService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		CustomerDto customer = (CustomerDto)session.getAttribute("customer");
		if(customer!=null) {
			String cId = customer.getcId();
			CustomerDao  cDao = CustomerDao.getInstance();
			cDao.withdrawal2(cId); // 회원탈퇴전에 글 삭제 
			int result = cDao.withdrawal(cId);
			if(result == CustomerDao.SUCCESS) {
				request.setAttribute("withdrawalResult", "회원탈퇴가 성공되었습니다. 작성하신 모든 글도 다 지워집니다");
			}else {
				request.setAttribute("withdrawalResult", "회원탈퇴가 실패되었습니다");
			}
		}else {
			request.setAttribute("withdrawalResult", "로그인 된 회원이 아닙니다");
		}
		session.invalidate();
	}

}