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
		 * * * * * * * * * customer ?????? ??????  * * * * * * *
		* * * * * * * * * * *  * * * * * * * * * * * * */
		if(com.equals("/main.do")) { // ?????? ??????
			viewPage = "main/main.jsp";
		}else if(com.equals("/joinView.do")) { // ???????????? ??????
			viewPage = "customer/join.jsp";
			  go = true;
		}else if(com.equals("/join.do")) { // ???????????? ?????? 
		 if(go) {
			service = new CJoinService();
			service.execute(request, response);
			go = false;
		 }
			viewPage = "customer/login.jsp";
		}else if(com.equals("/idConfirm.do")) { // ?????? ????????????
			service = new CidConfirmService();
			service.execute(request, response);
			viewPage = "customer/idConfirm.jsp";
		}else if(com.equals("/emailConfirm.do")) { // ?????? ????????????
			service = new CemailConfirmservice();
			service.execute(request, response);
			viewPage = "customer/emailConfirm.jsp";
		}else if(com.equals("/loginView.do")) { // ????????? ??????
			viewPage = "customer/login.jsp";
		}else if(com.equals("/login.do")) { // ????????? db??? ?????? ??????
			service = new CLoginService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(com.equals("/logout.do")) { //????????????
			service = new CLogoutService();
			service.execute(request, response);
			viewPage ="main/main.jsp";
		}else if(com.equals("/modifyView.do")) { // ????????????
			viewPage ="customer/modify.jsp";
			go = true;
		}else if(com.equals("/modify.do")) {
			if(go) {
			service = new CModifyService();
			service.execute(request, response);
			go = false;
			}
			viewPage = "main/main.jsp";
		}else if(com.equals("/withdrawalView.do")) { // ????????????
			viewPage = "customer/withdrawalView.jsp";
		}else if(com.equals("/withdrawal.do")) {
			service = new CWithdrawalService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
			/* * * * * * * * * * *  * * * * * * * * * * * *
			* * * * * * * * * Admin ?????? ??????  * * * * * * *
			* * * * * * * * * * *  * * * * * * * * * * * * */
		}else if(com.equals("/adminLoginView.do")) { // ????????? ????????? ??????
			viewPage ="admin/adminLogin.jsp";
		}else if(com.equals("/adminLogin.do")) { // ????????? ????????? ??????
			service = new ALoginService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
		}else if(com.equals("/adminjoinView.do")) { // ????????? ????????????
			viewPage = "admin/adminjoin.jsp";
		}else if(com.equals("/adminjoin.do")) { // ????????? ?????? ??????
			service = new AJoinService();
			service.execute(request, response);
			viewPage = "admin/adminLogin.jsp";
		}else if(com.equals("/awithdrawalView.do")) { // ????????? ??????
			viewPage = "admin/awithdrawalView.jsp";
		}else if(com.equals("/awithdrawal.do")) { // ??????
			service = new AWithdrawalService();
			service.execute(request, response);
			viewPage = "main/main.jsp";
			/* * * * * * * * * * *  * * * * * * * * * * * *
			* * * * * * * * * ????????? ?????? ??????   ?????? ??????  * * * * * * *
			* * * * * * * * * * *  * * * * * * * * * * * * */
		}else if(com.equals("/MenuinsertView.do")) { // ???????????? ??????
			viewPage = "admin/MenuinsertView.jsp";
		}else if(com.equals("/Menuinsert.do")) { // ???????????? ??????
			service = new MenuInsertService();
			service.execute(request, response);
			viewPage = "MenuallView.do";   // ????????? ???????????? ?????? ??????
		}else if(com.equals("/MenuallView.do")) { //???????????? ????????????
			service = new MenuAllViewService();
			service.execute(request, response);
			viewPage = "menu/menuview.jsp";
		}else if(com.equals("/MenuContent.do")) { // ?????? ????????????
			service = new MenuContetService();
			service.execute(request, response);
			viewPage = "menu/menuContent.jsp";
		}else if(com.equals("/MenuModifyView.do")){ // ?????? ???????????? ??????
			service = new MenuModifyViewService();
			service.execute(request, response);
			viewPage ="menu/menuModifyView.jsp";
		}else if(com.equals("/MenuModify.do")) { // ?????? ?????? db ??????
			service = new MenuModifyService();
			service.execute(request, response);
			viewPage = "MenuallView.do"; 
		}else if(com.equals("/MenuDelete.do")) { // ?????? ??????
			service = new MenuDeleteService();
			service.execute(request, response);
			viewPage = "MenuallView.do";
			/* * * * * * * * * * *  * * * * * * * * * * * *
			* * * * * * * * * ???????????? ?????????  * * * * * * *
			* * * * * * * * * * *  * * * * * * * * * * * * */
		}else if(com.equals("/NoticeList.do")) { //???????????? ?????????
			service = new NoticeListService();
			service.execute(request, response);
			viewPage  = "notice/noticeList.jsp";
		}else if(com.equals("/NoticeWriteView.do")) { // ???????????????
			viewPage ="notice/noticeWrite.jsp";
			go = true;
		}else if(com.equals("/NoticeWrite.do")) { // ????????? db ??????
			if(go) {
			service = new NoticeWriteService();
			service.execute(request, response);
			go = false;
			    }
			viewPage = "NoticeList.do";
		}else if(com.equals("/noticeContent.do")) { // ????????? ????????????
			service = new NoticeContentService();
			service.execute(request, response);
			viewPage = "notice/noticeContent.jsp";
		}else if(com.equals("/noticeModifyView.do")) { // ????????? ?????? ??????
			service = new NoticeModifyViewService();
			service.execute(request, response);
			viewPage = "notice/noticeModify.jsp";
		}else if(com.equals("/noticeModify.do")) {
			service = new NoticeModifyService();
			service.execute(request, response);
			viewPage = "NoticeList.do";
		}else if(com.equals("/noticeDelete.do")) { // ???????????????
			service = new NoticeDeleteService();
			service.execute(request, response);
			viewPage = "NoticeList.do";
			/* * * * * * * * * * *  * * * * * * * * * * * *
			* * * * * * * * * ?????? ??????  ?????????  * * * * * * *
			* * * * * * * * * * *  * * * * * * * * * * * * */
		}else if(com.equals("/reivewList.do")) { // ?????? ??? ????????? ???????????? 
			service = new ReivewListService();
			service.execute(request, response);
			viewPage = "reivew/reivewList.jsp";
		}else if(com.equals("/reivewWrite.do")) {  // ?????? ?????? 
			service = new ReivewWriteService();
			service.execute(request, response);
			viewPage ="reivewList.do";
		}else if(com.equals("/reivewWriteView.do")) { // ???????????? ??????
			viewPage = "reivew/reivewWrite.jsp";
		}else if(com.equals("/reivewContent.do")) { // ?????? ???????????? 
			service = new ReivewContentService();
			service.execute(request, response);
			viewPage = "reivew/reivewContent.jsp";
			
		}else if(com.equals("/reivewModifyView.do")) { // ?????? ????????????
			service = new ReivewModifyViewService();
			service.execute(request, response);
			viewPage = "reivew/reivewModify.jsp";
		}else if(com.equals("/ReivewModify.do")) { // ?????? ?????? ?????? 
			service = new ReivewModifyService();
			service.execute(request, response);
			viewPage = "reivewList.do";
		}else if(com.equals("/reivewReplyView.do")) { // ????????? ?????? 
			service = new ReivewReplyViewService();
			service.execute(request, response);
			viewPage = "reivew/reivewReply.jsp";
		}else if(com.equals("/reivewReply.do")) { // ????????? ?????? 
			service = new ReivewReplyService();
			service.execute(request, response);
			viewPage = "reivewList.do";
		}else if(com.equals("/reivewDelete.do")) { // ??? ?????? 
			service = new ReivewDeleteService();
			service.execute(request, response);
			viewPage = "reivewList.do";
		}
			
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
