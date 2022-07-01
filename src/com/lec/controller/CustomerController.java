package com.lec.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.service.AJoinService;
import com.lec.service.ALoginService;
import com.lec.service.AWithdrawalService;
import com.lec.service.CJoinService;
import com.lec.service.CLoginService;
import com.lec.service.CLogoutService;
import com.lec.service.CModifyService;
import com.lec.service.CWithdrawalService;
import com.lec.service.CemailConfirmservice;
import com.lec.service.CidConfirmService;
import com.lec.service.MenuAllViewService;
import com.lec.service.MenuInsertService;
import com.lec.service.Service;

@WebServlet("*.do")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private boolean go = false;
	private boolean  back = false;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request , response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request , response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		String viewPage = null;
		Service service = null;
		/* * * * * * * * * * *  * * * * * * * * * * * *
		 * * * * * * * * * customer 관련 요청  * * * * * * *
		* * * * * * * * * * *  * * * * * * * * * * * * */
		if(com.equals("/main.do")) { // 메인 화면
			viewPage = "main/main.jsp";
		}else if(com.equals("/joinView.do")) { // 회원가입 화면
			viewPage = "customer/join.jsp";
			  go = true;
		}else if(com.equals("/join.do")) { // 회원가입 처리 
		 if(go) {
			service = new CJoinService();
			service.execute(request, response);
			go = false;
		 }
			viewPage = "customer/login.jsp";
		}else if(com.equals("/idConfirm.do")) { // 아디 중복확인
			service = new CidConfirmService();
			service.execute(request, response);
			viewPage = "customer/idConfirm.jsp";
		}else if(com.equals("/emailConfirm.do")) { // 메일 중복확인
			service = new CemailConfirmservice();
			service.execute(request, response);
			viewPage = "customer/emailConfirm.jsp";
		}else if(com.equals("/loginView.do")) { // 로그인 화면
			viewPage = "customer/login.jsp";
		}else if(com.equals("/login.do")) { // 로그인 db및 세션 처리
			service = new CLoginService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(com.equals("/logout.do")) { //로그아웃
			service = new CLogoutService();
			service.execute(request, response);
			viewPage ="main/main.jsp";
		}else if(com.equals("/modifyView.do")) { // 정보수정
			viewPage ="customer/modify.jsp";
			go = true;
		}else if(com.equals("/modify.do")) {
			if(go) {
			service = new CModifyService();
			service.execute(request, response);
			go = false;
			}
			viewPage = "main/main.jsp";
		}else if(com.equals("/withdrawalView.do")) { // 회원탈퇴
			viewPage = "customer/withdrawalView.jsp";
		}else if(com.equals("/withdrawal.do")) {
			service = new CWithdrawalService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
			/* * * * * * * * * * *  * * * * * * * * * * * *
			* * * * * * * * * Admin 관련 요청  * * * * * * *
			* * * * * * * * * * *  * * * * * * * * * * * * */
		}else if(com.equals("/adminLoginView.do")) { // 관리자 로그인 화면
			viewPage ="admin/adminLogin.jsp";
		}else if(com.equals("/adminLogin.do")) { // 관리자 로그인 처리
			service = new ALoginService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(com.equals("/adminjoinView.do")) { // 관리자 등록화면
			viewPage = "admin/adminjoin.jsp";
		}else if(com.equals("/adminjoin.do")) { // 관리자 등록 처리
			service = new AJoinService();
			service.execute(request, response);
			viewPage = "admin/adminLogin.jsp";
		}else if(com.equals("/awithdrawalView.do")) { // 관리자 탈퇴
			viewPage = "admin/awithdrawalView.jsp";
		}else if(com.equals("/awithdrawal.do")) { // 처리
			service = new AWithdrawalService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(com.equals("/MenuinsertView.do")) { // 메뉴등록 화면
			viewPage = "admin/MenuinsertView.jsp";
		}else if(com.equals("/Menuinsert.do")) { // 메뉴등록 처리
			service = new MenuInsertService();
			service.execute(request, response);
			viewPage = "main/main.jsp";   // 나중에 메뉴보기 뷰로 수정
		}else if(com.equals("/MenuallView.do")) { //메뉴목록 가져오기
			service = new MenuAllViewService();
			service.execute(request, response);
			viewPage = "customer/menuview.jsp";
			/* * * * * * * * * * *  * * * * * * * * * * * *
			* * * * * * * * * Menu_Review 게시판  * * * * * * *
			* * * * * * * * * * *  * * * * * * * * * * * * */
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
