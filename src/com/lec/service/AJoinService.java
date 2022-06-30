package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dao.AdminDao;
import com.lec.dto.AdminDto;

public class AJoinService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String aId = request.getParameter("aId");
		String aPw = request.getParameter("aPw");
		String aName = request.getParameter("aName");
		AdminDao aDao = AdminDao.getInstance();
		
		//관리자 id 중복체크
		int result = aDao.aIdConfirm(aId);
		if(result == AdminDao.SUCCESS) {
			AdminDto admin = new AdminDto(aId, aPw, aName);
			//관리자 등록
			result = aDao.joinAdmin(admin);
			if(result == AdminDao.SUCCESS) {
				HttpSession session = request.getSession();
				session.setAttribute("aId", aId);
				request.setAttribute("ajoinResult", "관리자 등록 성공!");
			}else {
				request.setAttribute("ajoinError", "관리자 등록 실패!");
			}
		}else {
			request.setAttribute("ajoinError", "중복 id ");
		}

	}

}
