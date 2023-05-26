package com.kh.app.pay.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/pay/room")
public class PayRoomController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String daterange = req.getParameter("daterange");
		String[] dateArr= daterange.split(" - ");
		String dateStart = dateArr[0];
		String dateEnd = dateArr[1];
		System.out.println(dateArr);
		System.out.println(dateStart);
		System.out.println(dateEnd);
		System.out.println(daterange);
		
		req.getRequestDispatcher("/WEB-INF/views/pay/pay_room.jsp").forward(req, resp);
	}
	
}
