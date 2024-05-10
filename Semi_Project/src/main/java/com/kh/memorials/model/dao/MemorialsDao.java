package com.kh.memorials.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.kh.memorials.model.vo.Memorials;
import com.kh.memorials.model.vo.MemorialsAttachment;
import com.kh.common.JDBCTemplate;

public class MemorialsDao {


	private Properties prop = new Properties();
	
	
	public MemorialsDao() {
	String filePath = Memorials.class
			.getResource("/resources/sql/memorial-mapper.xml").getPath();
	
	
	try {
		prop.loadFromXML(new FileInputStream(filePath));
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

	


	public int selectMemorialsNo(Connection conn) {
	    int memorialsNo = 0;
	    ResultSet rset = null;
	    Statement stmt = null;
	    
	    String sql = prop.getProperty("selectmemorials");
	    System.out.println(sql);
	    try {
	        stmt = conn.createStatement();
	        
	        rset = stmt.executeQuery(sql);
	        
	        if(rset.next()) {
	            memorialsNo = rset.getInt("MNO"); // 변경된 부분
	        }
	        
	    } catch (SQLException e) {
	        e.printStackTrace();	
	    } finally {
	        JDBCTemplate.close(rset);
	        JDBCTemplate.close(stmt);
	    }
	    
	    return memorialsNo;
	}
	// 게시글 등록 메소드
	public int insertMemorials(Connection conn, Memorials m) {

		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMemorials");
		System.out.println(m);
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, m.getMemorialsDate());
			
			pstmt.setString(2, m.getMemorialsTime());
			
			pstmt.setString(3, m.getMemorialsParts());
			pstmt.setString(4, m.getMemorialsContent());
			pstmt.setInt(5, m.getMemorialsSelfScore());
			pstmt.setString(6, m.getmUserId());
			
			
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}


	public int insertMemorialsAttachment(Connection conn, MemorialsAttachment at) {
	    int result = 0;
	    PreparedStatement pstmt = null;
	    String sql = prop.getProperty("memorialsInsertAttachment");
	    
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, at.getRefMno());
	        pstmt.setString(2, at.getOriginName());
	        pstmt.setString(3, at.getChangeName());
	        pstmt.setString(4, at.getFilePath());
	        
	        result = pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        JDBCTemplate.close(pstmt);
	    }
	    return result;
	}
}
