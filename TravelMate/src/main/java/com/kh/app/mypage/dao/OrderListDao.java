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
		String sql = "";
		
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

	// 주문 내역 조회 (회원번호로)
	public List<OrderListVo> getMyBoardListByNo(Connection conn, PageVo pv, String mno) throws Exception {

		// SQL 문 다시 수정
		// sql
		String sql = "SELECT * FROM ( SELECT ROWNUM RNUM, T.* FROM ( SELECT OP.NO, OP.MEMBER_NO, OP.TOTAL, OP.ENROLL_DATE, OL.SOUVENIR_NO, OL.CAR_NO ,OL.ACCOMODATION_NO FROM ORDER_PRODUCT OP JOIN ORDER_LIST OL ON OL.ORDER_PRODUCT_NO = OP.NO WHERE OP.PAY_YN = 'Y' AND OP.MEMBER_NO =8 AND OP.NO=1 ORDER BY OP.NO DESC ) T ) WHERE RNUM BETWEEN 1 AND 2;";
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
