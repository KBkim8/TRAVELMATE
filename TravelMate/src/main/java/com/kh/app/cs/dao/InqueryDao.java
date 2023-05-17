package com.kh.app.cs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.cs.vo.InqueryVo;

public class InqueryDao {

	// 문의하기 게시글 작성
	public int write(Connection conn, InqueryVo ivo) throws Exception {

		// sql
		String sql = "INSERT INTO QNA(NO, MEMBER_NO, TITLE, CONTENT) VALUES(SEQ_QNA_NO.NEXTVAL, '2' , ?,  ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
//		pstmt.setString(1, ivo.getMemberNo());
		pstmt.setString(1, ivo.getTitle());
		pstmt.setString(2, ivo.getContent());
		int result =  pstmt.executeUpdate();
		
		JDBCTemplate.close(pstmt);
		
		return result;
	}

}
