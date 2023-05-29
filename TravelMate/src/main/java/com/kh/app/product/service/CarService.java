package com.kh.app.product.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.common.page.PageVo;
import com.kh.app.member.vo.MemberVo;
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


	


	public static int order(String carKindKind, MemberVo loginMember, CarVo vo) throws Exception {
		
		CarDao dao = new CarDao();
		
		Connection conn = JDBCTemplate.getConnection();
	
		int result = dao.order(conn, carKindKind, loginMember , vo);
		
		JDBCTemplate.close(conn);
		
		return result;
	
	}


	public int pay(CarVo cvo) throws Exception {
		//가격 가져오기
		Connection conn = JDBCTemplate.getConnection();
		cvo = null;
		String sql = "SELECT PRICE FROM CAR_RESERVATION";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int price = rs.getInt("PRICE");
			//가격 가져와서 cvo에 넣기
			cvo = new CarVo();
			cvo.setPrice(price);
		}
			JDBCTemplate.close(rs);
			JDBCTemplate.close(conn);
		
		conn = JDBCTemplate.getConnection();
		
		int result = dao.pay(cvo, conn);
				
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	

}
