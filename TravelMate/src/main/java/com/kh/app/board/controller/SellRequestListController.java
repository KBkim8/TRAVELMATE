package com.kh.app.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.app.board.service.BoardService;
import com.kh.app.board.vo.BoardVo;
import com.kh.app.common.page.PageVo;
import com.kh.app.member.vo.MemberVo;

@WebServlet(urlPatterns = "/sell/request/list")
public class SellRequestListController extends HttpServlet{
	
	//	멤버 카테고리 "1" 번인 관리자의 신분으로 모든 판매등록글 리스트 조회
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {
			
			HttpSession session = req.getSession();
			MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
			String memberNo = loginMember.getNo();
			
			BoardService bs = new BoardService();
			
			int listCount = bs.selectCnt();
			String page = req.getParameter("page");
			if(page == null) page = "1";
			int currentPage = Integer.parseInt(page);
			int pageLimit = 5;
			int boardLimit = 10;
			PageVo pv = new PageVo	(listCount, currentPage, pageLimit, boardLimit);
			
			List<BoardVo> voList = new ArrayList<>();
			voList = bs.sellRequestList(pv , memberNo);
//			if(loginMember.getMemberCategoryNo() =="1") {
//				voList = bs.sellRequestList(pv);
//				
//				req.setAttribute("voList", voList);
//				req.getRequestDispatcher("/WEB-INF/views/board/admin-private-sell-request-list.jsp").forward(req, resp);
//				
//			}
			if(voList !=null){
				req.setAttribute("loginMember", loginMember);
				req.setAttribute("voList", voList);
				req.setAttribute("pv", pv);
				req.getRequestDispatcher("/WEB-INF/views/board/sell-request-list.jsp").forward(req, resp);
			}
			
			//화면 
//			if( voList !=null ){
//				req.setAttribute("lgoinMember", loginMember);
//				req.setAttribute("voList", voList);
//				req.getRequestDispatcher("/WEB-INF/views/board/admin-private-sell-request-list.jsp").forward(req, resp);
//			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
