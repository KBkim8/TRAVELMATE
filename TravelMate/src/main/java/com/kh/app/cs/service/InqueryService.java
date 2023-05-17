package com.kh.app.cs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.cs.dao.InqueryDao;
import com.kh.app.cs.vo.InqueryVo;

public class InqueryService {

	// 문의글 작성
	public int write(InqueryVo ivo) throws Exception {

		// conn
		Connection conn = JDBCTemplate.getConnection();
		
		
		InqueryDao dao = new InqueryDao();
		int result = dao.write(conn, ivo);
		
		// tx || rs
		if(result == 1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		// close
		JDBCTemplate.close(conn);
		
		return result;
	}

	
	
}
