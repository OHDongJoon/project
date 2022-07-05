package com.lec.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lec.dao.MenuReivewDao;
import com.lec.dto.CustomerDto;
import com.lec.dto.MenuReivewDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReivewModifyService implements Service {

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
			int mid  = Integer.parseInt(mRequest.getParameter("mid"));
			String mtitle = mRequest.getParameter("mtitle");
			String mcontent = mRequest.getParameter("mcontent");
			String dbMphoto = mRequest.getParameter("dbMphoto");
			String mip = request.getRemoteAddr();
			mphoto = mphoto == null ? dbMphoto : mphoto ;
			MenuReivewDao mDao = MenuReivewDao.getInstance();
			int result = mDao.modifyReivew(mid,  mtitle, mcontent, mphoto, mip);
			
			if(result == MenuReivewDao.SUCCESS) {
				request.setAttribute("reivewModify", "글 수정 성공");
			}else {
				request.setAttribute("reivewModify", "글 수정 실패");
			}
			request.setAttribute("pageNum", mRequest.getParameter("pageNum"));
		} catch (Exception e) {
			System.out.println(e.getMessage());
			request.setAttribute("reivewModify", "글 수정 실패ㅍㅍㅍㅍ");
		}
		File serverFile = new File(path + "/" + mphoto);
		if(!mphoto.equals("NOIMG.JPG")&& serverFile.exists() ) {
			InputStream is = null;
			OutputStream os = null;
			try {
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("C:\\webPro\\source_class\\06_JSP\\oh\\WebContent\\reivewPhotoUp\\" + mphoto);
				byte[] bs = new byte[(int) serverFile.length()];
				while(true) {
					int readByteCnt = is.read(bs);
					if(readByteCnt == -1)
						break;
					os.write(bs, 0, readByteCnt);
				}
			} catch (Exception e) {
				
			}finally {
			   try {
				if(os != null) os.close();
				if(is != null) is.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
			}
		}
	}

}

