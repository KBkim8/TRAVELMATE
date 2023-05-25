package com.kh.app.mypage.service;

import java.sql.Connection;
import java.util.List;

import com.kh.app.board.vo.BoardVo;
import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.common.page.PageVo;
import com.kh.app.mypage.dao.OrderListDao;
import com.kh.app.mypage.vo.OrderListVo;

public class OrderListService {

	OrderListDao dao = new OrderListDao();
	// 주문 내역 개수(회원번호로)
	public int getOrderListCntByNo(String mno) throws Exception {

		// conn
		Connection conn = JDBCTemplate.getConnection();
		
		int cnt = dao.getOrderListCntByNo(conn, mno);
		
		// close
		JDBCTemplate.close(conn);
		
		return cnt;
	}
	
	// 렌트카 주문내역 (회원번호로)
	public List<OrderListVo> getCarOrderListByNo(PageVo pv, String mno) throws Exception {

		// conn
		Connection conn = JDBCTemplate.getConnection();
		
		List<OrderListVo> cvoList = dao.getCarOrderListByNo(conn,pv,mno);
		
		
		// close
		JDBCTemplate.close(conn);
		
		
		return cvoList;
	}

	// 숙소 주문내역 
	public List<OrderListVo> getAccomodationOrderListByNo(PageVo pv, String mno) throws Exception {

		// conn
		Connection conn = JDBCTemplate.getConnection();
		
		List<OrderListVo> avoList = dao.getAccomodationOrderListByNo(conn,pv,mno);

		JDBCTemplate.close(conn);
		
		
		return null;
	}

	// 기념품 주문내역 조회
	public List<OrderListVo> getSouvenirOrderListByNo(PageVo pv, String mno) throws Exception {

		// conn
		Connection conn = JDBCTemplate.getConnection();
		
		List<OrderListVo> svoList = dao.getSouvenirOrderListByNo(conn,pv,mno);

		JDBCTemplate.close(conn);
		
		
		return null;
	}

	

}
