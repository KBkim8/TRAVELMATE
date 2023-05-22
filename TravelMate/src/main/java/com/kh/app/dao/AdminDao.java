package com.kh.app.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.app.admin.vo.AdBannerVo;
import com.kh.app.admin.vo.MemberSearchVo;
import com.kh.app.admin.vo.ReportListVo;
import com.kh.app.admin.vo.ReportSearchVo;
import com.kh.app.admin.vo.SellRequestVo;
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
	
	//회원조회 페이징처리
	public int memberSearchCnt(Connection conn) throws Exception {
		String s = "SELECT COUNT(*) FROM MEMBER WHERE STATUS = 'O'";
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
	
	//판매등록요청 페이징처리
	public int sellRequestCnt(Connection conn) throws Exception {
		String s = "SELECT COUNT(*) FROM BOARD WHERE UPLOAD_YN = 'Y'";
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
	
	//광고배너관리 페이징처리
	public int adBannerCnt(Connection conn) throws Exception {
		String s = "SELECT COUNT(*) FROM SOUVENIR_BANNER WHERE DELETE_YN = 'N'";
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

	//회원조회
	public List<MemberSearchVo> memberSearch(Connection conn, PageVo pv) throws Exception {
		String s = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT M.NO, M.ID, M.NICK, M.STATUS, G.NAME FROM MEMBER M JOIN MEMBER_GRADE G ON M.MEMBER_GRADE_NO = G.NO ORDER BY M.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		PreparedStatement pstmt = conn.prepareStatement(s);
		pstmt.setInt(1, pv.getBeginRow());
		pstmt.setInt(2, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		//tx || rs
		List<MemberSearchVo> voList = new ArrayList<>();
		while(rs.next()) {
			String no = rs.getString("NO");
			String id = rs.getString("ID");
			String nick = rs.getString("NICK");
			String status = rs.getString("STATUS");
			String gradeName = rs.getString("NAME");
			
			MemberSearchVo vo = new MemberSearchVo();
			vo.setNo(no);
			vo.setId(id);
			vo.setNick(nick);
			vo.setStatus(status);
			vo.setGradeName(gradeName);
			
			voList.add(vo);
		}
		
		//close
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		return voList;
	}
	
	//회원조회 카테고리 설정
	public List<MemberSearchVo> memberSearch(Connection conn, PageVo pv, String searchType, String searchValue) throws Exception {
		String s = "";
		if("memberId".equals(searchType)) {
			//아이디검색
			s = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT M.NO, M.ID, M.NICK, M.STATUS, G.NAME FROM MEMBER M JOIN MEMBER_GRADE G ON M.MEMBER_GRADE_NO = G.NO WHERE M.ID LIKE '%'||?||'%' OR M.ID LIKE '%?' OR M.ID LIKE '?%' ORDER BY M.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";		
		}else if("memberNick".equals(searchType)) {
			//닉네임검색
			s = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT M.NO, M.ID, M.NICK, M.STATUS, G.NAME FROM MEMBER M JOIN MEMBER_GRADE G ON M.MEMBER_GRADE_NO = G.NO WHERE M.NICK LIKE '%'||?||'%' OR M.NICK LIKE '%?' OR M.NICK LIKE '?%' ORDER BY M.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";			
		}else if("status".equals(searchType)) {
			//회원등급검색
			s = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT M.NO, M.ID, M.NICK, M.STATUS, G.NAME FROM MEMBER M JOIN MEMBER_GRADE G ON M.MEMBER_GRADE_NO = G.NO WHERE M.STATUS = ? ORDER BY M.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";			
		}else {
			return memberSearch(conn, pv);
		}
		PreparedStatement pstmt = conn.prepareStatement(s);
		pstmt.setString(1, searchValue);
		pstmt.setInt(2, pv.getBeginRow());
		pstmt.setInt(3, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		//tx || rs
		List<MemberSearchVo> voList = new ArrayList<>();
		while(rs.next()) {
			String no = rs.getString("NO");
			String id = rs.getString("ID");
			String nick = rs.getString("NICK");
			String status = rs.getString("STATUS");
			String gradeName = rs.getString("NAME");
			
			MemberSearchVo vo = new MemberSearchVo();
			vo.setNo(no);
			vo.setId(id);
			vo.setNick(nick);
			vo.setStatus(status);
			vo.setGradeName(gradeName);
			
			voList.add(vo);
		}
		
		//close
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		return voList;
	}

	//판매등록요청조회
	public List<SellRequestVo> sellRequest(Connection conn, PageVo pv) throws Exception {
		String s = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT B.NO, B.TITLE, TO_CHAR(B.ENROLL_DATE, 'YY-MM-DD') AS ENROLL_DATE, M.NICK, I.TITLE AS IMG FROM BOARD B JOIN MEMBER M ON M.NO = B.MEMBER_NO JOIN BOARD_IMG I ON B.BOARD_IMG_NO = I.NO WHERE B.UPLOAD_YN = 'Y' ORDER BY B.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		PreparedStatement pstmt = conn.prepareStatement(s);
		pstmt.setInt(1, pv.getBeginRow());
		pstmt.setInt(2, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		//tx || rs
		List<SellRequestVo> voList = new ArrayList<>();
		while(rs.next()) {
			String no = rs.getString("NO");
			String title = rs.getString("TITLE");
			String writer = rs.getString("NICK");
			String enrollDate = rs.getString("ENROLL_DATE");
			String img = rs.getString("IMG");
			
			SellRequestVo vo = new SellRequestVo();
			vo.setNo(no);
			vo.setTitle(title);
			vo.setWriter(writer);
			vo.setEnrollDate(enrollDate);
			vo.setImg(img);
			
			voList.add(vo);
		}
		
		//close
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		return voList;
	}

	//판매등록요청조회 카테고리 설정
	public List<SellRequestVo> sellRequest(Connection conn, PageVo pv, String searchType, String searchValue) throws Exception {
		String s = "";
		if("title".equals(searchType)) {
			//제목조회
			s = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT B.NO, B.TITLE, TO_CHAR(B.ENROLL_DATE, 'YY-MM-DD') AS ENROLL_DATE, M.NICK, I.TITLE AS IMG FROM BOARD B JOIN MEMBER M ON M.NO = B.MEMBER_NO JOIN BOARD_IMG I ON B.BOARD_IMG_NO = I.NO WHERE B.UPLOAD_YN = 'Y' AND B.TITLE LIKE '%'||?||'%' OR B.TITLE LIKE '%?' OR B.TITLE LIKE '?%' ORDER BY B.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";			
		}else if("writer".equals(searchType)) {
			//작성자조회
			s = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT B.NO, B.TITLE, TO_CHAR(B.ENROLL_DATE, 'YY-MM-DD') AS ENROLL_DATE, M.NICK, I.TITLE AS IMG FROM BOARD B JOIN MEMBER M ON M.NO = B.MEMBER_NO JOIN BOARD_IMG I ON B.BOARD_IMG_NO = I.NO WHERE B.UPLOAD_YN = 'Y' AND M.NICK LIKE '%'||?||'%' OR M.NICK LIKE '%?' OR M.NICK LIKE '?%' ORDER BY B.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";			
		}else {
			return sellRequest(conn, pv);
		}
		PreparedStatement pstmt = conn.prepareStatement(s);			
		pstmt.setString(1, searchValue);
		pstmt.setInt(2, pv.getBeginRow());
		pstmt.setInt(3, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		//tx || rs
		List<SellRequestVo> voList = new ArrayList<>();
		while(rs.next()) {
			String no = rs.getString("NO");
			String title = rs.getString("TITLE");
			String writer = rs.getString("NICK");
			String enrollDate = rs.getString("ENROLL_DATE");
			String img = rs.getString("IMG");
			
			SellRequestVo vo = new SellRequestVo();
			vo.setNo(no);
			vo.setTitle(title);
			vo.setWriter(writer);
			vo.setEnrollDate(enrollDate);
			vo.setImg(img);
			
			voList.add(vo);
		}
		
		//close
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		return voList;
	}

	//광고배너관리
	public List<AdBannerVo> adBanner(Connection conn, PageVo pv) throws Exception {
		String s = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT B.NO, B.NAME AS NAME, B.IMAGE, M.NICK, S.NAME AS SOUVENIR_NAME FROM SOUVENIR_BANNER B JOIN MEMBER M ON B.MEMBER_NO = M.NO JOIN SOUVENIR S ON B.SOUVENIR_NO = S.NO WHERE B.DELETE_YN = 'N' ORDER BY B.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		PreparedStatement pstmt = conn.prepareStatement(s);
		pstmt.setInt(1, pv.getBeginRow());
		pstmt.setInt(2, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		List<AdBannerVo> voList = new ArrayList<>();
		while(rs.next()) {
			String no = rs.getString("NO");
			String name = rs.getString("NAME");
			String image = rs.getString("IMAGE");
			String nick = rs.getString("NICK");
			String souvenirName = rs.getString("SOUVENIR_NAME");
			
			AdBannerVo vo = new AdBannerVo();
			vo.setNo(no);
			vo.setName(name);
			vo.setImage(image);
			vo.setNick(nick);
			vo.setSouvenirName(souvenirName);
			
			voList.add(vo);
		}
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		return voList;
	}
	
	//광고배너관리 카테고리 검색
	public List<AdBannerVo> adBanner(Connection conn, PageVo pv, String searchType, String searchValue) throws Exception {
		String s = "";
		if("bannerName".equals(searchType)) {
			//배너이름
			s = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT B.NO, B.NAME AS NAME, B.IMAGE, M.NICK, S.NAME AS SOUVENIR_NAME FROM SOUVENIR_BANNER B JOIN MEMBER M ON B.MEMBER_NO = M.NO JOIN SOUVENIR S ON B.SOUVENIR_NO = S.NO WHERE B.DELETE_YN = 'N' AND B.NAME LIKE '%'||?||'%' OR B.NAME LIKE '%?' OR B.NAME LIKE '?%' ORDER BY B.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";			
		}else if("memberNick".equals(searchType)) {
			//닉네임			
			s = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT B.NO, B.NAME AS NAME, B.IMAGE, M.NICK, S.NAME AS SOUVENIR_NAME FROM SOUVENIR_BANNER B JOIN MEMBER M ON B.MEMBER_NO = M.NO JOIN SOUVENIR S ON B.SOUVENIR_NO = S.NO WHERE B.DELETE_YN = 'N' AND M.NICK LIKE '%'||?||'%' OR M.NICK LIKE '%?' OR M.NICK LIKE '?%' ORDER BY B.NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		}else {
			return adBanner(conn, pv);
		}
		PreparedStatement pstmt = conn.prepareStatement(s);		
		pstmt.setString(1, searchValue);
		pstmt.setInt(2, pv.getBeginRow());
		pstmt.setInt(3, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		List<AdBannerVo> voList = new ArrayList<>();
		while(rs.next()) {
			String no = rs.getString("NO");
			String name = rs.getString("NAME");
			String image = rs.getString("IMAGE");
			String nick = rs.getString("NICK");
			String souvenirName = rs.getString("SOUVENIR_NAME");
			
			AdBannerVo vo = new AdBannerVo();
			vo.setNo(no);
			vo.setName(name);
			vo.setImage(image);
			vo.setNick(nick);
			vo.setSouvenirName(souvenirName);
			
			voList.add(vo);
		}
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		return voList;
	}

}
