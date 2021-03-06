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
import com.lec.service.MenuContetService;
import com.lec.service.MenuDeleteService;
import com.lec.service.MenuInsertService;
import com.lec.service.MenuModifyService;
import com.lec.service.MenuModifyViewService;
import com.lec.service.NoticeContentService;
import com.lec.service.NoticeDeleteService;
import com.lec.service.NoticeListService;
import com.lec.service.NoticeModifyService;
import com.lec.service.NoticeModifyViewService;
import com.lec.service.NoticeWriteService;
import com.lec.service.ReivewContentService;
import com.lec.service.ReivewDeleteService;
import com.lec.service.ReivewListService;
import com.lec.service.ReivewModifyService;
import com.lec.service.ReivewModifyViewService;
import com.lec.service.ReivewReplyService;
import com.lec.service.ReivewReplyViewService;
import com.lec.service.ReivewWriteService;
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
			/* * * * * * * * * * *  * * * * * * * * * * * *
			* * * * * * * * * 관리자 음식 메뉴   관련 요청  * * * * * * *
			* * * * * * * * * * *  * * * * * * * * * * * * */
		}else if(com.equals("/MenuinsertView.do")) { // 메뉴등록 화면
			viewPage = "admin/MenuinsertView.jsp";
		}else if(com.equals("/Menuinsert.do")) { // 메뉴등록 처리
			service = new MenuInsertService();
			service.execute(request, response);
			viewPage = "MenuallView.do";   // 나중에 메뉴보기 뷰로 수정
		}else if(com.equals("/MenuallView.do")) { //메뉴목록 가져오기
			service = new MenuAllViewService();
			service.execute(request, response);
			viewPage = "menu/menuview.jsp";
		}else if(com.equals("/MenuContent.do")) { // 메뉴 상세보기
			service = new MenuContetService();
			service.execute(request, response);
			viewPage = "menu/menuContent.jsp";
		}else if(com.equals("/MenuModifyView.do")){ // 메뉴 수정하기 화면
			service = new MenuModifyViewService();
			service.execute(request, response);
			viewPage ="menu/menuModifyView.jsp";
		}else if(com.equals("/MenuModify.do")) { // 메뉴 수정 db 저장
			service = new MenuModifyService();
			service.execute(request, response);
			viewPage = "MenuallView.do"; 
		}else if(com.equals("/MenuDelete.do")) { // 메뉴 삭제
			service = new MenuDeleteService();
			service.execute(request, response);
			viewPage = "MenuallView.do";
			/* * * * * * * * * * *  * * * * * * * * * * * *
			* * * * * * * * * 공지사항 게시판  * * * * * * *
			* * * * * * * * * * *  * * * * * * * * * * * * */
		}else if(com.equals("/NoticeList.do")) { //공지사항 글목록
			service = new NoticeListService();
			service.execute(request, response);
			viewPage  = "notice/noticeList.jsp";
		}else if(com.equals("/NoticeWriteView.do")) { // 공지글쓰기
			viewPage ="notice/noticeWrite.jsp";
			go = true;
		}else if(com.equals("/NoticeWrite.do")) { // 공지글 db 저장
			if(go) {
			service = new NoticeWriteService();
			service.execute(request, response);
			go = false;
			    }
			viewPage = "NoticeList.do";
		}else if(com.equals("/noticeContent.do")) { // 공지글 상세보기
			service = new NoticeContentService();
			service.execute(request, response);
			viewPage = "notice/noticeContent.jsp";
		}else if(com.equals("/noticeModifyView.do")) { // 공지글 수정 화면
			service = new NoticeModifyViewService();
			service.execute(request, response);
			viewPage = "notice/noticeModify.jsp";
		}else if(com.equals("/noticeModify.do")) {
			service = new NoticeModifyService();
			service.execute(request, response);
			viewPage = "NoticeList.do";
		}else if(com.equals("/noticeDelete.do")) { // 공지글삭제
			service = new NoticeDeleteService();
			service.execute(request, response);
			viewPage = "NoticeList.do";
			/* * * * * * * * * * *  * * * * * * * * * * * *
			* * * * * * * * * 메뉴 후기  게시판  * * * * * * *
			* * * * * * * * * * *  * * * * * * * * * * * * */
		}else if(com.equals("/reivewList.do")) { // 후기 글 리스트 가져오기 
			service = new ReivewListService();
			service.execute(request, response);
			viewPage = "reivew/reivewList.jsp";
		}else if(com.equals("/reivewWrite.do")) {  // 리뷰 처리 
			service = new ReivewWriteService();
			service.execute(request, response);
			viewPage ="reivewList.do";
		}else if(com.equals("/reivewWriteView.do")) { // 리뷰쓰기 화면
			viewPage = "reivew/reivewWrite.jsp";
		}else if(com.equals("/reivewContent.do")) { // 리뷰 상세보기 
			service = new ReivewContentService();
			service.execute(request, response);
			viewPage = "reivew/reivewContent.jsp";
			
		}else if(com.equals("/reivewModifyView.do")) { // 리뷰 수정화면
			service = new ReivewModifyViewService();
			service.execute(request, response);
			viewPage = "reivew/reivewModify.jsp";
		}else if(com.equals("/ReivewModify.do")) { // 리뷰 수정 처리 
			service = new ReivewModifyService();
			service.execute(request, response);
			viewPage = "reivewList.do";
		}else if(com.equals("/reivewReplyView.do")) { // 답변글 화면 
			service = new ReivewReplyViewService();
			service.execute(request, response);
			viewPage = "reivew/reivewReply.jsp";
		}else if(com.equals("/reivewReply.do")) { // 답변글 처리 
			service = new ReivewReplyService();
			service.execute(request, response);
			viewPage = "reivewList.do";
		}else if(com.equals("/reivewDelete.do")) { // 글 삭제 
			service = new ReivewDeleteService();
			service.execute(request, response);
			viewPage = "reivewList.do";
		}
			
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
