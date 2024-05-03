package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.vo.Member;

public class MemberDao {
	
	// sql - prop
	
	private Properties prop = new Properties();
	
	
	
	public MemberDao() {
		
		String filePath = MemberDao.class
				.getResource("/resources/sql/member-mapper.xml").getPath();
		
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	

	public Member loginMember(Connection conn, String userId, String userPwd) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Member m = null;
		
		String sql = prop.getProperty("loginMember");
		
		
		
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				
				m = new Member(rset.getInt("USER_NO")
							  ,rset.getString("USER_ID")
							  ,rset.getString("USER_PWD")
							  ,rset.getString("USER_NAME")
							  ,rset.getString("GENDER")
							  ,rset.getString("NICKNAME")
							  ,rset.getString("EMAIL")
							  ,rset.getString("PHONE")
							  ,rset.getDate("ENROLL_DATE")
							  ,rset.getDate("MODIFY_DATE")
							  ,rset.getString("STATUS")
							  ,rset.getString("AUTH_CODE"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
		
		
	}
	
	
	public int insertMember(Connection conn, Member m) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getGender());
			pstmt.setString(5, m.getNickName());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getPhone());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		
		
		
		
	 return result;	
		
	}

	//아이디 중복확인 메소드
	public Boolean checkId(Connection conn, String inputId) {
		
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("checkId");
		
		boolean flag = false;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, inputId);
			
			rset = pstmt.executeQuery();
			
			flag = rset.next();
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return flag;
	}

	
		
	//ㅎ


	
}