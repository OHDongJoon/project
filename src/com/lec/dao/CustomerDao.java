package com.lec.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.lec.dto.CustomerDto;


public class CustomerDao {
	public static final int EXISTENT    = 0;
	public static final int NONEXISTENT = 1;
	public static final int LOGIN_FAIL    =0;
	public static final int LOGIN_SUCCESS = 1;
	public static final int FAIL = 0;
	public static final int SUCCESS = 1;
	// 싱글톤
	private static CustomerDao instance = new CustomerDao(); // 내자신을 가르키는 변수

	public static CustomerDao getInstance() {
		return instance;
	}

	private CustomerDao() {
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
	//1. 로그인
	public int loginCheck(String cId , String cPw) {
		int result = LOGIN_FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="SELECT * FROM CUSTOMER WHERE CID=? AND CPW=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cId);
			pstmt.setString(2, cPw);
			rs = pstmt.executeQuery();
			if (rs.next()) { 
				result = LOGIN_SUCCESS;
			}else {
				result = LOGIN_FAIL;
			}
				
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	//2.cid로 dto 가져오기 (로그인 성공시 세션
	public CustomerDto getCustomer(String cId) {
		CustomerDto customer = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="SELECT * FROM CUSTOMER WHERE CID = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cId);
			rs = pstmt.executeQuery(); // 4 + 5
			if (rs.next()) {
				// String mid;
				String cPw = rs.getString("cPw");
				String cName = rs.getString("cName");
				String cEmail = rs.getString("cEmail");
				Date cBirth = rs.getDate("cBirth");
				String cAddress = rs.getString("cAddress");
				Date cRdate = rs.getDate("cRdate");
				customer = new CustomerDto(cId, cPw, cName, cEmail, cBirth, cAddress, cRdate);
			}

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {

			}
		}
		return customer;
	}
	//3.회원가입
	public int joinCustomer(CustomerDto customer) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql ="INSERT INTO CUSTOMER (CID ,  CPW , CNAME , CEMAIL , CBIRTH , CADDRESS)" + 
				"            VALUES (?,?,?,?,?,?)";
	try {
		conn = getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, customer.getcId());
		pstmt.setString(2, customer.getcPw());
		pstmt.setString(3, customer.getcName());
		pstmt.setString(4, customer.getcEmail());
		pstmt.setDate(5, customer.getcBirth());
		pstmt.setString(6, customer.getcAddress());
		result = pstmt.executeUpdate();
	} catch (SQLException e) {
		System.out.println(e.getMessage());
	}finally {
		try {
			if(pstmt != null) pstmt.close();
			if(conn  != null) conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	return result;
	}
	//4. 회원 정보 수정
	public int modifyCustomer(CustomerDto customer) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql ="UPDATE CUSTOMER SET CPW = ?," + 
				"                    CNAME = ?," + 
				"                    CEMAIL = ?," + 
				"                    CBIRTH = ?," + 
				"                    CADDRESS = ?" + 
				"            WHERE CID = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, customer.getcPw());
			pstmt.setString(2, customer.getcName());
			pstmt.setString(3, customer.getcEmail());
			pstmt.setDate(4, customer.getcBirth());
			pstmt.setString(5, customer.getcAddress());
			pstmt.setString(6, customer.getcId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	//5. 회원탈퇴
	public int withdrawal(String cId) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM CUSTOMER WHERE CID =?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cId);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// 6. 회원 id 중복체크 
	public int cIdConfirm(String cId) {
		int result = EXISTENT;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM CUSTOMER WHERE CID = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = EXISTENT;
			}else {
				result = NONEXISTENT;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
	// 7. 이메일 중복 체크 
	public int emailConfirm(String cEmail) {
		int result = EXISTENT;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		ResultSet         rs    = null;
		String sql = "SELECT * FROM CUSTOMER WHERE CEMAIL = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cEmail);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = EXISTENT;
			}else {
				result = NONEXISTENT;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if(rs    != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn  != null) conn.close();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		return result;
	}
}
