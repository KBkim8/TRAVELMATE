package com.kh.app.pay.controller;

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
import com.kh.app.product.service.CarService;
import com.kh.app.product.vo.CarVo;
@WebServlet("/pay/car")
public class PayCarController extends HttpServlet{

	//차량 결제 화면
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/pay/pay_car.jsp").forward(req, resp);
	}
	
	//차량 결제 (car_payment 테이블 insert )
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

try {
			
			HttpSession session = req.getSession();
			CarVo cvo = (CarVo) session.getAttribute("cvo");
			
			//데꺼
			String carReservationCode = req.getParameter("carReservationCode");
			String type = req.getParameter("type");
			
			//데뭉
			cvo = new CarVo();
			cvo.setCarReservationCode(carReservationCode);
			cvo.setType(type);
					

			CarService cs = new CarService();
			int result = cs.pay(cvo);
			
			
			//서비스
			
			//화면
			if(result == 1) {
				req.getSession().setAttribute("alertMsg", "결제 완료!");
				req.getSession().setAttribute("cvo", cvo);
				resp.sendRedirect(req.getContextPath() + "/마이페이지/주문내역조회");
			}else {
				throw new Exception();
			}
			
		}catch(Exception e) {
			System.out.println("[ERROR] pay car errrr...");
			e.printStackTrace();
			
			req.setAttribute("errorMsg", "pay car fail...");
			req.getRequestDispatcher("/WEB-INF/views/common/error-page.jsp").forward(req, resp);
		}
		
	}
	
	
}
