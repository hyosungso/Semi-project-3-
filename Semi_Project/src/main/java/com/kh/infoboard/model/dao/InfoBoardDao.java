package com.kh.infoboard.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.infoboard.model.vo.InfoBoard;

public class InfoBoardDao {
	
	private Properties prop = new Properties();
	
	public InfoBoardDao() {
		
			try {
				String filePath =InfoBoardDao.class.getResource("/resources/sql/board-mappere.xml").getPath();
				prop.loadFromXML(new FileInputStream(filePath));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	public int listCount(Connection conn) {
		
		ResultSet rset = null;
		Statement stmt = null;
		
		String sql = prop.getProperty("listCount");
		int result = 0;
		
		try {
			stmt=conn.createStatement();
			rset=stmt.executeQuery(sql);
			
			if(rset.next()) {
				result=rset.getInt("Count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
	
		return result;
	}

	public int listCount(Connection conn, String category) {

		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("listCountByCategory");
		
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,category);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("Count");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
		
		
	}

	
	public ArrayList<InfoBoard> selectList(Connection conn, PageInfo pi, String sort) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<InfoBoard> selectList(Connection conn, PageInfo pi, String category, String sort) {
		// TODO Auto-generated method stub
		return null;
	}

}
