package com.kh.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
import com.kh.board.model.vo.Category;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;

public class BoardService {

	public int listCount() {
		Connection conn=JDBCTemplate.getConnection();
		int result=new BoardDao().listCount(conn);
		
		JDBCTemplate.close(conn);
		return result;
	}

	//선택한 카테고리인 게시판 개수 출력(페이징바 조절용)
	public int listCount(String category) {
		Connection conn=JDBCTemplate.getConnection();
		int result=new BoardDao().listCount(conn,category);
		
		JDBCTemplate.close(conn);
		return result;
	}
	
	//게시판 출력
	public ArrayList<Board> selectList(PageInfo pi) {
		Connection conn=JDBCTemplate.getConnection();
		ArrayList<Board> bList=new BoardDao().selectList(conn,pi);
		
		JDBCTemplate.close(conn);
		return bList;
	}

	//카테고리별 게시판 출력
	public ArrayList<Board> selectList(PageInfo pi, String category) {
		Connection conn=JDBCTemplate.getConnection();
		ArrayList<Board> bList=new BoardDao().selectList(conn,pi,category);
		
		JDBCTemplate.close(conn);
		return bList;
	}

	public ArrayList<Category> selectCategory() {
		Connection conn=JDBCTemplate.getConnection();
		ArrayList<Category> ctList=new BoardDao().selectCategory(conn);
		
		JDBCTemplate.close(conn);
		return ctList;
	}

	public Board selectBoard(int bno) {
		Connection conn=JDBCTemplate.getConnection();
		Board b=new BoardDao().selectBoard(conn,bno);
		
		JDBCTemplate.close(conn);
		return b;
	}

}
