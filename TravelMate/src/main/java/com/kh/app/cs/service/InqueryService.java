package com.kh.app.cs.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.common.page.PageVo;
import com.kh.app.cs.dao.InqueryDao;
import com.kh.app.cs.vo.InqueryVo;

public class InqueryService {
	
	private final InqueryDao dao = new InqueryDao();

	// 문의글 작성
	public int write(InqueryVo ivo) throws Exception {

		// conn
		Connection conn = JDBCTemplate.getConnection();
		
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

	// 문의글 개수 세기
	public int selectCnt() throws Exception {

		// connn
		Connection conn = JDBCTemplate.getConnection();
		
		int cnt = dao.selectCnt(conn);
		
		JDBCTemplate.close(conn);
		
		return cnt;
		
	}

	// 문의글 목록 조회
	public List<InqueryVo> selectInqueryList(PageVo pv) throws Exception {

		// conn
		Connection conn = JDBCTemplate.getConnection();
		
		List<InqueryVo> list = dao.selectInqueryList(conn, pv);
		
		JDBCTemplate.close(conn);
		
		return list;
	}

	// 문의글 상세조회
	public InqueryVo selectInqueryOneByNo(String no) throws Exception {

		InqueryVo vo = null;
		// conn
		Connection conn = JDBCTemplate.getConnection();
		
		vo = dao.selectInqueryOneByNo(conn,no);

		return vo;
	}
		
}
