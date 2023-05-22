package com.kh.app.board.controller;

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

@WebServlet(urlPatterns = "/notice/list")
public class BoardNoticeListController extends HttpServlet{
	
	private final BoardService bs = new BoardService();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {

			int listCount = bs.selectCnt();
			String page = req.getParameter("page");
			if(page == null) page = "1";
			int currentPage = Integer.parseInt(page);
			int pageLimit = 5;
			int boardLimit = 10;
			PageVo pv = new PageVo	(listCount, currentPage, pageLimit, boardLimit);
			
			//tqt
			List<BoardVo> bvoList = bs.list(pv);
			
			//gd
			req.setAttribute("pv", pv);
			req.setAttribute("bvoList", bvoList);
			req.getRequestDispatcher("/WEB-INF/views/board/board-notice-list.jsp").forward(req, resp);
			
		}catch (Exception e) {
			System.out.println("error");
			e.printStackTrace();
		}
	}
	
	
}
