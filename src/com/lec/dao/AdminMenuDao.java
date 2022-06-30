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

	private AdminMenuDao() {}

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
	//1. 관리자 메뉴 등록
	public int menuInsert(String MenuName , String MenuPrice , 
			String Aphoto, String FoodContent) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO ADMINMENU ( FOODID , MENUNAME , MENUPRICE,APHOTO,FOODCONTENT)" + 
				"       VALUES( ADMINMENU_SEQ.NEXTVAL,?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, MenuName);
			pstmt.setString(2, MenuPrice);
			pstmt.setString(3, Aphoto);
			pstmt.setString(4, FoodContent);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null)  conn.close();
			}catch (SQLException e) {
			}
		}
		return result;
	}
	//2.  food id 로 매뉴 리스트 가져오기 평점 같이 출력
	public ArrayList<AdminMenuDto> listMenu(){
		ArrayList<AdminMenuDto> menus = new ArrayList<AdminMenuDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select A.APHOTO, A.MENUNAME,A.MENUPRICE, "
				+ "(SELECT AVG(STAR) FROM MENU_REVIEW WHERE FOODID=A.FOODID GROUP BY FOODID) "
				+ "AVG from adminmenu A";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String aphoto = rs.getString("aphoto");
				String menuName = rs.getString("menuName");
				String menuPrice = rs.getString("menuPrice");
				int     star = rs.getInt("star");
				int     foodId = rs.getInt("foodId");
				menus.add(new AdminMenuDto(foodId, menuName, menuPrice, aphoto, foodContent, star));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return menus;
		
	}
}
