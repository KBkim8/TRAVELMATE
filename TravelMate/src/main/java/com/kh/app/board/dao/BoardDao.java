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
		
		String sql = "INSERT INTO BOARD ( NO , BOARD_CATEGORY_NO , MEMBER_NO  , TITLE , CONTENT ) VALUES ( SEQ_BOARD_NO.NEXTVAL ,1,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bvo.getMemberNo());
		pstmt.setString(2, bvo.getTitle());
		pstmt.setString(3, bvo.getContent());
		int result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}

	public int selectCnt(Connection conn, String memberNo) throws Exception {

		// SQL
		// 검색 기능을 넣을지,,, 아님 그냥 로그인한 자신 글만 볼 수 있게 해야할 지 고민해보기
		String sql = "SELECT COUNT(*) FROM BOARD WHERE DELETE_YN='N' AND MEMBER_NO=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, memberNo);
		ResultSet rs = pstmt.executeQuery();
		
		// tx || rs
		int cnt = 0;
		if(rs.next()) {
			cnt = rs.getInt(1);
		}
		
		// close
		JDBCTemplate.close(pstmt);
		JDBCTemplate.close(rs);
				
		return cnt;

	}

	public List<InqueryVo> selectInqueryList(Connection conn, PageVo pv, String memberNo) {

		// SQL
		String sql = "";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, pv.getBeginRow());
		pstmt.setInt(2, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		// tx || rs
		List<InqueryVo> list = new ArrayList<>();
		
		while(rs.next()) {
			String no = rs.getString("NO");
			String memberNo = rs.getString("MEMBER_NO");
			String title = rs.getString("TITLE");
			String content = rs.getString("CONTENT");
			String enrollDate = rs.getString("ENROLL_DATE");
			String deleteYn = rs.getString("DELETE_YN");
			String memberNick = rs.getString("NICK");
			
			InqueryVo vo = new InqueryVo();
			vo.setNo(no);
			vo.setMemberNo(memberNo);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setEnrollDate(enrollDate);
			vo.setDeleteYn(deleteYn);
			vo.setMemberNick(memberNick);
			
			list.add(vo);
			
		}

		// close
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);

		return list;
		
	}

	public List<BoardVo> list(Connection conn , PageVo pv) throws Exception {

		String sql = "SELECT NO , TITLE , MEMBER_NO , TO_CHAR(ENROLL_DATE , 'YYYY-MM-DD') AS ENROLL_DATE , HIT FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT * FROM BOARD WHERE DELETE_YN = 'N' ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN 1 AND 3 AND DELETE_YN='N'";
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

	/// board Cnt
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

		//이거 쿼리문 MEMBER_CATEGORY 조인후 NAME이 보이게 수정해야함
		String sql = "SELECT * FROM BOARD WHERE BOARD_CATEGORY_NO =1 AND NO =? AND DELETE_YN ='N'"; 
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		BoardVo  vo = null;
		if(rs.next()) {
			String bcn = rs.getString("BOARD_CATEGORY_NO");
			String pcn = rs.getString("PRO_CATEGORY_NO");
			String mn = rs.getString("MEMBER_NO");
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

}//class
