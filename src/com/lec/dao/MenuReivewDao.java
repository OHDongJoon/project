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
		String sql = "SELECT * FROM " + 
		          "    (SELECT ROWNUM RN, A. * FROM "+ 
				  "    (SELECT  M.*, CNAME FROM MENU_REVIEW M, CUSTOMER C WHERE M.CID=C.CID" + 
		          "            ORDER BY MGROUP DESC, MSTEP) A)" + 
				  "    WHERE RN BETWEEN ? AND ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int mid = rs.getInt("mid");
				String cid = rs.getString("cid");
				String cname= rs.getString("cname");
				int foodid = rs.getInt("foodid");
				int star = rs.getInt("star");
				String mtitle = rs.getString("mtitle");
				String mcontent = rs.getString("mcontent");
				String mphoto = rs.getString("mphoto");
				Date mrdate = rs.getDate("mrdate");
				int mhit = rs.getInt("mhit");
				int mgroup = rs.getInt("mgroup");
				int mstep = rs.getInt("mstep");
				int mindent = rs.getInt("mindent");
				String mip = rs.getString("mip");
				dtos.add(new MenuReivewDto(mid, cid, cname, foodid, star, mtitle, mcontent, mphoto, mrdate, mhit, mgroup, mstep,
						mindent, mip));
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
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
			rs.next();
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
	public int writeReivew(String cid, int foodid, int star, String mtitle, String mcontent, String mphoto,
			String mip) {
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MENU_REVIEW "
				+ "( MID,CID, FOODID, STAR , MTITLE,MCONTENT,MPHOTO,MGROUP,MSTEP,MINDENT,MIP)"
				+ " VALUES(MENU_REVIEW_SEQ.NEXTVAL,?,?,?,?,?,?,"
				+ "MENU_REVIEW_SEQ.CURRVAL,0,0,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			pstmt.setInt(2, foodid);
			pstmt.setInt(3, star);
			pstmt.setString(4, mtitle);
			pstmt.setString(5, mcontent);
			pstmt.setString(6, mphoto);
			pstmt.setString(7, mip);
            result = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

//4.  mhit 하나 올리기 1번글 조회수 하나 올리기)
	private void hitup(int mid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MENU_REVIEW SET MHIT = MHIT +1 WHERE MID =?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}

	// 5. mid 로 dto 글 보기 : 글 상세보기(조회수 up + mid로 dto 리턴)
	public MenuReivewDto ReuvewContentView(int mid) {
		hitup(mid);
		MenuReivewDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT M.*, CNAME FROM MENU_REVIEW M, CUSTOMER C WHERE C.CID=M.CID AND MID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String cid = rs.getString("cid");
				String cname = rs.getString("cname");
				int foodid = rs.getInt("foodid");
				int star = rs.getInt("star");
				String mtitle = rs.getString("mtitle");
				String mcontent = rs.getString("mcontent");
				String mphoto = rs.getString("mphoto");
				Date mrdate = rs.getDate("mrdate");
				int mhit = rs.getInt("mhit");
				int mgroup = rs.getInt("mgroup");
				int mstep = rs.getInt("mstep");
				int mindent = rs.getInt("mindent");
				String mip = rs.getString("mip");
				dto = new MenuReivewDto(mid, cid,cname, foodid, star, mtitle, mcontent, mphoto, mrdate, mhit, mgroup, mstep,
						mindent, mip);
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
		return dto;
	}
  // 6. mid로 글 dto 보기 : 답변글 view + 수정 view 
	public MenuReivewDto modifyView_replyView(int mid) {
		hitup(mid);
		MenuReivewDto dto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT M.*, CNAME FROM MENU_REVIEW M, CUSTOMER C WHERE C.CID=M.CID AND MID=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				String cid = rs.getString("cid");  
				String cname = rs.getString("cname");
				int foodid = rs.getInt("foodid");
				int star = rs.getInt("star");
				String mtitle = rs.getString("mtitle");
				String mcontent = rs.getString("mcontent");
				String mphoto = rs.getString("mphoto");
				Date mrdate = rs.getDate("mrdate");
				int mhit = rs.getInt("mhit");
				int mgroup = rs.getInt("mgroup");
				int mstep = rs.getInt("mstep");
				int mindent = rs.getInt("mindent");
				String mip = rs.getString("mip");
				
				dto = new MenuReivewDto(mid, cname, cid, foodid, star, mtitle, mcontent, mphoto, mrdate, mhit, mgroup, mstep,
						mindent, mip);
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
		return dto;
	}
	// 6.  글 수정하기()
	public int modifyReivew(int mid ,  String mtitle, String mcontent, String mphoto, String mip) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MENU_REVIEW SET  MTITLE= ?," + 
				"                        MCONTENT = ?," + 
				"                        MPHOTO = ?," + 
				"                        MIP = ?," + 
				"                        MRDATE =SYSDATE" + 
				"                     WHERE MID = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mtitle);
			pstmt.setString(2, mcontent);
			pstmt.setString(3, mphoto);
			pstmt.setString(4, mip);
			pstmt.setInt(5, mid);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "후기수정성공":"글수정실패");
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
	// 7.글삭제
	public int deleteReivew(int mgroup, int mstep , int mindent) {
		int result = FAIL;
		Connection        conn  = null;
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM MENU_REVIEW WHERE MGROUP = ? AND (MSTEP>=? AND  "
				+ "MSTEP<(select NVL(MIN(MSTEP),9999) FROM MENU_REVIEW WHERE MGROUP=? AND MSTEP>? AND MINDENT<=?))";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mgroup);
			pstmt.setInt(2, mstep);
			pstmt.setInt(3, mgroup);
			pstmt.setInt(4, mstep);
			pstmt.setInt(5, mindent);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS? "글삭제성공":"글삭제실패");
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
	// 8. 답변글 추가전 step a 수행
	private void preReplyStepA(int mgroup, int mstep) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "UPDATE MENU_REVIEW SET MSTEP = MSTEP+1 " + 
				"     WHERE MGROUP = ? AND MSTEP>?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mgroup);
			pstmt.setInt(2, mstep);
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
	// 9. 답변글 쓰기 MID, CID, FOODID,MTITLE, MCONTENT, MPHOTO
	//MGROUP, MSTEP, MINDENT, MIP)
	public int replyReivew( String cid , int foodid, String mtitle , String mcontent , 
			int mgroup , int mstep , int mindent , String mip) {
		preReplyStepA(mgroup, mstep); // 답변글 저장전 step a 먼저 수행
		// mgroup , mstep , mindent 원글정보
		// 
		int result = FAIL;
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MENU_REVIEW ( MID,CID,FOODID,MTITLE,MCONTENT," + 
				"         MGROUP, MSTEP, MINDENT, MIP)" + 
				"   VALUES (MENU_REVIEW_SEQ.NEXTVAL,?,?,?,?," + 
				"            ?,?,?,?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cid);
			pstmt.setInt(2, foodid);
			pstmt.setString(3, mtitle);
			pstmt.setString(4, mcontent);
			pstmt.setInt(5, mgroup);
			pstmt.setInt(6, mstep+1);
			pstmt.setInt(7, mindent+1);
			pstmt.setString(8, mip);
			result = pstmt.executeUpdate();
			System.out.println(result==SUCCESS ? "답변쓰기성공" : "답변쓰기실패");
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











