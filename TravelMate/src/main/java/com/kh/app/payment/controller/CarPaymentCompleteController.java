package com.kh.app.payment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.app.product.service.CarService;
import com.kh.app.product.service.RoomService;
import com.kh.app.product.vo.RoomVo;
@WebServlet("/car/payment/complete")
public class CarPaymentCompleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String reservationno = req.getParameter("reservationno");
			System.out.println(reservationno);
			CarService cs = new CarService();
			int result = cs.carPayment(reservationno);
			if(result == 1) {
				resp.sendRedirect(req.getContextPath()+"/car/list");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
	
	}
}
