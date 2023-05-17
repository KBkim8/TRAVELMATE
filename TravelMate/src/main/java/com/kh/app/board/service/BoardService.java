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
import com.kh.app.util.AttachmentVo;

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
	public int write(BoardVo bvo, List<AttachmentVo> attVoList) throws Exception {

		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		String sql = "INSERT INTO BOARD ( NO , BOARD_CATEGORY_NO , BOARD_IMG_NO ,MEMBER_NO, TITLE , CONTENT ) VALUES ( SEQ_BOARD_NO.NEXTVAL ,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bvo.getBoardCategoryNo());
		pstmt.setString(2, bvo.getBoardImgNo());
		pstmt.setString(3, bvo.getMemberNo());
		pstmt.setString(4, bvo.getTitle());
		pstmt.setString(5, bvo.getContent());
		int result = pstmt.executeUpdate();
		
		//tx rs
		if(result ==1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.close(conn);
		}
		
		// close
		JDBCTemplate.close(pstmt);
		JDBCTemplate.close(conn);
		
		return result;
	}
	
}

