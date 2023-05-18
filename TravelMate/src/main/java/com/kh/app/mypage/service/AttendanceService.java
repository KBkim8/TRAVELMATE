package com.kh.app.mypage.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.mypage.dao.AttendanceDao;

public class AttendanceService {

	public int insertAttendance(String mno) throws Exception {

		// conn
		Connection conn = JDBCTemplate.getConnection();
		
		AttendanceDao dao = new AttendanceDao();
		int result = dao.insertAttendance(conn, mno);
		
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
