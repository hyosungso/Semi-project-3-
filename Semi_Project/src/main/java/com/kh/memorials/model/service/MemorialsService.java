package com.kh.memorials.model.service;

import java.sql.Connection;


import com.kh.common.JDBCTemplate;
import com.kh.memorials.model.dao.MemorialsDao;
import com.kh.memorials.model.vo.Memorials;
import com.kh.memorials.model.vo.MemorialsAttachment;

public class MemorialsService {

	
	//게시글 등록 메소드
	public int insertMemorials(Memorials m, MemorialsAttachment at) {
		Connection conn = JDBCTemplate.getConnection();
		
		int memorialsNo = new MemorialsDao().selectMemorialsNo(conn);
		
		if(memorialsNo != 0) {
			
			m.setMemorialsNo(memorialsNo);
			
			int result = new MemorialsDao().insertMemorials(conn,m);
			
			int result2 = 1;
			
			if(result>0 && at!=null) {
				
				at.setRefBno(memorialsNo);
				
				result2 = new MemorialsDao().insertMemorialsAttachment(conn, at);
				
				
				
			}
			
			
			if(result*result2>0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
				
			}
			JDBCTemplate.close(conn);
			
		
	}
		return memorialsNo;

	}
}
