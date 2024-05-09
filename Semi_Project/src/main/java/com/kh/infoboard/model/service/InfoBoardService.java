package com.kh.infoboard.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.infoboard.model.vo.Category;
import com.kh.infoboard.model.dao.InfoBoardDao;
import com.kh.infoboard.model.vo.InfoBoard;

public class InfoBoardService {

	public int listCount() {
		
		Connection conn =JDBCTemplate.getConnection();
		int result = new InfoBoardDao().listCount(conn);
		
		JDBCTemplate.close(conn);
		return result;

	}
	//선택한 카테고리인 게시판 개수 출력(페이징바 조절용)
	public int listCount(String category) {
		Connection conn=JDBCTemplate.getConnection();
		int result= new InfoBoardDao().listCount(conn,category);
		
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<InfoBoard> selectList(PageInfo pi, String sort) {

		Connection conn = JDBCTemplate.getConnection();
		ArrayList<InfoBoard> fList = new InfoBoardDao().selectList(conn,pi,sort);
		
		JDBCTemplate.close(conn);
		
		return fList;
	}
	
	public ArrayList<InfoBoard> selectList(PageInfo pi, String category, String sort) {
		
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<InfoBoard> fList = new InfoBoardDao().selectList(conn, pi,category, sort);
		
		JDBCTemplate.close(conn);
		
		return fList;
	}
	
	public ArrayList<Category> selectCategory() {
		// TODO Auto-generated method stub
		return null;
	}


}
