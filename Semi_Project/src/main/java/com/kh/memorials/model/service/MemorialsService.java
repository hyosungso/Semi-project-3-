package com.kh.memorials.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.kh.common.JDBCTemplate;
import com.kh.memorials.model.dao.MemorialsDao;
import com.kh.memorials.model.vo.Memorials;
import com.kh.memorials.model.vo.MemorialsAttachment;

public class MemorialsService {

	

	public int insertMemorials(Memorials m, MemorialsAttachment at) {
	    Connection conn = JDBCTemplate.getConnection();
	    int memorialsNo = 0; // 기념일 번호를 저장할 변수 초기화
	    
	    int result=0;
	    int result2 = 1; // 기념일 첨부파일 등록 결과 변수 초기화
	    
	    try {
	        // 기념일 번호를 조회하여 저장
	        memorialsNo = new MemorialsDao().selectMemorialsNo(conn);
	        System.out.println("sss"+memorialsNo);
	        if (memorialsNo != 0) {
	            // 기념일 번호를 기념일 객체에 설정
	            m.setMemorialsNo(memorialsNo);
	            
	            // 기념일 등록
	            result = new MemorialsDao().insertMemorials(conn, m);

	            if (result > 0 && at != null) {
	                // 기념일 첨부파일 등록
	                at.setRefMno(memorialsNo);
	                result2 = new MemorialsDao().insertMemorialsAttachment(conn, at);
	            }
	            
	            // 등록 성공 여부에 따라 트랜잭션 처리
	            if (result * result2 > 0) {
	                JDBCTemplate.commit(conn);
	            } else {
	                JDBCTemplate.rollback(conn);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        JDBCTemplate.close(conn);
	    }
	    
	    return result * result2 ; // 등록된 기념일 번호 반환
	}



	public MemorialsAttachment selectMemorialsAttachment(int mNo) {
		// TODO Auto-generated method stub
		return null;
	}
}
