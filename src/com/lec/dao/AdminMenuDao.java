package com.lec.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.dto.AdminMenuDto;

public class AdminMenuDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	// 싱글톤
	private static AdminMenuDao instance = new AdminMenuDao(); // 내자신을 가르키는 변수

	public static AdminMenuDao getInstance() {
		return instance;
	}

	private AdminMenuDao() {
	}

	// Connection 객체를 받아오는 함수 : getConnection()
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		} catch (NamingException e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}

	// 1. 관리자 메뉴 등록
	public int menuInsert(String menuname, String menuprice, String aphoto, String foodcontent) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO ADMINMENU ( FOODID , MENUNAME , MENUPRICE,APHOTO,FOODCONTENT)"
				+ "       VALUES( ADMINMENU_SEQ.NEXTVAL,?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, menuname);
			pstmt.setString(2, menuprice);
			pstmt.setString(3, aphoto);
			pstmt.setString(4, foodcontent);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
			}
		}
		return result;
	}

	// 2. food id 로 매뉴 리스트 가져오기 평점 같이 출력
	public ArrayList<AdminMenuDto> listMenu() { // aphoto menuname price star 
		ArrayList<AdminMenuDto> menus = new ArrayList<AdminMenuDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select A.APHOTO, A.MENUNAME,A.MENUPRICE, A.FOODID,"
				+ "(SELECT AVG(STAR) FROM MENU_REVIEW WHERE FOODID=A.FOODID GROUP BY FOODID) " + "STAR FROM ADMINMENU A";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) { // aphoto 사진 , menuName 메뉴이름 , menuPrice 가격 , star 평점 ,foodId 음식번호
				 String aphoto = rs.getString("aphoto"); // 사진
				 String menuname = rs.getString("menuname"); // 메뉴이름
				 String menuprice = rs.getString("menuprice"); // 메뉴가격
				 int star = rs.getInt("star"); // 메뉴리뷰테이블에서 조인해서 가져온 평점
				int foodid = rs.getInt("foodid"); // 메뉴번호 시퀀스
				menus.add(new AdminMenuDto(foodid, menuname, menuprice, aphoto, null, star));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();

			} catch (SQLException e) {

			}
		}
		return menus;
	}
	//3. foodid로 메뉴 상세보기
	public AdminMenuDto getAdminMenu(int foodid) {
		AdminMenuDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT  APHOTO , MENUNAME , FOODCONTENT FROM ADMINMENU WHERE FOODID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, foodid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String aphoto = rs.getString("aphoto");
				String menuname = rs.getString("menuname");
				String foodcontent = rs.getString("foodcontent");
				dto = new AdminMenuDto(foodid, menuname, null, aphoto, foodcontent, 0);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {

			}
		}
		return dto;
	}
	//4. 메뉴수정
	public int updateMenu(AdminMenuDto dto) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql ="UPDATE ADMINMENU SET MENUNAME = ?," + 
				"                     MENUPRICE    = ?," + 
				"                     APHOTO       = ?," + 
				"                     FOODCONTENT  = ?" + 
				"                     WHERE FOODID =?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getMenuname());
			pstmt.setString(2, dto.getMenuprice());
			pstmt.setString(3, dto.getAphoto());
			pstmt.setString(4,dto.getFoodcontent());
			pstmt.setInt   (5,dto.getFoodid());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				// TODO: handle exception
			}
		}
		return result;
	}
	//5. 메뉴삭제 
	public int deleteMenu(int foodid) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM ADMINMENU WHERE FOODID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, foodid);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {
				// TODO: handle exception
			}
		}
		return result;
	}
}
