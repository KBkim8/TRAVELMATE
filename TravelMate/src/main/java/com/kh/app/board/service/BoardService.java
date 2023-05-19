package com.kh.app.board.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.app.board.dao.BoardDao;
import com.kh.app.board.vo.BoardVo;
import com.kh.app.board.vo.CategoryVo;
import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.common.page.PageVo;
import com.kh.app.cs.vo.InqueryVo;
import com.kh.app.member.dao.MemberDao;
import com.kh.app.util.BoardImgVo;

public class BoardService {
	
private final BoardDao dao;
	
	public BoardService() {
		dao = new BoardDao(); 
	}

	//카테고리 리스트
	public List<CategoryVo> getCategoryList() throws Exception {
		
		// 커넥션
		try(Connection conn = JDBCTemplate.getConnection();){
			List<CategoryVo> cvoList = dao.getCategoryList(conn);

			return cvoList;
		}
		}

	//글쓰기
	public int write(BoardVo bvo) throws Exception {

		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		int result = dao.write(conn ,bvo);
		//tx rs
		if(result ==1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.close(conn);
		}
		
		// close
		JDBCTemplate.close(conn);
		
		return result;
	}

	public int selectCnt(String memberNo) throws Exception {

		// connn
		Connection conn = JDBCTemplate.getConnection();
		
		int cnt = dao.selectCnt(conn, memberNo);
		
		JDBCTemplate.close(conn);
		
		return cnt;

	}

	// 회원별 게시글 목록 조히
	public List<InqueryVo> selectInqueryList(PageVo pv, String memberNo) {

		// conn
		Connection conn = JDBCTemplate.getConnection();
		
		List<InqueryVo> list = dao.selectInqueryList(conn, pv, memberNo);
		
		JDBCTemplate.close(conn);
		
		return list;
		
	}

	//공지사항 게시글 목록 조회
	public List<BoardVo> list() throws Exception {
		
		Connection conn = JDBCTemplate.getConnection();
		
		List<BoardVo>bvoList = dao.list(conn);
		
		JDBCTemplate.close(conn);
	
		return bvoList;
	}

	//board cnt
	public int selectCnt() throws Exception {

		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		int cnt = dao.selectCnt(conn);
		
		JDBCTemplate.close(conn);
		
		return cnt;
	}

	//notice board detail
	public BoardVo detail() {
		
		Connection conn = JDBCTemplate.getConnection();
		String sql = "";
	}
	
}

