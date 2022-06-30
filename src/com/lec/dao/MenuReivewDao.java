package com.lec.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.dto.MenuReivewDto;

public class MenuReivewDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	// 싱글톤
	private static MenuReivewDao instance = new MenuReivewDao(); // 내자신을 가르키는 변수

	public static MenuReivewDao getInstance() {
		return instance;
	}

	private MenuReivewDao() {
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

	// 1. 글목록
	public ArrayList<MenuReivewDto> listMenuReivew(int startRow, int endRow) {
		ArrayList<MenuReivewDto> dtos = new ArrayList<MenuReivewDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM " + "    (SELECT ROWNUM RN, A. * FROM "
				+ "    (SELECT  M.*, CNAME FROM MENU_REVIEW M, CUSTOMER C WHERE M.CID=C.CID"
				+ "            ORDER BY MGROUP DESC, MSTEP) A)" + "    WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int mid = rs.getInt("mid");
				String cid = rs.getString("cid");
				int foodid = rs.getInt("foodid");
				int star = rs.getInt("star");
				String mtitle = rs.getString("mtitle");
				String mcontent = rs.getString("mcontent");
				String mphoto = rs.getString("mphoto");
				Date rdate = rs.getDate("rdate");
				int mhit = rs.getInt("mhit");
				int mgroup = rs.getInt("mgroup");
				int mstep = rs.getInt("mstep");
				int mindent = rs.getInt("mindent");
				String mip = rs.getString("mip");
				dtos.add(new MenuReivewDto(mid, cid, foodid, star, mtitle, mcontent, mphoto, rdate, mhit, mgroup, mstep,
						mindent, mip));
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
				System.out.println(e.getMessage());
			}
		}
		return dtos;
	}

	// 2. 등록된 글수
	public int getReivewTotCnt() {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT COUNT(*) FROM MENU_REVIEW";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			cnt = rs.getInt(1);
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
				System.out.println(e.getMessage());
			}
		}
		return cnt;
	}

	// 3. 후기 원글 ,CID, FOODID, STAR MTITLE,MCONTENT,MPHOTO MIP
	public int writeReivew(String cId, int foodid, int star, String mtitle, String mcontent, String mphoto,    
			String mip) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MENU_REVIEW "
				+ "( MID,CID, FOODID, STAR , MTITLE,MCONTENT,MPHOTO,MGROUP,MSTEP,MINDENT,MIP)"
				+ "            VALUES(MENU_REVIEW_SEQ.NEXTVAL,?,?,?,?,?,?,"
				+ "                 MENU_REVIEW_SEQ.CURRVAL,0,0,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cId);
			pstmt.setInt(2, foodid);
			pstmt.setInt(3, star);
			pstmt.setString(4, "mtitle");
			pstmt.setString(5, "mcontent");
			pstmt.setString(6, "mphoto");
			pstmt.setString(7, "mip");
			
		} catch (SQLException e) {
		System.out.println(e.getMessage());
		}
		return result;
	}
//4.  mhit 하나 올리기 1번글 조회수 하나 올리기)
	private void hitup(int mid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql ="UPDATE MENU_REVIEW SET MHIT = MHIT +1 WHERE MID =?";
		try {
			conn= getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
	}
	 // 5. mid 로 dto 글 보기 
	}

