package com.kh.memorials.model.service;

import java.sql.Connection;

import com.kh.Memorials.model.dao.MemorialsDao;
import com.kh.Memorials.model.vo.Memorials;
import com.kh.Memorials.model.vo.MemorialsAttachment;
import com.kh.common.JDBCTemplate2;

public class MemorialsService {

	
	
	
	
	//게시글 등록 메소드
	public int insertMemorials(emorials m, MemorialsAttachment at) {
		Connection conn = JDBCTemplate2.getConnection();
		
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
				JDBCTemplate2.commit(conn);
			}else {
				JDBCTemplate2.rollback(conn);
				
			}
			JDBCTemplate2.close(conn);
			
		
	}
		return memorialsNo;

	}
}
