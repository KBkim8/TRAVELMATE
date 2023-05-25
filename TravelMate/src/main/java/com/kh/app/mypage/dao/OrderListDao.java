package com.kh.app.mypage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.app.board.vo.BoardVo;
import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.common.page.PageVo;
import com.kh.app.mypage.vo.OrderListVo;

public class OrderListDao {

	// 주문내역 개수 (회원번호로)
	public int getOrderListCntByNo(Connection conn, String mno) throws Exception {

		// SQL
		String sql = "SELECT SUM(T.cnt) FROM ( SELECT COUNT(*) AS cnt FROM ( SELECT CP.NO, CP.TYPE, CP.PAY_DATE, CR.RENTCAR_NO, CR.PRICE, CR.MEMBER_NO FROM CAR_PAYMENT CP JOIN CAR_RESERVATION CR ON (CP.CAR_RESERVATION_CODE = CR.NO) WHERE CP.CANCEL_YN = 'N' AND CR.MEMBER_NO = ? ) car_payments UNION ALL SELECT COUNT(*) AS cnt FROM ( SELECT AP.NO, AP.TYPE, AP.PAY_DATE, AR.ACCOMODATION_NO, AR.PRICE, AR.MEMBER_NO FROM ACCOMODATION_PAYMENT AP JOIN ACCOMODATION_RESERVATION AR ON (AP.ACCOMODATION_RESERVATION_CODE = AR.NO) WHERE AP.CANCEL_YN = 'N' AND AR.MEMBER_NO = ? ) accomodation_payments UNION ALL SELECT COUNT(*) AS cnt FROM ( SELECT SP.NO, SP.TYPE, SP.PAY_DATE, SR.SOUVENIR_NO, SR.PRICE, SR.MEMBER_NO FROM SOUVENIR_PAYMENT SP JOIN SOUVENIR_RESERVATION SR ON (SP.SOUVENIR_RESERVATION_CODE = SR.NO) WHERE SP.CANCEL_YN = 'N' AND SR.MEMBER_NO = ? ) souvenir_payments ) T";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mno);
		pstmt.setString(2, mno);
		pstmt.setString(3, mno);
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

	// 렌트카 주문내역 조회(회원번호로)
	public List<OrderListVo> getCarOrderListByNo(Connection conn, PageVo pv, String mno) throws Exception {

		// SQL
		String sql = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT CP.NO, CP.TYPE, CP.PAY_DATE, CR.RENTCAR_NO, CR.PRICE, CR.MEMBER_NO, CR.START_DATE, CR.END_DATE, CI.TITLE, CK.KIND FROM CAR_PAYMENT CP JOIN CAR_RESERVATION CR ON (CP.CAR_RESERVATION_CODE = CR.NO) JOIN RENTCAR R ON (R.NO = CR.RENTCAR_NO) JOIN CAR_IMG CI ON (CI.RENTCAR_NO = CR.RENTCAR_NO) JOIN CAR_KIND CK ON (CK.NO = R.CAR_KIND_NO) WHERE CP.CANCEL_YN = 'N' AND CR.MEMBER_NO = ?)T ) WHERE RNUM BETWEEN ? AND ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mno);
		pstmt.setInt(2, pv.getBeginRow());
		pstmt.setInt(3, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		// tx || rs
		List<OrderListVo> cvoList = new ArrayList<>();
		while(rs.next()) {
			String no = rs.getString("NO");
			String payType = rs.getString("TYPE");
			String payDate = rs.getString("PAY_DATE");
			String price = rs.getString("PRICE");
			String startDate = rs.getString("START_DATE");
			String endDate = rs.getString("END_DATE");
			String carImg = rs.getString("TITLE");
			String carKind = rs.getString("KIND");
			
			OrderListVo vo = new OrderListVo();
			vo.setCarPayNo(no);
			vo.setCarPayType(payType);
			vo.setCarPayDate(payDate);
			vo.setCarPrice(price);
			vo.setCarStartDate(startDate);
			vo.setCarEndDate(endDate);
			vo.setCarName(carKind);
			vo.setCarImg(carImg);
			
			cvoList.add(vo);
			
		}
		JDBCTemplate.close(pstmt);
		JDBCTemplate.close(rs);

		return cvoList;
	}

	// 숙소 주문내역 조회
	public List<OrderListVo> getAccomodationOrderListByNo(Connection conn, PageVo pv, String mno) throws Exception {

		// SQL
		String sql = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT AP.NO, AP.TYPE, AP.PAY_DATE, AR.ACCOMODATION_NO, AR.PRICE, AR.MEMBER_NO, AR.START_DATE, AR.END_DATE, AI.TITLE, A.NAME FROM ACCOMODATION_PAYMENT AP JOIN ACCOMODATION_RESERVATION AR ON (AP.ACCOMODATION_RESERVATION_CODE = AR.NO) JOIN ACCOMODATION A ON (A.NO = AR.ACCOMODATION_NO) JOIN ACCOMODATION_IMG AI ON (AI.ACCOMODATION_NO = AR.ACCOMODATION_NO) WHERE AP.CANCEL_YN = 'N' AND AR.MEMBER_NO = ?)T ) WHERE RNUM BETWEEN ? AND ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mno);
		pstmt.setInt(2, pv.getBeginRow());
		pstmt.setInt(3, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		// tx || rs
		List<OrderListVo> avoList = new ArrayList<>();
		while(rs.next()) {
			String no = rs.getString("NO");
			String payType = rs.getString("TYPE");
			String payDate = rs.getString("PAY_DATE");
			String price = rs.getString("PRICE");
			String startDate = rs.getString("START_DATE");
			String endDate = rs.getString("END_DATE");
			String accomodationImg = rs.getString("TITLE");
			String accomodationName = rs.getString("NAME");
			
			OrderListVo vo = new OrderListVo();
			vo.setAccomodationPayNo(no);
			vo.setAccomodationPayType(payType);
			vo.setAccomodationPayDate(payDate);
			vo.setAccomodationPrice(price);
			vo.setAccomodationStartDate(startDate);
			vo.setAccomodationEndDate(endDate);
			vo.setAccomodationImg(accomodationImg);
			vo.setAccomodationName(accomodationName);
			
			avoList.add(vo);
			
		}
		JDBCTemplate.close(pstmt);
		JDBCTemplate.close(rs);

		return avoList;
		
	}

	// 기념품 주문내역 조회
	public List<OrderListVo> getSouvenirOrderListByNo(Connection conn, PageVo pv, String mno) throws Exception {
		
		// SQL
		String sql = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT SP.NO, SP.TYPE, SP.PAY_DATE, SR.SOUVENIR_NO, SR.PRICE, SR.MEMBER_NO, SR.ADDRESS, SR.NAME, SR.CNT ,SI.TITLE, S.NAME AS SOUVENIR_NAME FROM SOUVENIR_PAYMENT SP JOIN SOUVENIR_RESERVATION SR ON (SP.SOUVENIR_RESERVATION_CODE = SR.NO) JOIN SOUVENIR S ON (S.NO = SR.SOUVENIR_NO) JOIN SOUVENIR_IMG SI ON (SI.SOUVENIR_NO = SR.SOUVENIR_NO) WHERE SP.CANCEL_YN = 'N' AND SR.MEMBER_NO = ?) T ) WHERE RNUM BETWEEN ? AND ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mno);
		pstmt.setInt(2, pv.getBeginRow());
		pstmt.setInt(3, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		// tx || rs
		List<OrderListVo> svoList = new ArrayList<>();
		while(rs.next()) {
			String no = rs.getString("NO");
			String payType = rs.getString("TYPE");
			String payDate = rs.getString("PAY_DATE");
			String price = rs.getString("PRICE");
			String address = rs.getString("ADDRESS");
			String orderName = rs.getString("NAME");
			String cnt = rs.getString("CNT");
			String souvenirImg = rs.getString("TITLE");
			String souvenirName = rs.getString("SOUVENIR_NAME");
			
			OrderListVo vo = new OrderListVo();
			vo.setSouvenirPayNo(no);
			vo.setSouvenirPayType(payType);
			vo.setSouvenirnPayDate(payDate);
			vo.setSouvenirPrice(price);
			vo.setSouvenirAddress(address);
			vo.setSouvenirOderName(orderName);
			vo.setSouvenirCnt(cnt);
			vo.setSouvenirImg(souvenirImg);
			vo.setSouvenirName(souvenirName);
			
			svoList.add(vo);
			
		}
		JDBCTemplate.close(pstmt);
		JDBCTemplate.close(rs);

		return svoList;
		
	}
	
	
	

}
