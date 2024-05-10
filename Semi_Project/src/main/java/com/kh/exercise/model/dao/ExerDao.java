package com.kh.exercise.model.dao;
import java.io.*;
import java.sql.*;
import java.util.*;

import com.kh.common.*;
import com.kh.exercise.model.vo.*;




public class ExerDao {
	private Properties prop = new Properties();
	
	public ExerDao() {	//exercise 매퍼
		String filePath = ExerDao.class.getResource("/resources/sql/exercise-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//글 번호
	public int selectExerNo(Connection conn) {
		int exerNo = 0;
		ResultSet rset = null;
		Statement stmt = null; 	
		String sql = prop.getProperty("selectExerNo");	
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(sql);
			if(rset.next()) {
				exerNo = rset.getInt("EX_NO");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return exerNo;
	}

	// 운동게시글 목록 조회 (전체버전)
	public ArrayList<Exercise> selectexList(Connection conn){
		//Select (All)
		ResultSet rset = null;
		ArrayList<Exercise> elist=new ArrayList<>();
		Statement stmt=null;		
		String sql=prop.getProperty("selectexList");
		try {
			stmt=conn.createStatement();
			rset=stmt.executeQuery(sql);		
			while(rset.next()) {		//순서대로 운동게시글번호, 사진, 운동부위, 운동명, 운동정보, 운동내용(수정)
				elist.add(new Exercise(rset.getInt("EXER_NO")
												  ,rset.getString("REPHOTO")
												  ,rset.getString("EXER_PART")
												  ,rset.getString("EXER_TITLE")
												  ,rset.getString("EXER_INFORM")
												  ,rset.getString("EXER_CONTENT")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}	
		return elist;		
	}
	
	//게시글 단일 조회
	public Exercise selectExer(Connection conn, int bno) {		
		Exercise ex=null;
		ResultSet rset=null;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("selectExer");
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				ex=new Exercise(rset.getInt("EXER_NO")
										  ,rset.getString("EXER_TITLE")
										  ,rset.getString("EXER_TYPE")
										  ,rset.getString("EXER_INFORM")
										  ,rset.getString("EXER_CONTENT")
										  ,rset.getString("EXER_PART")
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return ex;
	}

	//운동게시글 작성하기 - 운동명 부위 정보 종류 내용 (번호는 시퀀스처리)
	public int insertExer(Connection conn, Exercise ex) {
		int result=0;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("insertExer");	
		try {
			pstmt=conn.prepareStatement(sql);
			//pstmt.setInt(1, ex.getExerNo());
			pstmt.setString(1, ex.getExerType());			//5
			pstmt.setString(2, ex.getExerTitle());			//2
			pstmt.setString(3, ex.getExerInf());				//4
			pstmt.setString(4, ex.getExerContent());		//6
			pstmt.setString(5, ex.getExerPart());			//3
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}	
		return result;
	}
	
	// 이미지 등록하기
	public int insertPhoto(Connection conn,Photo p) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertPhoto");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p.getRefBno());
			pstmt.setString(2, p.getOriginName());
			pstmt.setString(3, p.getChangeName());
			pstmt.setString(4, p.getFilePath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
	}
	
	// 올릴 이미지들 목록처리하기
	public int insertPhotoArr(Connection conn, ArrayList<Photo> ptlist,int exerNo) {
		int result = 1;
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("insertPhotoArr");	
		try {
			for(Photo p : ptlist) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, exerNo);
				pstmt.setString(2, p.getOriginName());
				pstmt.setString(3, p.getChangeName());
				pstmt.setString(4, p.getFilePath());
				pstmt.setInt(5, p.getFileLevel());
				
				result *= pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	// 목록 정의 전 이미지 조회
	public Photo selectPhoto(Connection conn,int bno) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Photo p=null;
		String sql=prop.getProperty("selectPhoto");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,bno);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				p=new Photo(rset.getInt("FILE_NO")
									,rset.getString("ORIGIN_NAME")
									,rset.getString("CHANGE_NAME")
									,rset.getString("FILE_PATH"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return p;
	}
	
	// 이미지 목록 조회(위 메소드와 비슷한 매퍼 반복문을 쓰기에 따로 매퍼 작성할 필요 X)
	public ArrayList<Photo> selectPhotoArr(Connection conn,int exerNo){
		ResultSet rset=null;
		ArrayList<Photo> elist=new ArrayList<>();
		PreparedStatement pstmt=null;
		String sql=prop.getProperty("selectPhoto");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, exerNo);
			rset=pstmt.executeQuery();
			while(rset.next()) {		//사진수만큼 반복
				elist.add(new Photo(rset.getInt("FILE_NO")
											  ,rset.getString("ORIGIN_NAME")
											  ,rset.getString("CHANGE_NAME")
											  ,rset.getString("FILE_PATH")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return elist;
	}

}
