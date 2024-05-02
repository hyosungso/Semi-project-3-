package com.kh.exercise.model.service;

import java.sql.*;
import java.util.*;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.exercise.model.dao.ExerDao;
import com.kh.exercise.model.vo.Exercise;

public class ExerService {
	public int listCount() {
		Connection conn=JDBCTemplate.getConnection();
		int listnum = new ExerDao().listCount(conn);
		JDBCTemplate.close(conn);
		return listnum;
	}
	public ArrayList<Exercise> selectList(PageInfo pi) {
		Connection conn=JDBCTemplate.getConnection();
		ArrayList<Exercise> elist=new ExerDao().selectList(conn,pi);
		JDBCTemplate.close(conn);
		return elist;
	}
}
