package com.lec.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.CustomerDao;

public class CidConfirmService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String cId = request.getParameter("cId");
		CustomerDao cDao = CustomerDao.getInstance();
		//id 중복체크
		int reuslt = cDao.cIdConfirm(cId);
		if( reuslt == CustomerDao.NONEXISTENT) {
			request.setAttribute("idConfirmResult", "사용 가능한 ID");
		}else {
			request.setAttribute("idConfirmResult", "<b>중복된 ID</b>");
		}
	}
}
