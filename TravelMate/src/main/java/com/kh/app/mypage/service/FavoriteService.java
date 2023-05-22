package com.kh.app.mypage.service;

import java.sql.Connection;
import java.util.List;

import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.common.page.PageVo;
import com.kh.app.mypage.dao.FavoriteDao;
import com.kh.app.mypage.dao.OrderListDao;
import com.kh.app.mypage.vo.FavoriteVo;
import com.kh.app.mypage.vo.OrderListVo;

public class FavoriteService {

	FavoriteDao dao = null;
	// 관심상품 조회 개수(회원별)
	public int getFavListCntByNo(String mno) throws Exception {
		
		// conn
		Connection conn = JDBCTemplate.getConnection();
		
		int cnt = dao.getFavListCntByNo(conn, mno);
		
		// tx || rs
		
		// close
		JDBCTemplate.close(conn);
		
		return cnt;
		
	}
	

	// 관심상품 조회
	public List<FavoriteVo> getFavListByNo(PageVo pv, String mno) {

		// conn
		Connection conn = JDBCTemplate.getConnection();
		
		List<OrderListVo> voList = dao.getFavListByNo(conn,pv,mno);
		
		// close
		JDBCTemplate.close(conn);
		
		return voList;
	}

}
