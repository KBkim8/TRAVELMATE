package com.kh.app.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.app.admin.vo.ReportListVo;
import com.kh.app.admin.vo.ReportSearchVo;
import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.common.page.PageVo;

public class AdminDao {

	//신고내역 페이징처리
	public int reportListCnt(Connection conn) throws Exception {
		String s = "SELECT COUNT(*) FROM REPORT_LIST";
		PreparedStatement pstmt = conn.prepareStatement(s);
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
	
	//제재이력조회 페이징처리
	public int reportSearchCnt(Connection conn) throws Exception {
		String s = "SELECT COUNT(*) FROM MEMBER_SANCTIONS";
		PreparedStatement pstmt = conn.prepareStatement(s);
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
	
	public List<ReportListVo> reportList(Connection conn, PageVo pv) throws Exception {
		String s = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT L.NO, L.MEMBER_NO, L.BOARD_NO, L.SANCTION_REASON_NO, L.CONTENT, R.NAME AS REASON_NAME, M.NICK, B.NAME AS CATEGORY_NAME FROM REPORT_LIST L JOIN REPORT_REASON R ON L.SANCTION_REASON_NO = R.NO JOIN MEMBER M ON L.MEMBER_NO = M.NO JOIN BOARD_CATEGORY B ON L.BOARD_NO = B.NO ORDER BY L.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		PreparedStatement pstmt = conn.prepareStatement(s);
		pstmt.setInt(1, pv.getBeginRow());
		pstmt.setInt(2, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		//tx || rs
		List<ReportListVo> reportVoList = new ArrayList<>(); 
		while(rs.next()) {
			String no = rs.getString("NO");
			String memberNo = rs.getString("MEMBER_NO");
			String boardNo = rs.getString("BOARD_NO");
			String reasonNo = rs.getString("SANCTION_REASON_NO");
			String content = rs.getString("CONTENT");
			String reasonName = rs.getString("REASON_NAME");
			String nick = rs.getString("NICK");
			String categoryName = rs.getString("CATEGORY_NAME");
			
			ReportListVo vo = new ReportListVo();
			vo.setNo(no);
			vo.setMemberNo(memberNo);
			vo.setBoardNo(boardNo);
			vo.setReasonNo(reasonNo);
			vo.setContent(content);
			vo.setReasonName(reasonName);
			vo.setNick(nick);
			vo.setCategoryName(categoryName);
			
			reportVoList.add(vo);
		}
		JDBCTemplate.close(pstmt);
		JDBCTemplate.close(rs);
		
		return reportVoList;
	}
	
	//신고내역 카테고리 설정
	public List<ReportListVo> reportList(Connection conn, PageVo pv, String searchType, String searchValue) throws Exception {	
		String s = "";
		
		if("memberNick".equals(searchType)) {
			s = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT L.NO, L.MEMBER_NO, L.BOARD_NO, L.SANCTION_REASON_NO, L.CONTENT, R.NAME AS REASON_NAME, M.NICK, B.NAME AS CATEGORY_NAME FROM REPORT_LIST L JOIN REPORT_REASON R ON L.SANCTION_REASON_NO = R.NO JOIN MEMBER M ON L.MEMBER_NO = M.NO JOIN BOARD_CATEGORY B ON L.BOARD_NO = B.NO WHERE M.NICK LIKE '%'||?||'%' OR M.NICK LIKE '%?' OR M.NICK LIKE '?%' ORDER BY L.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";			
		}else if("boardName".equals(searchType)) {
			s = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT L.NO, L.MEMBER_NO, L.BOARD_NO, L.SANCTION_REASON_NO, L.CONTENT, R.NAME AS REASON_NAME, M.NICK, B.NAME AS CATEGORY_NAME FROM REPORT_LIST L JOIN REPORT_REASON R ON L.SANCTION_REASON_NO = R.NO JOIN MEMBER M ON L.MEMBER_NO = M.NO JOIN BOARD_CATEGORY B ON L.BOARD_NO = B.NO WHERE B.NAME LIKE '%'||?||'%' OR B.NAME LIKE '%?' OR B.NAME LIKE '?%' ORDER BY L.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";		
		}else if("reportReason".equals(searchType)) {
			s = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT L.NO, L.MEMBER_NO, L.BOARD_NO, L.SANCTION_REASON_NO, L.CONTENT, R.NAME AS REASON_NAME, M.NICK, B.NAME AS CATEGORY_NAME FROM REPORT_LIST L JOIN REPORT_REASON R ON L.SANCTION_REASON_NO = R.NO JOIN MEMBER M ON L.MEMBER_NO = M.NO JOIN BOARD_CATEGORY B ON L.BOARD_NO = B.NO WHERE R.NAME = ? ORDER BY L.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";			
		}else {
			return reportList(conn, pv);
		}
		
		PreparedStatement pstmt = conn.prepareStatement(s);
		pstmt.setString(1, searchValue);
		pstmt.setInt(2, pv.getBeginRow());
		pstmt.setInt(3, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		//tx || rs
		List<ReportListVo> reportVoList = new ArrayList<>(); 
		while(rs.next()) {
			String no = rs.getString("NO");
			String memberNo = rs.getString("MEMBER_NO");
			String boardNo = rs.getString("BOARD_NO");
			String reasonNo = rs.getString("SANCTION_REASON_NO");
			String content = rs.getString("CONTENT");
			String reasonName = rs.getString("REASON_NAME");
			String nick = rs.getString("NICK");
			String categoryName = rs.getString("CATEGORY_NAME");
			
			ReportListVo vo = new ReportListVo();
			vo.setNo(no);
			vo.setMemberNo(memberNo);
			vo.setBoardNo(boardNo);
			vo.setReasonNo(reasonNo);
			vo.setContent(content);
			vo.setReasonName(reasonName);
			vo.setNick(nick);
			vo.setCategoryName(categoryName);
			
			reportVoList.add(vo);
		}
		JDBCTemplate.close(pstmt);
		JDBCTemplate.close(rs);
		
		return reportVoList;
	}

	//제재이력조회
	public List<ReportSearchVo> reportSearch(Connection conn, PageVo pv) throws Exception {
		String s = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT S.NO, TO_CHAR(S.ENROLL_DATE, 'YY-MM-DD') AS ENROLL_DATE, TO_CHAR(S.CANCEL_ENROLL_DATE, 'YY-MM-DD') AS CANCEL_ENROLL_DATE, M.NICK, ST.NAME FROM MEMBER_SANCTIONS S JOIN REPORT_LIST L ON S.REPORT_LIST_NO = L.NO JOIN MEMBER M ON L.MEMBER_NO = M.NO JOIN SANCTION_TYPE ST ON S.SANCTION_TYPE_CODE = ST.CODE ORDER BY NO DESC )T ) WHERE RNUM BETWEEN ? AND ?";
		PreparedStatement pstmt = conn.prepareStatement(s);
		pstmt.setInt(1, pv.getBeginRow());
		pstmt.setInt(2, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		//tx||rs
		List<ReportSearchVo> voList = new ArrayList<>();
		while(rs.next()) {
			String no = rs.getString("NO");
			String enrollDate = rs.getString("ENROLL_DATE");
			String cancelEnrollDate = rs.getString("CANCEL_ENROLL_DATE");
			String memberNick = rs.getString("NICK");
			String sanctionName = rs.getString("NAME");
			
			ReportSearchVo vo = new ReportSearchVo();
			vo.setNo(no);
			vo.setEnrollDate(enrollDate);
			vo.setCancelEnrollDate(cancelEnrollDate);
			vo.setMemberNick(memberNick);
			vo.setSanctionName(sanctionName);
			
			
			voList.add(vo);
		}
		
		//close
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		return voList;
	}

	//제재이력조회 카테고리 설정
	public List<ReportSearchVo> reportSearch(Connection conn, PageVo pv, String searchType, String searchValue) throws Exception {
		String s = "";
		
		if("memberNick".equals(searchType)) {
			//닉네임으로 검색
			s = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT S.NO, TO_CHAR(S.ENROLL_DATE, 'YY-MM-DD') AS ENROLL_DATE, TO_CHAR(S.CANCEL_ENROLL_DATE, 'YY-MM-DD') AS CANCEL_ENROLL_DATE, M.NICK, ST.NAME FROM MEMBER_SANCTIONS S JOIN REPORT_LIST L ON S.REPORT_LIST_NO = L.NO JOIN MEMBER M ON L.MEMBER_NO = M.NO JOIN SANCTION_TYPE ST ON S.SANCTION_TYPE_CODE = ST.CODE WHERE M.NICK LIKE '%'||?||'%' OR M.NICK LIKE '%?' OR M.NICK LIKE '?%' ORDER BY NO DESC )T ) WHERE RNUM BETWEEN ? AND ?";		
		}else if("sanctionName".equals(searchType)) {
			//제재종류로 검색
			s = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT S.NO, TO_CHAR(S.ENROLL_DATE, 'YY-MM-DD') AS ENROLL_DATE, TO_CHAR(S.CANCEL_ENROLL_DATE, 'YY-MM-DD') AS CANCEL_ENROLL_DATE, M.NICK, ST.NAME FROM MEMBER_SANCTIONS S JOIN REPORT_LIST L ON S.REPORT_LIST_NO = L.NO JOIN MEMBER M ON L.MEMBER_NO = M.NO JOIN SANCTION_TYPE ST ON S.SANCTION_TYPE_CODE = ST.CODE WHERE ST.NAME = ? ORDER BY NO DESC )T ) WHERE RNUM BETWEEN ? AND ?";		
		}else {
			return reportSearch(conn, pv);	
		}
		PreparedStatement pstmt = conn.prepareStatement(s);
		pstmt.setString(1, searchValue);
		pstmt.setInt(2, pv.getBeginRow());
		pstmt.setInt(3, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		//tx||rs
		List<ReportSearchVo> voList = new ArrayList<>();
		while(rs.next()) {
			String no = rs.getString("NO");
			String enrollDate = rs.getString("ENROLL_DATE");
			String cancelEnrollDate = rs.getString("CANCEL_ENROLL_DATE");
			String memberNick = rs.getString("NICK");
			String sanctionName = rs.getString("NAME");
			
			ReportSearchVo vo = new ReportSearchVo();
			vo.setNo(no);
			vo.setEnrollDate(enrollDate);
			vo.setCancelEnrollDate(cancelEnrollDate);
			vo.setMemberNick(memberNick);
			vo.setSanctionName(sanctionName);
			
			
			voList.add(vo);
		}
		
		//close
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		return voList;
	}
	
}
