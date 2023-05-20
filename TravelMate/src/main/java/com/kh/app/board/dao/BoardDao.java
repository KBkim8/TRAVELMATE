package com.kh.app.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.app.board.vo.BoardVo;
import com.kh.app.board.vo.CategoryVo;
import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.common.page.PageVo;
import com.kh.app.cs.vo.InqueryVo;

public class BoardDao {

	public List<CategoryVo> getCategoryList(Connection conn) throws Exception {
			
			// SQL
			String sql = "SELECT * FROM CATEGORY";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			// tx || rs
			List<CategoryVo> cvoList = new ArrayList<>();
			while(rs.next()) {
				String no = rs.getString("NO");
				String name = rs.getString("NAME");
				
				CategoryVo vo = new CategoryVo();
				vo.setNo(no);
				vo.setName(name);
				
				cvoList.add(vo);
			}
			
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
			
			return cvoList;
		}

	public int write(Connection conn, BoardVo bvo) throws Exception {
		
		String sql = "INSERT INTO BOARD ( NO , BOARD_CATEGORY_NO , BOARD_IMG_NO ,MEMBER_NO, TITLE , CONTENT ) VALUES ( SEQ_BOARD_NO.NEXTVAL ,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bvo.getBoardCategoryNo());
		pstmt.setString(2, bvo.getBoardImgNo());
		pstmt.setString(3, bvo.getMemberNo());
		pstmt.setString(4, bvo.getTitle());
		pstmt.setString(5, bvo.getContent());
		int result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}


	// 강분 -회원별 게시글 목록 개수
	public int getMyBoardListCntByNo(Connection conn, String searchType, String searchValue, String mno) throws Exception {

		// SQL
		String sql = "SELECT COUNT(*) FROM ( SELECT B.NO ,B.TITLE ,B.CONTENT ,B.MEMBER_NO ,B.BOARD_CATEGORY_NO ,B.ENROLL_DATE ,B.DELETE_YN ,B.MODIFY_DATE ,B.HIT ,M.NICK FROM BOARD B JOIN MEMBER M ON (B.MEMBER_NO = M.NO)) WHERE DELETE_YN = 'N' AND MEMBER_NO=?";
		if("title".equals(searchType)) {
			sql += "AND TITLE LIKE '%" + searchValue + "%'";
		}else if("category".equals(searchType)) {
			sql += "AND BOARD_CATEGORY_NO = " + searchValue;
		}
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mno);
		ResultSet rs = pstmt.executeQuery();
		
		// tx || rs
		int cnt = 0;
		if(rs.next()) {
			cnt = rs.getInt(1);
		}
		
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		return cnt;
		
	}

	// 강분 -회원별 전체 작성 게시글 조회
	public List<BoardVo> getMyBoardListByNo(Connection conn, PageVo pv, String mno) throws Exception {

		// sql
		String sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM ( SELECT B.NO , B.TITLE , B.CONTENT , B.MEMBER_NO , B.BOARD_CATEGORY_NO , B.ENROLL_DATE , B.DELETE_YN , B.MODIFY_DATE , B.HIT , M.NICK , BC.NAME AS CATEGORY_NAME FROM BOARD B JOIN MEMBER M ON(B.MEMBER_NO = M.NO) JOIN BOARD_CATEGORY BC ON(B.BOARD_CATEGORY_NO = BC.NO) WHERE B.DELETE_YN = 'N' AND B.MEMBER_NO= ? ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mno);
		pstmt.setInt(2, pv.getBeginRow());
		pstmt.setInt(3, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		// tx || rs
		List<BoardVo> voList = new ArrayList<>();
		while(rs.next()) {
			String no = rs.getString("NO");
			String title = rs.getString("TITLE");
			String content = rs.getString("CONTENT");
			String memberNo = rs.getString("MEMBER_NO");
			String boardCategoryNo = rs.getString("BOARD_CATEGORY_NO");
			String enrollDate = rs.getString("ENROLL_DATE");
			String deleteYn = rs.getString("DELETE_YN");
			String modifyDate = rs.getString("MODIFY_DATE");
			String hit = rs.getString("HIT");
			String memberNick = rs.getString("NICK");
			String categoryName = rs.getString("CATEGORY_NAME");
	
			BoardVo vo = new BoardVo();
			vo.setNo(no);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setMemberNo(memberNo);
			vo.setBoardCategoryNo(boardCategoryNo);
			vo.setEnrollDate(enrollDate);
			vo.setDeleteYn(deleteYn);
			vo.setModifyDate(modifyDate);
			vo.setHit(hit);
			vo.setMemberNick(memberNick);
			vo.setCategoryName(categoryName);
			
			voList.add(vo);
		}
		
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		return voList;
	
	}

	// 강분 -회원별 검색 게시글 목록 조회
	public List<BoardVo> getMyBoardListByNo(Connection conn, PageVo pv, String searchType, String searchValue,String mno) throws Exception {

		// SQL
		String sql = "";
		if(searchType.equals("title")) {
			// sql (제목으로 검색)
			sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM ( SELECT B.NO , B.TITLE , B.CONTENT , B.MEMBER_NO , B.BOARD_CATEGORY_NO , B.ENROLL_DATE , B.DELETE_YN , B.MODIFY_DATE , B.HIT , M.NICK , BC.NAME AS CATEGORY_NAME FROM BOARD B JOIN MEMBER M ON(B.MEMBER_NO = M.NO) JOIN BOARD_CATEGORY BC ON(B.BOARD_CATEGORY_NO = BC.NO) WHERE B.DELETE_YN = 'N' AND B.TITLE LIKE '%' || ? || '%' AND B.MEMBER_NO= ? ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		}else if("category".equals(searchType)) {
			// sql (카테고리로 검색)
			sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM ( SELECT B.NO , B.TITLE , B.CONTENT , B.MEMBER_NO , B.BOARD_CATEGORY_NO , B.ENROLL_DATE , B.DELETE_YN , B.MODIFY_DATE , B.HIT , M.NICK , BC.NAME AS CATEGORY_NAME FROM BOARD B JOIN MEMBER M ON(B.MEMBER_NO = M.NO) JOIN BOARD_CATEGORY BC ON(B.BOARD_CATEGORY_NO = BC.NO) WHERE B.DELETE_YN = 'N' AND B.BOARD_CATEGORY_NO LIKE '%' || ? || '%' AND B.MEMBER_NO= ? ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?\r\n"
					+ "";
		}else {
			// 예외 던져주기
			// throw new Exception();
			// 값이 이상하면 기본 목록 조회
			return getMyBoardListByNo(conn, pv, mno);
		}

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString	(1, searchValue);
		pstmt.setString	(2, mno);
		pstmt.setInt	(3, pv.getBeginRow());
		pstmt.setInt	(4, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		// tx || rs
		List<BoardVo> voList = new ArrayList<>();
		while(rs.next()) {
			String no = rs.getString("NO");
			String title = rs.getString("TITLE");
			String content = rs.getString("CONTENT");
			String memberNo = rs.getString("MEMBER_NO");
			String boardCategoryNo = rs.getString("BOARD_CATEGORY_NO");
			String enrollDate = rs.getString("ENROLL_DATE");
			String deleteYn = rs.getString("DELETE_YN");
			String modifyDate = rs.getString("MODIFY_DATE");
			String hit = rs.getString("HIT");
			String memberNick = rs.getString("NICK");
			String categoryName = rs.getString("CATEGORY_NAME");
	
			BoardVo vo = new BoardVo();
			vo.setNo(no);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setMemberNo(memberNo);
			vo.setBoardCategoryNo(boardCategoryNo);
			vo.setEnrollDate(enrollDate);
			vo.setDeleteYn(deleteYn);
			vo.setModifyDate(modifyDate);
			vo.setHit(hit);
			vo.setMemberNick(memberNick);
			vo.setCategoryName(categoryName);
			
			voList.add(vo);
		}
		
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		return voList;
	
	}
	
	
	

	

		
	

}
