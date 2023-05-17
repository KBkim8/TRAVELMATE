package com.kh.app.cs.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.common.page.PageVo;
import com.kh.app.cs.vo.InqueryVo;

public class InqueryDao {

	// 문의하기 게시글 작성
	public int write(Connection conn, InqueryVo ivo) throws Exception {

		// sql
		String sql = "INSERT INTO QNA(NO, MEMBER_NO, TITLE, CONTENT) VALUES(SEQ_QNA_NO.NEXTVAL, ? , ?,  ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ivo.getMemberNo());
		pstmt.setString(2, ivo.getTitle());
		pstmt.setString(3, ivo.getContent());
		int result =  pstmt.executeUpdate();
		
		JDBCTemplate.close(pstmt);
		
		return result;
	}

	// 문의글 개수 세기
	public int selectCnt(Connection conn) throws Exception {

		// SQL
		// 검색 기능을 넣을지,,, 아님 그냥 로그인한 자신 글만 볼 수 있게 해야할 지 고민해보기
		String sql = "SELECT COUNT(*) FROM QNA WHERE DELETE_YN='N'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
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

	// 문의글 목록 select
	public List<InqueryVo> selectInqueryList(Connection conn, PageVo pv) throws Exception {

		// SQL
		String sql = "SELECT Q.NO , Q.MEMBER_NO , Q.TITLE , Q.CONTENT , TO_CHAR(Q.ENROLL_DATE, 'YYYY-MM-DD') AS ENROLL_DATE , Q.DELETE_YN ,M.NICK FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT * FROM QNA WHERE DELETE_YN='N' ORDER BY NO DESC ) T )Q JOIN MEMBER M ON (Q.MEMBER_NO = M.NO) WHERE RNUM BETWEEN ? AND ?";
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

	// 문의글 상세 조회
	public InqueryVo selectInqueryOneByNo(Connection conn, String no) throws Exception {

		// SQL
		String sql = "SELECT Q.NO , Q.MEMBER_NO , Q.TITLE , Q.CONTENT , TO_CHAR(Q.ENROLL_DATE, 'YYYY-MM-DD') AS ENROLL_DATE , Q.DELETE_YN, M.NICK FROM QNA Q JOIN MEMBER M ON(Q.MEMBER_NO = M.NO) WHERE Q.NO = ? AND Q.DELETE_YN = 'N'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		// tx || rs
		InqueryVo vo = null;
		if(rs.next()) {
			String memberNo = rs.getString("MEMBER_NO");
			String title = rs.getString("TITLE");
			String content = rs.getString("CONTENT");
			String enrollDate = rs.getString("ENROLL_DATE");
			String deleteYn = rs.getString("DELETE_YN");
			String memberNick = rs.getString("NICK");
			
			vo = new InqueryVo();
			vo.setNo(no);
			vo.setMemberNo(memberNo);
			vo.setTitle(title);
			vo.setContent(content);
			vo.setEnrollDate(enrollDate);
			vo.setDeleteYn(deleteYn);
			vo.setMemberNick(memberNick);
			
		}
		
		// close
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);

		return vo;
		
	}

}
