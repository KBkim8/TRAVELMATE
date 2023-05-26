package com.kh.app.product.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.common.page.PageVo;
import com.kh.app.product.vo.CarVo;
import com.kh.app.product.vo.RoomVo;
import com.kh.app.product.vo.SouvenirVo;
import com.kh.app.product.dao.CarDao;
import com.kh.app.product.dao.RoomDao;

public class CarService {
	
	private final CarDao dao = new CarDao();
	
	public int getCarListCnt(String searchType, String searchValue) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		int cnt = dao.getCarListCnt(conn , searchType , searchValue);
		
		//close
		JDBCTemplate.close(conn);
		
		return cnt;
	}


	public List<CarVo> getCarList(PageVo pv) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		List<CarVo> voList = dao.getCarList(conn , pv);
		
		//close
		JDBCTemplate.close(conn);
		
		return voList;
	}


	public List<CarVo> getCarList(PageVo pv, String searchType, String searchValue, String local) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		List<CarVo> voList = dao.getCarList(conn , pv , searchType, searchValue, local);
		
		//close
		JDBCTemplate.close(conn);
		
		return voList;
	}


	public CarVo selectCarOneByName(String name) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		CarVo vo = dao.selectCarOneByName(conn, name);
		JDBCTemplate.close(conn);
		
		return vo;
	
	}
	
}
