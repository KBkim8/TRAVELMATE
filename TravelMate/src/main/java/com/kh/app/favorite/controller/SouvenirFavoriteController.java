package com.kh.app.favorite.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.app.product.service.SouvenirService;
import com.kh.app.product.vo.SouvenirVo;

@WebServlet("/favorite")
public class SouvenirFavoriteController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			String no = req.getParameter("no");
			String name = req.getParameter("name");

			SouvenirService ss = new SouvenirService();
			SouvenirVo vo = ss.selectSouvenirOneByNo(name);
			
			int result = ss.souvenirFavorite(no, name);
			
			if(result == 1) {
				req.setAttribute("vo", vo);
				req.getRequestDispatcher("/WEB-INF/views/order/order_souvenir.jsp").forward(req, resp);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	
	}
	
	
}
