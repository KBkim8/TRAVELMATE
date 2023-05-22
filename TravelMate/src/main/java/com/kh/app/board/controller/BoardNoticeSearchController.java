package com.kh.app.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.app.board.service.BoardService;
import com.kh.app.board.vo.BoardVo;

@WebServlet(urlPatterns = "/notice/search")
public class BoardNoticeSearchController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String title = req.getParameter("title");
		
		BoardService bs = new BoardService();
		
		BoardVo result = null; //BoardVo 말고 List로 수정해야함
		try {
			result = bs.noticeSearch(title);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(result != null) {
			req.setAttribute(title, result);
			req.getRequestDispatcher("/WEB-INF/views/board/board-notice-list.jsp").forward(req, resp);
		}
		
		
		
		
	}

}
