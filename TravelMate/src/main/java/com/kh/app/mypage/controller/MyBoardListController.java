package com.kh.app.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.app.board.service.BoardService;
import com.kh.app.common.page.PageVo;
import com.kh.app.cs.service.InqueryService;
import com.kh.app.cs.vo.InqueryVo;
import com.kh.app.member.vo.MemberVo;

@WebServlet("/mypage/boardList")
public class MyBoardListController extends HttpServlet{

	private final BoardService bs = new BoardService();
	// 문의내역 목록
	 
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
				HttpSession session = req.getSession();
				MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
				String memberNo = loginMember.getNo();
			
				// 데이터 준비
				int listCount = bs.selectCnt(memberNo);
				String page = req.getParameter("page");
				if(page == null) page = "1";
				int currentPage = Integer.parseInt(page); 
				int pageLimit = 5;
				int boardLimit = 10;
				PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
				
				// 서비스
				List<InqueryVo> list = bs.selectInqueryList(pv,memberNo);
				
				// 화면
				req.setAttribute("pv", pv);
				req.setAttribute("list", list);
				req.getRequestDispatcher("/WEB-INF/views/mypage/myBoardList.jsp").forward(req, resp);
					
			} catch (Exception e) {
				System.out.println("[ERROR] boardList controller err");
				e.printStackTrace();
				
				req.setAttribute("errorMsg", "공지사항 목록 조회 실패..");
				req.getRequestDispatcher("/WEB-INF/views/common/error-page.jsp").forward(req, resp);
			}
		}
	
}
