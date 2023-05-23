package com.kh.app.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.app.board.vo.BoardVo;
import com.kh.app.board.vo.CategoryVo;
import com.kh.app.board.vo.CommentVo;
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
		
		String sql = "INSERT INTO BOARD ( NO , BOARD_CATEGORY_NO , MEMBER_NO  , TITLE , CONTENT ) VALUES ( SEQ_BOARD_NO.NEXTVAL ,1,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bvo.getMemberNo());
		pstmt.setString(2, bvo.getTitle());
		pstmt.setString(3, bvo.getContent());
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
	
	public List<BoardVo> list(Connection conn , PageVo pv) throws Exception {

		String sql = "SELECT NO , TITLE , MEMBER_NO , TO_CHAR(ENROLL_DATE , 'YYYY-MM-DD') AS ENROLL_DATE , HIT FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT * FROM BOARD WHERE DELETE_YN = 'N' ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pv.getBeginRow());
		pstmt.setInt(2, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		List<BoardVo> bvoList = new ArrayList<>();
		while(rs.next()) {
			String no = rs.getString("NO");
			String title = rs.getString("TITLE");
			String memberNo = rs.getString("MEMBER_NO");
			String enrollDate = rs.getString("ENROLL_DATE");
			String hit = rs.getString("HIT");
			
			BoardVo vo = new BoardVo();
			vo.setNo(no);
			vo.setMemberNo(memberNo);
			vo.setTitle(title);
			vo.setEnrollDate(enrollDate);
			vo.setHit(hit);
			
			bvoList.add(vo);
			
		}
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rs);
			
			return bvoList;
	}

		// board Cnt
		public int selectCnt(Connection conn) throws Exception {
		//SQL
		String sql = "SELECT COUNT(*) FROM BOARD WHERE DELETE_YN = 'N'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		//tx || rs
		int cnt = 0;
		if(rs.next()) {
			cnt = rs.getInt(1);
		}
		
		//close
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		return cnt;
	}

	public BoardVo noticeDetail(Connection conn, String no) throws Exception {

		//이거 쿼리문 MEMBER_CATEGORY 조인후 nick이 보이게 수정해야함  --완료
		String sql = "SELECT B.NO ,B.BOARD_CATEGORY_NO ,B.PRO_CATEGORY_NO ,B.MEMBER_NO ,B. BOARD_IMG_NO ,B.TITLE ,B.CONTENT ,TO_CHAR(B.ENROLL_DATE ,'YYYY-MM-DD') AS ENROLL_DATE ,B.DELETE_YN ,B.HIT ,B.UPLOAD_YN ,B.MODIFY_DATE ,M.NICK AS MEMBER_NICK FROM BOARD B JOIN MEMBER M ON B.MEMBER_NO = M.NO WHERE B.MEMBER_NO =2 AND B.NO =?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		BoardVo  vo = null;
		if(rs.next()) {
			String bcn = rs.getString("BOARD_CATEGORY_NO");
			String pcn = rs.getString("PRO_CATEGORY_NO");
			String mn = rs.getString("MEMBER_NO");
			String memberNick = rs.getString("MEMBER_NICK");
			String bin = rs.getString("BOARD_IMG_NO");
			String t = rs.getString("TITLE");
			String c = rs.getString("CONTENT");
			String e = rs.getString("ENROLL_DATE");
			String d = rs.getString("DELETE_YN");
			String h = rs.getString("HIT");
			String u = rs.getString("UPLOAD_YN");
			String m = rs.getString("MODIFY_DATE");
			
			vo = new BoardVo();
			vo.setNo(no);
			vo.setBoardCategoryNo(bcn);
			vo.setProCategoryNo(pcn);
			vo.setMemberNo(mn);
			vo.setMemberNick(memberNick);
			vo.setBoardImgNo(bin);
			vo.setTitle(t);
			vo.setContent(c);
			vo.setEnrollDate(e);
			vo.setDeleteYn(d);
			vo.setHit(h);
			vo.setUploadYn(u);
			vo.setModifyDate(m);
		}
		
		JDBCTemplate.close(pstmt);
		JDBCTemplate.close(rs);
		return vo;
	}

	//조회수 처리
	public int updateHit(Connection conn, String no) throws Exception {
		
		String sql = "UPDATE BOARD SET HIT = HIT+1 WHERE NO = ? AND DELETE_YN = 'N'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, no);
		int result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
		
	}

	// 공지사항 삭제 처리
	public int noticeDelete(Connection conn, String no) throws Exception {
		
		String sql = "UPDATE BOARD SET DELETE_YN = 'Y' WHERE NO =?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, no);

		int result = pstmt.executeUpdate();
		
		JDBCTemplate.close(pstmt);
		
		return result;
			
	}

	//도연 -공지사항 수정 처리
	public int noticeEdit(Connection conn, BoardVo vo) throws Exception {
		
		String sql = "UPDATE BOARD SET TITLE = ? , CONTENT = ? WHERE NO = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getTitle());
		pstmt.setString(2, vo.getContent());
		pstmt.setString(3, vo.getNo());
		
		int result = pstmt.executeUpdate();
		
		JDBCTemplate.close(pstmt);
		
		return result;
	}

	//공지사항 댓글쓰기
	public int NoticeReplyWrite(Connection conn, CommentVo vo) throws Exception {
		
		//SQL
		String sql = " INSERT INTO \"COMMENT\" ( NO , MEMBER_NO , BOARD_NO , CONTENT ) VALUES ( SEQ_COMMENT_NO.NEXTVAL , '2' , '1' ,? )";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, vo.getContent());
		int result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}

	//자유게시판 리스트
	public List<BoardVo> freeList(Connection conn, PageVo pv) throws Exception {
		
		String sql = "SELECT NO ,TITLE , MEMBER_NO , TO_CHAR(ENROLL_DATE , 'YYYY-MM-DD') AS ENROLL_DATE , HIT FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT * FROM BOARD WHERE BOARD_CATEGORY_NO=3 AND DELETE_YN = 'N' ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		PreparedStatement pstmt= conn.prepareStatement(sql);
		pstmt.setInt(1, pv.getBeginRow());
		pstmt.setInt(2, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		List<BoardVo> bvoList = new ArrayList<>();
		while(rs.next()) {
			String no = rs.getString("NO");
			String boardCategoryNo = rs.getString("BOARD_CATEGORY_NO");
			String proCategoryNo = rs.getString("PRO_CATEGORY_NO");
			String memberNo = rs.getString("MEMBER_NO");
			String boardImgNo = rs.getString("BOARD_IMG_NO");
			String title = rs.getString("TITLE");
			String content = rs.getString("CONTENT");
			String enrollDate = rs.getString("ENROLL_DATE");
			String deleteYn = rs.getString("DELETE_YN");
			String hit = rs.getString("HIT");
			String uploadYn = rs.getString("UPLOAD_YN");
			String modifyDate = rs.getString("MODIFY_DATE");
			
			BoardVo vo = new BoardVo();
			vo.setNo(no);
			vo.setBoardCategoryNo(boardCategoryNo);
			vo.setProCategoryNo(proCategoryNo);
			vo.setMemberNo(memberNo);
			vo.setBoardImgNo(boardImgNo);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setEnrollDate(enrollDate);
			vo.setDeleteYn(deleteYn);
			vo.setHit(hit);
			vo.setUploadYn(uploadYn);
			vo.setModifyDate(modifyDate);
			
			bvoList.add(vo);
		}
		
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		return bvoList;
	}

	//댓글 보여주기
	public List<CommentVo> noticeReplyList(Connection conn, String boardNo) throws Exception {
		
		String sql = "SELECT C.* ,M.NICK AS MEMBER_NICK FROM \"COMMENT\" C JOIN MEMBER M ON C.MEMBER_NO = M.NO WHERE BOARD_NO =?  AND DELETE_YN='N'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, boardNo);
		ResultSet rs = pstmt.executeQuery();
		
		List<CommentVo> replyList = new ArrayList<>();
		while(rs.next()) {
			String no =  rs.getString("NO");
			String memberNo = rs.getString("MEMBER_NO");
			String qnaNo = rs.getString("QNA_NO");
			String content = rs.getString("CONTENT");
			String enrollDate = rs.getString("ENROLL_DATE");
			String modiFyDate = rs.getString("MODIFY_DATE");
			String deleteYn = rs.getString("DELETE_YN");
			String memberNick = rs.getString("MEMBER_NICK");
			
			CommentVo vo = new CommentVo();
			vo.setNo(no);
			vo.setMemberNo(memberNo);
			vo.setBoardNo(boardNo);
			vo.setQnaNo(qnaNo);
			vo.setContent(content);
			vo.setEnrollDate(enrollDate);
			vo.setModifyDate(modiFyDate);
			vo.setDeleteYn(deleteYn);
			vo.setMemberNick(memberNick);
			
			replyList.add(vo);
		}
		
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		return replyList;
	}

}//class
