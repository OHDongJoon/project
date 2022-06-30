package com.lec.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.dao.AdminMenuDao;
import com.lec.dto.AdminMenuDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MenuInsertService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("MenuUp");
		int maxSize = 1024 * 1024 *10;
		String aphoto ="";
		
		try {
			
			MultipartRequest mRequest = new MultipartRequest(request, path, maxSize,
					"utf-8", new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			String param = params.nextElement();
			aphoto = mRequest.getFilesystemName(param);
				// mRequeest을 이용하여 파라미터 받아오기 
			String menuname = mRequest.getParameter("menuname");
			String menuprice = mRequest.getParameter("menuprice");
			String foodcontent = mRequest.getParameter("foodcontent");
			aphoto = aphoto == null? "NOIMG.JPG" : aphoto;
			AdminMenuDao aDao = AdminMenuDao.getInstance();
			int result = aDao.menuInsert(menuname, menuprice, aphoto, foodcontent);
			if(result == AdminMenuDao.SUCCESS) {
				request.setAttribute("menuInsertResult", "메뉴 등록 성공!");
			}else {
				request.setAttribute("menuInsertResult", "메뉴 등록 실패!");
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
			request.setAttribute("menuInsertResult", "그냥 실패야 임마 ");
		}
		// 서버에 업로드된 파일을 소스폴더로 복사 
		File serverFile = new File(path + "/" + aphoto);
		if(serverFile.exists() && !aphoto.equals("NOIMG.JPG")) {
			InputStream is = null;
			OutputStream os = null;
			try {
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("C:\\webPro\\source_class\\06_JSP\\oh\\WebContent\\MenuUp\\" + aphoto);
				byte[] bs = new byte[(int) serverFile.length()];
				while(true) {
					int readByteCnt = is.read(bs);
					if(readByteCnt == -1) // 끝가지 가면 끝
						break;
					os.write(bs, 0, readByteCnt);
				}
			} catch (Exception e) {
				
			}finally {
				try {
					if (os != null) os.close();
					if(is != null) is.close();
				}catch (IOException e) {
					// TODO: handle exception
				}
			}
		}

	}

}
