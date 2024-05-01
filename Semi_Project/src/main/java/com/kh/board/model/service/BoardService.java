package com.kh.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;

public class BoardService {

	public int listCount() {
		Connection conn=JDBCTemplate.getConnection();
		int result=new BoardDao().listCount(conn);
		
		JDBCTemplate.close(conn);
		return result;
	}

	public int listCount(String category) {
		Connection conn=JDBCTemplate.getConnection();
		int result=new BoardDao().listCount(conn,category);
		
		JDBCTemplate.close(conn);
		return result;
	}

	public ArrayList<Board> selectList(PageInfo pi) {
		Connection conn=JDBCTemplate.getConnection();
		ArrayList<Board> bList=new BoardDao().selectList(conn,pi);
		
		JDBCTemplate.close(conn);
		return bList;
	}

	public ArrayList<Board> selectList(PageInfo pi, String category) {
		Connection conn=JDBCTemplate.getConnection();
		ArrayList<Board> bList=new BoardDao().selectList(conn,pi,category);
		
		JDBCTemplate.close(conn);
		return bList;
	}

}
