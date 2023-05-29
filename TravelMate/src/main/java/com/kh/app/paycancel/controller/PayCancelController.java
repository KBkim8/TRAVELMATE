package com.kh.app.paycancel.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.app.member.vo.MemberVo;
import com.kh.app.product.vo.CarVo;

@WebServlet("/pay/cancel")
public class PayCancelController extends HttpServlet{

	//결제취소화면
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/WEB-INF/views/paycancel/pay_cancel.jsp").forward(req, resp);
	
	}

	//결제취소
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//paycancelreason insert
		
		
		
		
		//orderNo 가져오기
		HttpSession session = req.getSession();
		CarVo cvo = (CarVo) session.getAttribute("cvo");
		MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
		
		
		
		//payment table cancelyn column 'Y' update
		//데꺼
		String orderNo = req.getParameter("orderNo");
		String type = req.getParameter("type");
		String cancelYn = req.getParameter("cancelYn");
		
		//데뭉
		CarVo cvo = new CarVo();
		
		
		
		
	}



}


