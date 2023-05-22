package com.kh.app.mypage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.common.page.PageVo;
import com.kh.app.mypage.vo.OrderListVo;

public class FavoriteDao {

	// 관심상품 개수 조회
	public int getFavListCntByNo(Connection conn, String mno) throws Exception {

		// SQL
		String sql = "SELECT COUNT(*) FROM ( SELECT F.NO ,F.MEMBER_NO ,F.CAR_NO ,F.ACCOMODATION_NO ,F.SOUVENIR_RESERVATION_NO ,F.DEL_YN FROM FAVORITES F JOIN MEMBER M ON (F.MEMBER_NO = M.NO)) WHERE DEL_YN = 'N' AND MEMBER_NO=?";
		
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

	// 관심상품 조회
	public List<OrderListVo> getFavListByNo(Connection conn, PageVo pv, String mno) throws Exception {

	
		// sql
		String sql = "";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, mno);
		pstmt.setInt(2, pv.getBeginRow());
		pstmt.setInt(3, pv.getLastRow());
		ResultSet rs = pstmt.executeQuery();
		
		// tx || rs
		List<OrderListVo> voList = new ArrayList<>();
		while(rs.next()) {
			String no = rs.getString("NO");
			String orderProductNo = rs.getString("ORDER_PRODUCT_NO");
			String accomodationNo = rs.getString("ACCOMODATION_NO");
			String carNo = rs.getString("CAR_NO");
			String souvenirNo = rs.getString("SOUVENIR_NO");
			String souvenirName = rs.getString("SOUVENIR_NAME");
			String carKink = rs.getString("CAR_KIND");
			String accomodationName = rs.getString("ACCOMODATION_NAME");
			String souvenirCnt = rs.getString("SOUVENIR_CNT");
			String orderTotal = rs.getString("ORDER_TOTAL");
			String orderProductDate = rs.getString("ORDER_PRODUCT_DATE");
	
			OrderListVo vo = new OrderListVo();
			vo.setNo(no);
			vo.setOrderProductNo(orderProductNo);
			vo.setAccomodationNo(accomodationNo);
			vo.setCarNo(carNo);
			vo.setSouvenirNo(souvenirNo);
			vo.setSouvenirName(souvenirName);
			vo.setCarKind(carKink);
			vo.setAccomodationName(accomodationName);
			vo.setSouvenirCnt(souvenirCnt);
			vo.setOrderTotal(orderTotal);
			vo.setOrderProductDate(orderProductDate);
			
			voList.add(vo);
		}
		
		JDBCTemplate.close(rs);
		JDBCTemplate.close(pstmt);
		
		return voList;

	
	}

}
