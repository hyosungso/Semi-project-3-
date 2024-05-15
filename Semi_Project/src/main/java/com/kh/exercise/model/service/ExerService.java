package com.kh.exercise.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.exercise.model.dao.ExerDao;
import com.kh.exercise.model.vo.Exercise;
import com.kh.exercise.model.vo.Photo;


public class ExerService {
	
	public ArrayList<Exercise> selectexList() {								    //운동게시글 조회(전체)
		Connection conn = JDBCTemplate.getConnection();		
		ArrayList<Exercise> elist = new ExerDao().selectexList(conn);		
		JDBCTemplate.close(conn);		
		return elist;
	}
	
	public Exercise selectExer(int bno) {																//단일게시글 조회
		Connection conn=JDBCTemplate.getConnection();
		Exercise ex=new ExerDao().selectExer(conn,bno);
		JDBCTemplate.close(conn);
		return ex;
	}
	
	public int insertExer(Exercise ex,ArrayList<Photo> ptarr) {			//운동게시글 작성 : 전에 첨부파일 작성부터 처리
		Connection conn=JDBCTemplate.getConnection();
		
		int exerNo=new ExerDao().selectExerNo(conn);
		int getphoto=new ExerDao().insertExer(conn, ex);
		ex.setExerNo(exerNo);
		int photoNo=new ExerDao().insertPhotoArr(conn, ptarr, exerNo);
		
		if(getphoto*photoNo>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return getphoto*photoNo;
	}

	public Photo selectPhoto(int bno) {												//사진 조회하기
		Connection conn=JDBCTemplate.getConnection();
		Photo p=new ExerDao().selectPhoto(conn, bno);
		JDBCTemplate.close(conn);
		return p;
	}
	
	public ArrayList<Photo> selectPhotoArr(int exerNo){					//게시글 사진 상세보기
		Connection conn=JDBCTemplate.getConnection();
		
		ArrayList<Photo> elist=new ExerDao().selectPhotoArr(conn, exerNo);
		
		JDBCTemplate.close(conn);
		
		return elist;
		
	}

	

}

