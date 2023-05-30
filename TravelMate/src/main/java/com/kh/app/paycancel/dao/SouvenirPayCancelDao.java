package com.kh.app.paycancel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.paycancel.vo.PayCancelVo;

public class SouvenirPayCancelDao {

	public int souvenirPaymentUpdate(Connection conn, String payNo) throws Exception {

		String sql = "UPDATE SOUVENIR_PAYMENT SET CANCEL_YN = 'Y' WHERE NO = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, payNo);
		int result = pstmt.executeUpdate();
		if(result == 1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(pstmt);
		
		return result;
	
	}

	public int souvenirPayCancelReason(Connection conn2, PayCancelVo pcvo) throws Exception {

		String sql = "INSERT INTO PAY_CANCEL_REASON (NO, SOUVENIR_PAYMENT_NO , TITLE, CONTENT) VALUES (SEQ_PAY_CANCEL_REASON_NO.NEXTVAL, ?, ? , ?)";
		PreparedStatement pstmt = conn2.prepareStatement(sql);
		pstmt.setString(1, pcvo.getSouvenirPaymentNo());
		pstmt.setString(2, pcvo.getTitle());
		pstmt.setString(3, pcvo.getContent());
		
		int result2 = pstmt.executeUpdate();
		
		if(result2 == 1) {
			JDBCTemplate.commit(conn2);
		}else {
			JDBCTemplate.rollback(conn2);
		}
		
		JDBCTemplate.close(pstmt);
	
		return result2;
	
	}
	
	
}