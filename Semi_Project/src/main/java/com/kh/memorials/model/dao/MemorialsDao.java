package com.kh.Memorials.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.kh.Memorials.model.vo.Memorials;
import com.kh.Memorials.model.vo.MemorialsAttachment;
import com.kh.common.JDBCTemplate2;

public class MemorialsDao {


	private Properties prop = new Properties();
	
	//게시글 번호 추출메소드
	public int selectMemorialsNo(Connection conn) {

		int memorialsNo = 0;
		ResultSet rset = null;
		Statement stmt = null;
		
		String sql = prop.getProperty("selectmemorials");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				memorialsNo = rset.getInt("MNO");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate2.close(rset);
			JDBCTemplate2.close(stmt);
		}
		
		
		
		return memorialsNo;
	}

	// 게시글 등록 메소드
	public int insertMemorials(Connection conn, Memorials m) {

		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMemorials");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, m.getMemorialsNo());
			
			pstmt.setString(2, m.getMemorialsTime());
			
			pstmt.setString(3, m.getMemorialsParts());
			pstmt.setString(4, m.getMemorialsContent());
			pstmt.setInt(5, m.getMemorialsSelfScore());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate2.close(pstmt);
		}
		return result;
		
	}

	//첨부파일 정보 등록 메소드
	public int insertMemorialsAttachment(Connection conn, MemorialsAttachment at) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("memorialsInsertAttachment");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, at.getRefBno());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate2.close(pstmt);
		}
		
		return result;
	}

}
