package com.kh.app.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.member.vo.MemberVo;

public class MemberDao {

	// 회원정보 수정
	public int edit(Connection conn, MemberVo vo) throws Exception {
		
		// 동적 쿼리
		String sql = "UPDATE MEMBER SET NICK = ?, ADDRESS = ?, EMAIL = ?";
		if(vo.getPwd() != null && vo.getPwd().length() > 0) {
			sql += " , PWD = ?";
		}
			sql += ", MODIFY_DATE = SYSDATE WHERE NO = ? AND STATUS = 'O'";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getNick());
		pstmt.setString(2, vo.getAddress());
		pstmt.setString(3, vo.getEmail());
		if(vo.getPwd() != null && vo.getPwd().length() > 0) {
			pstmt.setString(4, vo.getPwd());
			pstmt.setString(5, vo.getNo());
		}else {
			pstmt.setString(4, vo.getNo());
		}
		
		int result = pstmt.executeUpdate();
		
		JDBCTemplate.close(pstmt);
		
		return result;
		
	}

	// 회원정보 수정 selectByNo
	public MemberVo selectOneByNo(Connection conn, String no) throws Exception {

		String sql = "SELECT * FROM MEMBER WHERE NO = ? AND STATUS = 'O' ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		MemberVo vo = null;
		if(rs.next()) {
			
			String id = rs.getString("ID");
			String pwd = rs.getString("PWD");
			String nick = rs.getString("NICK");
			String email = rs.getString("EMAIL");
			String address = rs.getString("ADDRESS");
		
			vo = new MemberVo();
			vo.setNo(no);
			vo.setId(id);
			vo.setNick(nick);
			vo.setEmail(email);
			vo.setAddress(address);
		}
		
		JDBCTemplate.close(pstmt);
		JDBCTemplate.close(rs);
		
		return vo;
		
	}

	// 회원 탈퇴
	public int quit(Connection conn, String no) throws Exception {
		
		String sql = "UPDATE MEMBER SET STATUS='X' WHERE NO = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, no);
		int result = pstmt.executeUpdate();
		
		JDBCTemplate.close(pstmt);
		
		return result;
		
	}
	
}
