package com.kh.app.product.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.common.page.PageVo;
import com.kh.app.product.dao.SouvenirDao;
import com.kh.app.product.vo.SouvenirVo;

public class SouvenirService {
	
	private final SouvenirDao dao = new SouvenirDao();
	
	public int getSouvenirListCnt(String searchType, String searchValue) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		int cnt = dao.getSouvenirListCnt(conn , searchType , searchValue);
		
		//close
		JDBCTemplate.close(conn);
		
		return cnt;
	}


	public List<SouvenirVo> getSouvenirList(PageVo pv) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		List<SouvenirVo> voList = dao.getSouvenirList(conn , pv);
		
		//close
		JDBCTemplate.close(conn);
		
		return voList;
	}


	public List<SouvenirVo> getSouvenirList(PageVo pv, String searchType, String searchValue, String local) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		List<SouvenirVo> voList = dao.getSouvenirList(conn , pv , searchType, searchValue, local);
		
		//close
		JDBCTemplate.close(conn);
		
		return voList;
	}


	//기념품 상세페이지
	public SouvenirVo selectSouvenirOneByNo(String name) throws Exception {
		SouvenirVo vo = null;
		//conn
		try (Connection conn = JDBCTemplate.getConnection();){
			vo = dao.selectSouvenirOneByNo(conn , name);
		}
		return vo;
	}


	public int order(SouvenirVo vo) throws Exception {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = dao.order(vo, conn);
		if(result == 1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		
		JDBCTemplate.close(conn);
		
		
		return result;
	}


	public SouvenirVo selectOrder(String no) throws Exception {
		SouvenirVo vo = null;
		//conn
		try (Connection conn = JDBCTemplate.getConnection();){
			vo = dao.selectOrder(conn , no);
		}
		return vo;
	}




}
