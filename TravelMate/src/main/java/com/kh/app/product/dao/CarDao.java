package com.kh.app.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.common.page.PageVo;
import com.kh.app.product.vo.CarVo;
import com.kh.app.product.vo.RoomVo;


public class CarDao {
	
	//차량 검색 결과 가져오기
	public int getCarListCnt(Connection conn, String searchType, String searchValue) throws Exception {
		//SQL -수정완료
				String sql = "SELECT COUNT(*) FROM ( SELECT * FROM RENTCAR) WHERE DELETE_YN = 'N'";
				if("RENTCAR".equals(searchType)) {
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


	//차량 전체 목록 가져오기
	public List<CarVo> getCarList(Connection conn, PageVo pv) throws Exception {

		// SQL -수정완료
	    String sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM ( SELECT CK.KIND , R.NO, R.CAR_KIND_NO, R.LOCAL_NO, R.COUNT, R.ENROLL_DATE, R.DELETE_YN, R.MAX, R.LICENSE_PLATE, R.LICENSE_DATE, R.PRICE, CI.TITLE, LC.NAME AS LOCAL FROM RENTCAR R JOIN CAR_IMG CI ON CI.RENTCAR_NO = R.NO JOIN LOCAL_CATEGORY LC ON LC.NO = R.LOCAL_NO JOIN CAR_KIND CK ON CK.NO = R.CAR_KIND_NO WHERE R.DELETE_YN = 'N' AND LC.NAME LIKE '%%' ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
	    PreparedStatement pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, pv.getBeginRow());
	    pstmt.setInt(2, pv.getLastRow());
	    ResultSet rs = pstmt.executeQuery();

	    // tx || rs
	    List<CarVo> voList = new ArrayList<>();

	    while (rs.next()) {
	    	CarVo vo = new CarVo();

	    	String carKindKind = rs.getString("KIND");
	    	String title = rs.getString("TITLE");
	    	String no = rs.getString("NO");
	    	String carKindNo = rs.getString("CAR_KIND_NO");
	    	String localNo = rs.getString("LOCAL_NO");
	    	String count = rs.getString("COUNT");
	    	String enrollDate = rs.getString("ENROLL_DATE");
	    	String deleteYn = rs.getString("DELETE_YN");
	    	String max = rs.getString("MAX");
	    	String licensePlate = rs.getString("LICENSE_PLATE");
	    	String licenseDate = rs.getString("LICENSE_DATE");
	    	String local = rs.getString("LOCAL");
	    	String price = rs.getString("PRICE");



	    	vo.setLocal(local);
	        vo.setNo(no);
	        vo.setCarKindNo(carKindNo);
	        vo.setCount(count);
	        vo.setEnrollDate(enrollDate);
	        vo.setDeleteYn(deleteYn);
	        vo.setMax(max);
	        vo.setLicensePlate(licensePlate);
	        vo.setLicenseDate(licenseDate);
	        vo.setPrice(price);
	        vo.setCarname(carKindKind);
	        vo.setTitle(title);
	        vo.setLocalNo(localNo);
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

	public List<CarVo> getCarList(Connection conn, PageVo pv, String searchType, String searchValue, String local) throws Exception {

		String sql = "";

		if(searchType.equals("name")) {
			//SQL (차량이름으로 검색) -수정완료
			sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM ( SELECT R.NO, R.CAR_KIND_NO, R.LOCAL_NO, R.COUNT, R.ENROLL_DATE, R.DELETE_YN, R.MAX, R.LICENSE_PLATE, R.LICENSE_DATE, R.WEEKDAY_PRICE, R.WEEKEND_PRICE , CI.TITLE, LC.NAME AS LOCAL FROM RENTCAR R JOIN CAR_IMG CI ON CI.RENTCAR_NO = R.NO JOIN LOCAL_CATEGORY LC ON LC.NO = R.LOCAL_NO JOIN CAR_KIND CK ON CK.NO = R.CAR_KIND_NO WHERE R.DELETE_YN = 'N' AND CK.KIND LIKE '%'||?||'%' AND LC.NAME LIKE '%%' ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		}else if(searchType.equals("carTypeType")) {
			//SQL (차량크기로 검색) -수정완료
			sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM ( SELECT R.NO, R.CAR_KIND_NO, R.LOCAL_NO, R.COUNT, R.ENROLL_DATE, R.DELETE_YN, R.MAX, R.LICENSE_PLATE, R.LICENSE_DATE, R.PRICE , CI.TITLE, LC.NAME AS LOCAL , 'CK.SIZE' FROM RENTCAR R JOIN CAR_IMG CI ON CI.RENTCAR_NO = R.NO JOIN LOCAL_CATEGORY LC ON LC.NO = R.LOCAL_NO JOIN CAR_KIND CK ON CK.NO = R.CAR_KIND_NO WHERE R.DELETE_YN = 'N' AND 'CK.SIZE' LIKE '%'||'?'||'%'  AND "
					+ ""
					+ ".NAME LIKE '%%' ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		}else if(searchType.equals("price")) {
			//SQL (가격으로 검색) - 수정완료
			sql = "SELECT * FROM RENTCAR WHERE DELETE_YN = 'N' AND PRICE BETWEEN 0 AND ?";
		}else if(local.equals("gang")) {
			//SQL (지역으로 검색) - 수정완료
			sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM ( SELECT R.NO, R.CAR_KIND_NO, R.LOCAL_NO, R.COUNT, R.PRICE, R.ENROLL_DATE, R.DELETE_YN, R.MAX, R.LICENSE_PLATE, R.LICENSE_DATE, LC.NAME AS LOCAL FROM RENTCAR R JOIN CAR_IMG CI ON CI.RENTCAR_NO = R.NO JOIN LOCAL_CATEGORY LC ON LC.NO = R.LOCAL_NO WHERE R.DELETE_YN = 'N' AND R.NAME LIKE '%%' AND LC.NAME LIKE '%강원도%' ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		}else if(local.equals("chung")) {
			sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM ( SELECT R.NO, R.CAR_KIND_NO, R.LOCAL_NO, R.COUNT, R.PRICE, R.ENROLL_DATE, R.DELETE_YN, R.MAX, R.LICENSE_PLATE, R.LICENSE_DATE, LC.NAME AS LOCAL FROM RENTCAR R JOIN CAR_IMG CI ON CI.RENTCAR_NO = R.NO JOIN LOCAL_CATEGORY LC ON LC.NO = R.LOCAL_NO WHERE R.DELETE_YN = 'N' AND R.NAME LIKE '%%' AND LC.NAME LIKE '%충청남/북도%' ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		}else if(local.equals("kung")) {
			sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM ( SELECT R.NO, R.CAR_KIND_NO, R.LOCAL_NO, R.COUNT, R.PRICE, R.ENROLL_DATE, R.DELETE_YN, R.MAX, R.LICENSE_PLATE, R.LICENSE_DATE, LC.NAME AS LOCAL FROM RENTCAR R JOIN CAR_IMG CI ON CI.RENTCAR_NO = R.NO JOIN LOCAL_CATEGORY LC ON LC.NO = R.LOCAL_NO WHERE R.DELETE_YN = 'N' AND R.NAME LIKE '%%' AND LC.NAME LIKE '%경상남/북도%' ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		}else if(local.equals("jun")) {
			sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM ( SELECT R.NO, R.CAR_KIND_NO, R.LOCAL_NO, R.COUNT, R.PRICE, R.ENROLL_DATE, R.DELETE_YN, R.MAX, R.LICENSE_PLATE, R.LICENSE_DATE, LC.NAME AS LOCAL FROM RENTCAR R JOIN CAR_IMG CI ON CI.RENTCAR_NO = R.NO JOIN LOCAL_CATEGORY LC ON LC.NO = R.LOCAL_NO WHERE R.DELETE_YN = 'N' AND R.NAME LIKE '%%' AND LC.NAME LIKE '%전라남/북도%' ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		}else if(local.equals("dae")) {
			sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM ( SELECT R.NO, R.CAR_KIND_NO, R.LOCAL_NO, R.COUNT, R.PRICE, R.ENROLL_DATE, R.DELETE_YN, R.MAX, R.LICENSE_PLATE, R.LICENSE_DATE, LC.NAME AS LOCAL FROM RENTCAR R JOIN CAR_IMG CI ON CI.RENTCAR_NO = R.NO JOIN LOCAL_CATEGORY LC ON LC.NO = R.LOCAL_NO WHERE R.DELETE_YN = 'N' AND R.NAME LIKE '%%' AND LC.NAME LIKE '%대전%' ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		}else if(local.equals("ull")) {
			sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM ( SELECT R.NO, R.CAR_KIND_NO, R.LOCAL_NO, R.COUNT, R.PRICE, R.ENROLL_DATE, R.DELETE_YN, R.MAX, R.LICENSE_PLATE, R.LICENSE_DATE, LC.NAME AS LOCAL FROM RENTCAR R JOIN CAR_IMG CI ON CI.RENTCAR_NO = R.NO JOIN LOCAL_CATEGORY LC ON LC.NO = R.LOCAL_NO WHERE R.DELETE_YN = 'N' AND R.NAME LIKE '%%' AND LC.NAME LIKE '%울산%' ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		}else if(local.equals("daegu")) {
			sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM ( SELECT R.NO, R.CAR_KIND_NO, R.LOCAL_NO, R.COUNT, R.PRICE, R.ENROLL_DATE, R.DELETE_YN, R.MAX, R.LICENSE_PLATE, R.LICENSE_DATE, LC.NAME AS LOCAL FROM RENTCAR R JOIN CAR_IMG CI ON CI.RENTCAR_NO = R.NO JOIN LOCAL_CATEGORY LC ON LC.NO = R.LOCAL_NO WHERE R.DELETE_YN = 'N' AND R.NAME LIKE '%%' AND LC.NAME LIKE '%대구%' ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		}else if(local.equals("gwang")) {
			sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM ( SELECT R.NO, R.CAR_KIND_NO, R.LOCAL_NO, R.COUNT, R.PRICE, R.ENROLL_DATE, R.DELETE_YN, R.MAX, R.LICENSE_PLATE, R.LICENSE_DATE, LC.NAME AS LOCAL FROM RENTCAR R JOIN CAR_IMG CI ON CI.RENTCAR_NO = R.NO JOIN LOCAL_CATEGORY LC ON LC.NO = R.LOCAL_NO WHERE R.DELETE_YN = 'N' AND R.NAME LIKE '%%' AND LC.NAME LIKE '%광주%' ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		}else if(local.equals("bu")) {
			sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM ( SELECT R.NO, R.CAR_KIND_NO, R.LOCAL_NO, R.COUNT, R.PRICE, R.ENROLL_DATE, R.DELETE_YN, R.MAX, R.LICENSE_PLATE, R.LICENSE_DATE, LC.NAME AS LOCAL FROM RENTCAR R JOIN CAR_IMG CI ON CI.RENTCAR_NO = R.NO JOIN LOCAL_CATEGORY LC ON LC.NO = R.LOCAL_NO WHERE R.DELETE_YN = 'N' AND R.NAME LIKE '%%' AND LC.NAME LIKE '%부산%' ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		}else if(local.equals("je")) {
			sql = "SELECT * FROM ( SELECT ROWNUM RNUM , T.* FROM ( SELECT R.NO, R.CAR_KIND_NO, R.LOCAL_NO, R.COUNT, R.PRICE, R.ENROLL_DATE, R.DELETE_YN, R.MAX, R.LICENSE_PLATE, R.LICENSE_DATE, LC.NAME AS LOCAL FROM RENTCAR R JOIN CAR_IMG CI ON CI.RENTCAR_NO = R.NO JOIN LOCAL_CATEGORY LC ON LC.NO = R.LOCAL_NO WHERE R.DELETE_YN = 'N' AND R.NAME LIKE '%%' AND LC.NAME LIKE '%제주도%' ORDER BY NO DESC ) T ) WHERE RNUM BETWEEN ? AND ?";
		}else {
			//값이 이상함 => 기본 목록 조회
			return getCarList(conn, pv);
		}

		System.out.println(local);
		System.out.println(searchType);
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString	(1, searchValue);
		pstmt.setInt	(2, pv.getBeginRow());
		pstmt.setInt	(3, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();

		//tx || rs
		List<CarVo> voList = new ArrayList<>();
		while(rs.next()) {
			String no = rs.getString("NO");
	    	String carKindNo = rs.getString("CAR_KIND_NO");
	    	String localNo = rs.getString("LOCAL_NO");
	    	String count = rs.getString("COUNT");
	    	String enrollDate = rs.getString("ENROLL_DATE");
	    	String deleteYn = rs.getString("DELETE_YN");
	    	String max = rs.getString("MAX");
	    	String licensePlate = rs.getString("LICENSE_PLATE");
	    	String licenseDate = rs.getString("LICENSE_DATE");
	    	String price = rs.getString("PRICE");



			CarVo vo = new CarVo();

			vo.setNo(no);
	        vo.setCarKindNo(carKindNo);
	        vo.setLocal(localNo);
	        vo.setCount(count);
	        vo.setEnrollDate(enrollDate);
	        vo.setDeleteYn(deleteYn);
	        vo.setMax(max);
	        vo.setLicensePlate(licensePlate);
	        vo.setLicenseDate(licenseDate);
	        vo.setPrice(price);



			voList.add(vo);
		}
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);

		return voList;
	}


	//
	public int paying(Connection conn, CarVo vo) {
		
		
		
		
		
		return 0;
	}


	public CarVo selectCarOneByName(Connection conn, String name) throws Exception {
		//SQL
		String sql = "SELECT C.NO, C.CAR_KIND_NO , C.COUNT , C.ENROLL_DATE , C.DELETE_YN , C.MAX , C.LICENSE_PLATE , C.LICENSE_DATE , C.PRICE , LC.NAME AS LOCAL , CK.KIND AS CARNAME FROM RENTCAR C JOIN CAR_IMG CI ON CI.RENTCAR_NO = C.NO JOIN LOCAL_CATEGORY LC ON LC.NO = C.LOCAL_NO JOIN CAR_KIND CK ON CK.NO = C.CAR_KIND_NO WHERE C.DELETE_YN = 'N' AND CK.KIND = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		ResultSet rs = pstmt.executeQuery();
		//tx || rs
		CarVo vo = null;
		
		while(rs.next()) {
			vo = new CarVo();
		
			String no = rs.getString("NO");
	        String carKindNo = rs.getString("CAR_KIND_NO");
	        String count = rs.getString("COUNT");
	        String enrollDate = rs.getString("ENROLL_DATE");
	        String deleteYn = rs.getString("DELETE_YN");
	        String max = rs.getString("MAX");
	        String licensePlate = rs.getString("LICENSE_PLATE");
	        String licenseDate = rs.getString("LICENSE_DATE");
	        String price = rs.getString("PRICE");
	        String local = rs.getString("LOCAL");
	        String carname = rs.getString("CARNAME");
			
	        vo.setNo(no);
	        vo.setCarKindNo(carKindNo);
	        vo.setCount(count);
	        vo.setEnrollDate(enrollDate);
	        vo.setDeleteYn(deleteYn);
	        vo.setMax(max);
	        vo.setLicensePlate(licensePlate);
	        vo.setLicenseDate(licenseDate);
	        vo.setPrice(price);
	        vo.setLocal(local);
	        vo.setCarname(carname);
			
	        
		}
				
		//close
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		return vo;
	
	}

	

}
