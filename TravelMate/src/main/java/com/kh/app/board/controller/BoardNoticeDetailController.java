package com.kh.app.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.app.board.service.BoardService;
import com.kh.app.board.vo.BoardVo;

@WebServlet("/notice/detail")
public class BoardNoticeDetailController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String bno = req.getParameter("bno");
		
		BoardService bs = new BoardService();
		BoardVo vo = new BoardVo();
		
//		bs.detail();
		
		
//		req.setAttribute("bvo", bvo);
		req.getRequestDispatcher("/WEB-INF/views/board/notice-detail.jsp").forward(req, resp);
	}
	
}
