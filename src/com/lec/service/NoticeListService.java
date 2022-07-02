package com.lec.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.NoticeDao;
import com.lec.dto.NoticeDto;

public class NoticeListService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		final int PAGESIZE=10, BLOCKSIZE=10;
		int startRow = (currentPage-1) * PAGESIZE +1;
		int endRow   = startRow + PAGESIZE -1;
        NoticeDao noticeDao = NoticeDao.getInstance();
        ArrayList<NoticeDto> noticeList = noticeDao.listNotice(startRow, endRow);
        request.setAttribute("noticeList", noticeList);
        int noticetotCnt = noticeDao.getNoticeTotcnt(); // 글갯수
		int pageCnt = (int)Math.ceil((double)noticetotCnt/PAGESIZE);//페이지갯수
		int startPage = ((currentPage-1)/BLOCKSIZE)*BLOCKSIZE+1;
		int endPage = startPage + BLOCKSIZE - 1;
		if(endPage>pageCnt) {
			endPage = pageCnt;
		}
		request.setAttribute("BLOCKSIZE", BLOCKSIZE);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCnt", pageCnt);
		request.setAttribute("noticetotCnt", noticetotCnt); // totCnt는 없으면 boardList.size()대용
		request.setAttribute("pageNum", currentPage);

	}

}