package com.kh.app.member.service;

import java.sql.Connection;

import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.member.dao.MemberDao;
import com.kh.app.member.vo.MemberVo;

public class MemberService {
	
	private final MemberDao dao;
	
	public MemberService() {
		dao = new MemberDao(); 
	}

	// 회원정보 수정
	public MemberVo edit(MemberVo vo) throws Exception {
		
		// conn
		Connection conn = JDBCTemplate.getConnection();
		
		MemberVo updatedMember = null;
		try {
			// SQL
			int result = dao.edit(conn,vo);
			
			// rs || ts
			if(result == 1) {
				updatedMember = dao.selectOneByNo(conn, vo.getNo());
				if(updatedMember == null) {
					throw new Exception("updatedMember null..");
				}
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
		
		}finally {
			// close
			JDBCTemplate.close(conn);
		}
		
		return updatedMember;
		
	}

	// 회원 탈퇴
	public int quit(String no) throws Exception {

		// conn 
		Connection conn = JDBCTemplate.getConnection();
		// SQL
		int result = dao.quit(conn,no);
		
		// tx
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