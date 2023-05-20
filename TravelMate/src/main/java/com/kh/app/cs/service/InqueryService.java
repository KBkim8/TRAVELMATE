package com.kh.app.cs.service;

import java.sql.Connection;
import java.util.List;

import com.kh.app.board.vo.BoardVo;
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


	// 문의글 상세조회
	public InqueryVo selectInqueryOneByNo(String no) throws Exception {

		InqueryVo vo = null;
		// conn
		Connection conn = JDBCTemplate.getConnection();
		
		vo = dao.selectInqueryOneByNo(conn,no);

		return vo;
	}

	// 글 개수
	public int getInqueryListCnt(String searchType, String searchValue) throws Exception {

		// conn
		Connection conn = JDBCTemplate.getConnection();
		
		int cnt = dao.getInqueryListCnt(conn, searchType, searchValue);
		
		// close
		JDBCTemplate.close(conn);
		
		return cnt;
		
	}

	// 검색해서 문의글 조회
	public List<InqueryVo> getInqueryList(PageVo pv, String searchType, String searchValue) throws Exception {
		
		// conn
		Connection conn = JDBCTemplate.getConnection();
		
		List<InqueryVo> voList = dao.getInqueryList(conn,pv, searchType, searchValue);
		
		// close
		JDBCTemplate.close(conn);
		
		return voList;
	}

	// 전체 문의글 조회
	public List<InqueryVo> getInqueryList(PageVo pv) throws Exception {

		// conn
		Connection conn = JDBCTemplate.getConnection();
		
		List<InqueryVo> voList = dao.getInqueryList(conn,pv);
		
		// close
		JDBCTemplate.close(conn);
		
		return voList;
		
	
	}
		
}
