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

import com.lec.dao.AdminMenuDao;
import com.lec.dto.AdminMenuDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MenuModifyService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getRealPath("MenuUp");
		int maxSize = 1024 * 1024 *10;
		String aphoto = "";
		
		try {
			MultipartRequest mRequest = new MultipartRequest(request, path, maxSize, "utf-8",
					new DefaultFileRenamePolicy());
			Enumeration<String> params = mRequest.getFileNames();
			// while(params.hasMoreElements()) {
			String param = params.nextElement();
			aphoto = mRequest.getFilesystemName(param);
			int foodid = Integer.parseInt(mRequest.getParameter("foodid"));
			String menuname = mRequest.getParameter("menuname");
			String menuprice = mRequest.getParameter("menuprice");
			String foodcontent = mRequest.getParameter("foodcontent");
			String dbAphoto = mRequest.getParameter("dbAphoto");
			aphoto = aphoto == null? dbAphoto : aphoto;
			AdminMenuDao mDao = AdminMenuDao.getInstance();
			AdminMenuDto menudto = new AdminMenuDto(foodid, menuname, menuprice, aphoto, foodcontent);
			int result = mDao.updateMenu(menudto);
			if(result == AdminMenuDao.SUCCESS) { 
				HttpSession session = request.getSession();
				session.setAttribute("menuUpdate", menudto);
				request.setAttribute("updateResult", "메뉴 수정 성공");
			}else {
				request.setAttribute("updateResult", "정보가 너무 길어서 메뉴수정 실패");
			}
		} catch (Exception e) {
		 System.out.println(e.getMessage());
		}
      //  서버에 업로드된파일을 소스폴더로 복사
		File serverFile = new File(path + "/" + aphoto);
		if(!aphoto.equals("NOIMG.JPG")&& serverFile.exists() ) {
			InputStream is = null;
			OutputStream os = null;
			try {
				is = new FileInputStream(serverFile);
				os = new FileOutputStream("C:\\webPro\\source_class\\06_JSP\\oh\\WebContent\\MenuUp\\" + aphoto);
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







