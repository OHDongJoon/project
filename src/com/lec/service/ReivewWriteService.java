package com.lec.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/* int mid; // 글번호
 String cid;  // 작성자 id
 String cname; // 작성자 이름
 int foodid; // 음식번호 
 int star;   // 평점
 String mtitle;  // 글제목
 String mcontent;  // 글본문
 String mphoto;  // 글 사진
 Date mrdate;     // 글 작성 시점
 int mhit;       // 글조회수
 int mgroup;     // 글그룹
 int mstep;      // 글스텝
 int mindent;    // 글인덴트
 String mip;     // 글 ip*/
import javax.servlet.http.HttpSession;

import com.lec.dao.MenuReivewDao;
import com.lec.dto.CustomerDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReivewWriteService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("reivewPhotoUp");
		int maxSize = 1024*1024*10; // 사진 업로드 제한 용량 : 1M
		MultipartRequest mRequest = null;
		String mphoto = ""; // 첨부된 파일이 저장된 파일 이름
		try {
			mRequest = new MultipartRequest(request, path, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			mphoto = mRequest.getFilesystemName(param);
			HttpSession httpSession = request.getSession();
			CustomerDto customer = (CustomerDto)httpSession.getAttribute("customer");
			if(customer != null) {
				String cid = customer.getcId();
				int foodid =Integer.parseInt( mRequest.getParameter("foodid"));
				int star = Integer.parseInt( mRequest.getParameter("star"));
				String mtitle = mRequest.getParameter("mtitle");
				String mcontent = mRequest.getParameter("mcontent");
				String mip = request.getRemoteAddr();
				mphoto = mphoto == null ? "NOIMG.JPG" : mphoto;
				MenuReivewDao reivewDao = MenuReivewDao.getInstance();
				int result =  reivewDao.writeReivew(cid, foodid, star, mtitle, mcontent, mphoto, mip);
				System.out.println(result);
				if(result == MenuReivewDao.SUCCESS) {// 글쓰기 확인
					HttpSession session = request.getSession();
					session.setAttribute("reivew", result);
					request.setAttribute("menuReivewResult", "후기 쓰기 성공");
				}else {
					request.setAttribute("menuReivewResult", "후기 쓰기 실패 ");
				}
			}else {
				request.setAttribute("menuReivewResult", "로그인 한 사람만 후기 쓸 쑤 있어요 ");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			request.setAttribute("menuReivewResult", "후기실패패패패");
		}
		if(mphoto != null) {
			InputStream  is = null;
			OutputStream os = null;
			try {
				File serverFile = new File(path+"/"+mphoto);
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("C:\\webPro\\source_class\\06_JSP\\oh\\WebContent\\reivewPhotoUp\\"+mphoto);
				byte[] bs = new byte[(int)serverFile.length()];
				while(true) {
					int nByteCnt = is.read(bs);
					if(nByteCnt==-1) break;
					os.write(bs, 0, nByteCnt);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if(os!=null) os.close();
					if(is!=null) is.close();
				} catch (Exception e) {
					System.out.println(e.getMessage());
				}
			}
		}
	}

}
