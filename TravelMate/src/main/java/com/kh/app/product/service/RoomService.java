package com.kh.app.product.service;

import java.sql.Connection;
import java.util.List;

import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.common.page.PageVo;
import com.kh.app.product.vo.RoomVo;
import com.kh.app.product.vo.SouvenirVo;
import com.kh.app.product.dao.RoomDao;

public class RoomService {
	
	private final RoomDao dao = new RoomDao();
	
	public int getProductListCnt(String searchType, String searchValue) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		int cnt = dao.getProductListCnt(conn , searchType , searchValue);
		
		//close
		JDBCTemplate.close(conn);
		
		return cnt;
	}


	public List<RoomVo> getProductList(PageVo pv) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		List<RoomVo> voList = dao.getProductList(conn , pv);
		
		//close
		JDBCTemplate.close(conn);
		
		return voList;
	}


	public List<RoomVo> getProductList(PageVo pv, String searchType, String searchValue, String local) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		List<RoomVo> voList = dao.getProductList(conn , pv , searchType, searchValue, local);
		
		//close
		JDBCTemplate.close(conn);
		
		return voList;
	}


	public RoomVo selectRoomOneByNo(String name) throws Exception {
		RoomVo vo = null;
		//conn
		try (Connection conn = JDBCTemplate.getConnection();){
			vo = dao.selectSouvenirOneByNo(conn , name);
		}
		return vo;
	}

}
