package com.kh.app.paycancel.controller;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.paycancel.dao.CarPayCancelDao;
import com.kh.app.paycancel.vo.PayCancelVo;
import com.kh.app.product.vo.CarVo;

@WebServlet("/car/refund")
public class CarRefundController extends HttpServlet{

	//결제취소화면
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/WEB-INF/views/paycancel/car_refund.jsp").forward(req, resp);
	
	}

	//결제취소
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		//마이페이지>주문내역 > 환불하기 > 환불컨트롤러 > 환불화면 > 환불진행(결제 테이블 yn 업데이트 / 취소사유 테이블 인서트)
		
		Connection conn = null;
		Connection conn2 = null;
		try {
			
			//payment table cancelyn column 'Y' update
			String payNo = req.getParameter("payNo");
			
			conn = JDBCTemplate.getConnection();
			
			CarPayCancelDao pcdao = new CarPayCancelDao();
			
			int result = pcdao.carPaymentUpdate(conn, payNo);
					
			
			
			//paycancelreason insert
			String carPaymentNo = req.getParameter("payNo");
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			
			PayCancelVo pcvo = new PayCancelVo();
			pcvo.setCarPaymentNo(carPaymentNo);
			pcvo.setTitle(title);
			pcvo.setContent(content);
			
			conn2 = JDBCTemplate.getConnection();
			
			pcdao = new CarPayCancelDao();
			
			int result2 = pcdao.carPayCancelReason(conn2, pcvo);
		
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(conn);
			JDBCTemplate.close(conn2);			
		}
		
	}



}


