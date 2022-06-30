package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dao.AdminDao;
import com.lec.dto.AdminDto;

public class AWithdrawalService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		AdminDto admin = (AdminDto)session.getAttribute("admin");
		if(admin!=null) {
			String aId = admin.getaId();
			AdminDao aDao = AdminDao.getInstance();
			int result = aDao.awithdrawal(aId);
			if(result == AdminDao.SUCCESS) {
				request.setAttribute("awithdrawalResult", "관리자 탈퇴 성공!");
			}else {
				request.setAttribute("awithdrawalResult", "관리자 탈퇴 실패!");
			}
		}else {
			request.setAttribute("awithdrawalResult", "로그인 된 관리자가 없습니다");
		}
		session.invalidate();
	}

}
