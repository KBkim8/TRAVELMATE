package com.kh.app.cs.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cs/inqueryList")
public class InqueryListController extends HttpServlet{

	// 문의내역 목록
	// SELECT Q.NO, Q.MEMBER_NO, Q.TITLE, Q.CONTENT, TO_CHAR(Q.ENROLL_DATE, 'YYYY-MM-DD') AS ENROLL_DATE, M.NICK FROM QNA Q JOIN MEMBER M ON (Q.MEMBER_NO = M.NO) WHERE M.NO='2' AND DELETE_YN='N'
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/CScenter/inqueryList.jsp").forward(req, resp);
	}
	
}
