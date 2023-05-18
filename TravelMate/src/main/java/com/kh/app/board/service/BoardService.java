package com.kh.app.board.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.kh.app.board.dao.BoardDao;
import com.kh.app.board.vo.BoardVo;
import com.kh.app.board.vo.CategoryVo;
import com.kh.app.common.db.JDBCTemplate;
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
	public int write(BoardVo bvo, List<BoardImgVo> attVoList) throws Exception {

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
	
}

