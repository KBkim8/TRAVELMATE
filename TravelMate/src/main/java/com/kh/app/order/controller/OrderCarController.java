package com.kh.app.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.app.product.service.CarService;
import com.kh.app.product.vo.CarVo;
import com.kh.app.product.vo.SouvenirVo;
@WebServlet("/order/car")
public class OrderCarController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//데꺼
			String name = req.getParameter("name");
			//데뭉
			
			//서비스
			CarService cs = new CarService();
			CarVo vo = cs.selectCarOneByName(name);
			
			//화면
			if(vo != null) {
				req.setAttribute("vo", vo);
				System.out.println(vo.getCarname());
				req.getRequestDispatcher("/WEB-INF/views/order/order_car.jsp").forward(req, resp);
			}else { 
				System.out.println("vo가널인디");
				throw new Exception();
			}
		}catch(Exception e) {
			e.printStackTrace();
			req.setAttribute("errorMsg", "차량 상세내용 조회 실패");
			req.getRequestDispatcher("/WEB-INF/views/common/error-page.jsp").forward(req, resp);
		}
		
		
//		req.getRequestDispatcher("/WEB-INF/views/order/order_car.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		
	}
	
}//class
