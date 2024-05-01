package com.kh.member.model.service;

import java.sql.Connection;
import java.util.Date;

import com.kh.common.JDBCTemplate;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {

	public int insertMember(Member m) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().insertMember(conn,m);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
			
		}
		
		JDBCTemplate.close(conn);
		
		return result;
		
		
		
		
	}

	// 아이디 중복 체크 메소드
	public Boolean checkId(String inputId) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Boolean flag = new MemberDao().checkId(conn,inputId);
		
		JDBCTemplate.close(conn);
		
		return flag;
		
	}

	//ㅎ
	
}
