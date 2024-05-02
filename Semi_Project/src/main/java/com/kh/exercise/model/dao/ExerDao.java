package com.kh.exercise.model.dao;

import java.io.*;
import java.sql.*;
import java.util.*;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.exercise.model.vo.Exercise;

public class ExerDao {
	private Properties prop = new Properties();
	
	public ExerDao() {	//exercise 매퍼
		String filePath = ExerDao.class.getResource("/resources/sql/exercise-mapper.xml").getPath();
		try {
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
		
		int listCount = 0; 
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return listCount;
	}
	public ArrayList<Exercise> selectList(Connection conn, PageInfo pi) {
		ArrayList<Exercise> list=new ArrayList<>();
		ResultSet rset=null;
		PreparedStatement pstmt=null;
		
		String sql=prop.getProperty("exerList");
		
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit()+1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow); 
			pstmt.setInt(2, endRow); 
			
			rset = pstmt.executeQuery();
			
			//아래는 첨부파일 파라미터명보고 작성예정
//			while(rset.next()) {
//				list.add(new Exercise(rset.getInt("EXER_NO")
//												,rset.getString("EXER_TITLE")
//												,rset.getInt("EXER_COUNT")
//												,rset.getString("EXER_PART")));
//			}	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
