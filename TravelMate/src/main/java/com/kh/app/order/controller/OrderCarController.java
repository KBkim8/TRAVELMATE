package com.kh.app.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.product.service.CarService;
import com.kh.app.product.vo.CarVo;
import com.kh.app.product.vo.SouvenirVo;
@WebServlet("/order/car")
public class OrderCarController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/order/order_car.jsp").forward(req, resp);
	}
	
	//차량 예약 (car_reservation 테이블 insert )
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
			HttpSession session = req.getSession();
			CarVo cvo = (CarVo) session.getAttribute("cvo");
			MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		
			String daterange = req.getParameter("daterange");
			String[] dateArr= daterange.split(" - ");
			String startDate = dateArr[0];
			String endDate = dateArr[1];
			CarVo vo = new CarVo();
			vo.setStartDate(startDate);
			vo.setEndDate(endDate);
		
			//데꺼
			String carKindKind = req.getParameter("carKindKind");
			//데뭉
			
			//서비스
			CarService cs = new CarService();
			int result = 0;
			try {
				result = cs.order(carKindKind, loginMember, cvo);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//화면
			if(result == 1) {
				req.getRequestDispatcher("/WEB-INF/views/pay/pay_car.jsp").forward(req, resp);
			}else {
				req.setAttribute("errMsg", "order car error...");
				req.getRequestDispatcher("/WEB-INF/views/common/error-page.jsp").forward(req, resp);
			}


			
			
			
			
			
		
			
	}
	
}//class
