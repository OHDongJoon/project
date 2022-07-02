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

import com.lec.dto.NoticeDto;

public class NoticeDao {
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	// 싱글톤
	private static NoticeDao instance = new NoticeDao(); // 내자신을 가르키는 변수

	public static NoticeDao getInstance() {
		return instance;
	}
    
	private NoticeDao() {
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
	//1. 글목록
	public ArrayList<NoticeDto> listNotice(int startRow , int endRow){
		ArrayList<NoticeDto> dtos = new ArrayList<NoticeDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="SELECT * FROM " + 
				"    (SELECT ROWNUM RN, A. * FROM" + 
				"    (SELECT N.*, ANAME FROM NOTICE N, ADMIN A WHERE N.AID=A.AID" + 
				"        ORDER BY NID DESC) A)" + 
				"    WHERE RN  BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int nid = rs.getInt("nid");
				 String aid = rs.getString("aid");
				 String atitle = rs.getString("atitle");
				 String acontent = rs.getString("acontent");
				 Date   ardate = rs.getDate("ardate"); 
				 String aip = rs.getString("aip");
				 String aname = rs.getString("aname");
				 dtos.add(new NoticeDto(nid, aid, atitle, acontent, ardate, aip, aname));
				 
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return dtos;
	}
	//2. 등록된 공지글 수 
	public int getNoticeTotcnt() {
		int cnt = 0;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT COUNT(*) FROM NOTICE";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt(1);
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return cnt;
	}
	//3. 공지글쓰기(원글
	public int writeNotice(String aid, String atitle, String acontent,  String aip) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO NOTICE (NID , AID, ATITLE , ACONTENT ,AIP)" + 
				"        VALUES(Notice_SEQ.NEXTVAL , ?, ? , ? , ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, aid);
			pstmt.setString(2, atitle);
			pstmt.setString(3, acontent);
			pstmt.setString(4, aip);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "공지글쓰기성공":"공지글쓰기실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return result;
	}
	//nid 로 글 dto 보기  : 글 상세보기 
	public NoticeDto contentView(int nid) {
		NoticeDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="SELECT N.*, ANAME FROM NOTICE N, ADMIN A WHERE N.AID=A.AID AND NID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//int nid = rs.getInt("nid");
				 String aid = rs.getString("aid");
				 String atitle = rs.getString("atitle");
				 String acontent = rs.getString("acontent");
				 Date   ardate = rs.getDate("rdate"); 
				 String aip = rs.getString("aip");
				 String aname = rs.getString("aname");
				 dto = new NoticeDto(nid, aid, atitle, acontent, ardate, aip, aname);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return dto;	
	}
	// 수정 view
	public NoticeDto modifyNoticeView(int nid) {
		NoticeDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="SELECT N.*, ANAME FROM NOTICE N, ADMIN A WHERE N.AID=A.AID AND NID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				//int nid = rs.getInt("nid");
				 String aid = rs.getString("aid");
				 String atitle = rs.getString("atitle");
				 String acontent = rs.getString("acontent");
				 Date   ardate = rs.getDate("rdate"); 
				 String aip = rs.getString("aip");
				 String aname = rs.getString("aname");
				 dto = new NoticeDto(nid, aid, atitle, acontent, ardate, aip, aname);
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs   !=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return dto;	
	}
	//공지글 수정
	public int modifyNotice(int nid , String atitle , String acontent , String aip) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE NOTICE SET  ATITLE= ?," + 
				"                        ACONTENT = ?," + 
				"                        AIP = ?," + 
				"                        ARDATE =SYSDATE" + 
				"                WHERE NID = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, atitle);
			pstmt.setString(2, acontent);
			pstmt.setString(3, acontent);
			pstmt.setString(4, aip);
			pstmt.setInt(5, nid);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "공지글수정성공":"공지글수정실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return result;
	}
	//글삭제
	public int deleteNotice(int nid) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM NOTICE WHERE NID =?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nid);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "공지글삭제성공":"공지글삭제실패");
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn !=null) conn.close();
			} catch (SQLException e) {System.out.println(e.getMessage());}
		}
		return result;
	}
}
















