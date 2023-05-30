package com.kh.app.home.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.app.board.service.BoardService;
import com.kh.app.board.vo.BoardVo;
import com.kh.app.common.page.PageVo;

@WebServlet("/home")
public class HomeController extends HttpServlet{
	
	private final BoardService bs = new BoardService();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			//자유게시판
			List<BoardVo> fvoList = bs.freeList(new PageVo(5, 1, 1, 5));
			req.setAttribute("fvoList", fvoList);
			
			req.getRequestDispatcher("/WEB-INF/views/common/home.jsp").forward(req, resp);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}
