package com.kh.app.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.common.page.PageVo;
import com.kh.app.product.vo.RoomVo;


public class RoomDao {
	
	public List<RoomVo> getProductList(Connection conn, PageVo pv) throws Exception {
		// SQL
	    String sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM ( SELECT A.NO, A.LOCAL_NO, A.ACCOMODATION_NO, A.NAME, A.ENROLL_DATE, A.MAX_PEOPLE, A.CONTENT, A.DELETE_YN, A.PRICE, AI.TITLE, LC.NAME AS LOCAL FROM ACCOMODATION A JOIN ACCOMODATION_IMG AI ON AI.ACCOMODATION_NO = A.ACCOMODATION_NO JOIN LOCAL_CATEGORY LC ON LC.NO = A.LOCAL_NO WHERE A.DELETE_YN = 'N' AND LC.NAME LIKE '%%' ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, pv.getBeginRow());
	    pstmt.setInt(2, pv.getLastRow());
	    ResultSet rs = pstmt.executeQuery();
	    
	    // tx || rs
	    List<RoomVo> voList = new ArrayList<>();

	    while (rs.next()) {
	    	RoomVo vo = new RoomVo();
	    	
	        String no = rs.getString("NO");
	        String localNo = rs.getString("LOCAL_NO");
	        String accomodationNo = rs.getString("ACCOMODATION_NO");
	        String name = rs.getString("NAME");
	        String maxPeople = rs.getString("MAX_PEOPLE");
	        String enrollDate = rs.getString("ENROLL_DATE");
	        String content = rs.getString("CONTENT");
	        String deleteYn = rs.getString("DELETE_YN");
	        String price = rs.getString("PRICE");
	        String title = rs.getString("TITLE");

	        vo.setNo(no);
	        vo.setLocalNo(localNo);
	        vo.setAccomodationNo(accomodationNo);
	        vo.setName(name);
	        vo.setEnrollDate(enrollDate);
	        vo.setMaxPeople(maxPeople);
	        vo.setContent(content);
	        vo.setDeleteYn(deleteYn);
	        vo.setPrice(price);
	        vo.setTitle(title);;

	        voList.add(vo);
	       
	    }

	    JDBCTemplate.close(rs);
	    JDBCTemplate.close(pstmt);

	    // 결과가 없는 경우 예외 처리
	    if (voList.isEmpty()) {
	        throw new Exception("No data found");
	    }

	    return voList;
	}
	
	public int getProductListCnt(Connection conn, String searchType, String searchValue) throws Exception {
		//SQL
		String sql = "SELECT COUNT(*) FROM ( SELECT * FROM ACCOMODATION) WHERE DELETE_YN = 'N'";
		if("ACCOMODATION".equals(searchType)) {
			sql += "AND NAME LIKE '%" + searchValue + "%'";
		}else if("writer".equals(searchType)) {
			sql += "AND NICK LIKE '%" + searchValue + "%'";
		}else if("category".equals(searchType)) {
			sql += "AND CATEGORY_NO = " + searchValue;
		}
		
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		//tx || rs
		int cnt = 0;
		if(rs.next()) {
			cnt = rs.getInt(1);
		}
		
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		return cnt;
	}

	

	public List<RoomVo> getProductList(Connection conn, PageVo pv, String searchType, String searchValue, String local) throws Exception {
		String sql = "";
		
		if(searchType.equals("name")) {
			//SQL (제목	검색)
			sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM ( SELECT A.NO, A.LOCAL_NO, A.ACCOMODATION_NO, A.NAME, A.ENROLL_DATE, A.MAX_PEOPLE, A.CONTENT, A.DELETE_YN, A.PRICE, AI.TITLE, LC.NAME AS LOCAL FROM ACCOMODATION A JOIN ACCOMODATION_IMG AI ON AI.ACCOMODATION_NO = A.ACCOMODATION_NO JOIN LOCAL_CATEGORY LC ON LC.NO = A.LOCAL_NO WHERE A.DELETE_YN = 'N' AND A.NAME LIKE '%'||?||'%' AND LC.NAME LIKE '%%' ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		}else if(searchType.equals("price")) {
			//SQL (작성자	검색)
			sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM ( SELECT A.NO, A.LOCAL_NO, A.ACCOMODATION_NO, A.NAME, A.ENROLL_DATE, A.MAX_PEOPLE, A.CONTENT, A.DELETE_YN, A.PRICE, AI.TITLE, LC.NAME AS LOCAL FROM ACCOMODATION A JOIN ACCOMODATION_IMG AI ON AI.ACCOMODATION_NO = A.ACCOMODATION_NO JOIN LOCAL_CATEGORY LC ON LC.NO = A.LOCAL_NO WHERE A.DELETE_YN = 'N' AND A.NAME LIKE '%'||?||'%' AND LC.NAME LIKE '%%' ORDER BY TO_NUMBER(PRICE)  ) T ) WHERE RNUM BETWEEN ? AND ?";
		}else if(local.equals("gang")) {
			sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM ( SELECT A.NO, A.LOCAL_NO, A.ACCOMODATION_NO, A.NAME, A.ENROLL_DATE, A.MAX_PEOPLE, A.CONTENT, A.DELETE_YN, A.PRICE, AI.TITLE, LC.NAME AS LOCAL FROM ACCOMODATION A JOIN ACCOMODATION_IMG AI ON AI.ACCOMODATION_NO = A.ACCOMODATION_NO JOIN LOCAL_CATEGORY LC ON LC.NO = A.LOCAL_NO WHERE A.DELETE_YN = 'N' AND A.NAME LIKE '%'||?||'%' AND LC.NAME LIKE '%강원도%' ORDER BY NO DESC  ) T ) WHERE RNUM BETWEEN ? AND ?";
		}else {
			//값이 이상함 => 기본 목록 조회
			return getProductList(conn, pv);
		}
		System.out.println(local);
		System.out.println(searchType);
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString	(1, searchValue);
		pstmt.setInt	(2, pv.getBeginRow());
		pstmt.setInt	(3, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		//tx || rs
		List<RoomVo> voList = new ArrayList<>();
		while(rs.next()) {
			String no = rs.getString("NO");
			String localNo = rs.getString("LOCAL_NO");
			String accomodationNo = rs.getString("ACCOMODATION_NO");
			String name = rs.getString("NAME");
			String enrollDate = rs.getString("ENROLL_DATE");
			String maxPeople = rs.getString("MAX_PEOPLE");
			String content = rs.getString("CONTENT");
			String deleteYn = rs.getString("DELETE_YN");
			String price = rs.getString("PRICE");
			String title = rs.getString("TITLE");
			String lcName = rs.getString("LOCAL");
			
		
			RoomVo vo = new RoomVo();
			
			vo.setNo(no);
			vo.setLocalNo(localNo);
			vo.setAccomodationNo(accomodationNo);
			vo.setName(name);
			vo.setEnrollDate(enrollDate);
			vo.setMaxPeople(maxPeople);
			vo.setContent(content);
			vo.setDeleteYn(deleteYn);
			vo.setPrice(price);
			vo.setTitle(title);;
			vo.setLocal(lcName);
			
			
			voList.add(vo);
		}
		System.out.println(voList);
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		return voList;
	}
	

}
