package com.kh.app.mypage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.kh.app.common.db.JDBCTemplate;

public class AttendanceDao {

	public int insertAttendance(Connection conn, String mno) throws Exception {

		// sql
		String sql = "INSERT INTO ATTEND(\"DATE\", NO) VALUES(SYSDATE, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mno);
		int result = pstmt.executeUpdate();
		
		
		JDBCTemplate.close(pstmt);
		
		return result;
		
		
		
	}

}
