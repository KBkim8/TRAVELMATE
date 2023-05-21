package com.kh.app.pay.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.app.product.service.SouvenirService;
import com.kh.app.product.vo.SouvenirVo;

@WebServlet("/pay/souvenir")
public class PaySouvenirController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			String sno = req.getParameter("sno");
			String no = req.getParameter("no");
			String mname = req.getParameter("mname");
			String ph = req.getParameter("ph");
			String address = req.getParameter("address");
			String cnt = req.getParameter("cnt");
			String totalPrice = req.getParameter("totalPrice");
			
			SouvenirVo vo = new SouvenirVo();
			vo.setSno(sno);
			vo.setNo(no);
			vo.setMname(mname);
			vo.setPh(ph);
			vo.setAddress(address);
			vo.setCnt(cnt);
			vo.setTotalPrice(totalPrice);

			
			SouvenirService ss = new SouvenirService();
			int result = ss.order(vo);
			vo = ss.selectOrder(sno); 
			if(vo != null) {
				req.setAttribute("vo", vo);
				req.getRequestDispatcher("/WEB-INF/views/pay/pay_souvenir.jsp").forward(req, resp);
			}else {
				throw new Exception();
			}
			
			
		}catch (Exception e) {
			System.out.println("[ERROR] notice detail errr....");
			e.printStackTrace();
			
			req.setAttribute("errorMsg", "상세조회 실패");
			req.getRequestDispatcher("~").forward(req, resp);
		}
		
		
		
		
		
		
		
		
	}
}
