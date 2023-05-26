package com.kh.app.product.service;

import java.sql.Connection;
import java.util.List;

import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.common.page.PageVo;
import com.kh.app.product.vo.CarVo;
import com.kh.app.product.vo.RoomVo;
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


	public CarVo edit(CarVo vo) {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		CarVo updatedCar = null;
		try {
			//SQL
			int result = dao.edit(conn , vo);
			
			//tx || rs
			if(result == 1) {
				updatedCar = dao.selectOneByNo(conn , vo.getNo());
				if(updatedCar == null) {
					throw new Exception();
				}
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			
		}finally {
			//close
			JDBCTemplate.close(conn);
		}
		
		return updatedCar;
	
	}
	
	

}
