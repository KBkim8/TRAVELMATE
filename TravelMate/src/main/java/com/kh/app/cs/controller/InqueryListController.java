package com.kh.app.cs.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.app.common.page.PageVo;
import com.kh.app.cs.service.InqueryService;
import com.kh.app.cs.vo.InqueryVo;

@WebServlet("/cs/inqueryList")
public class InqueryListController extends HttpServlet{

	private final InqueryService is = new InqueryService();
	// 문의내역 목록
	// SELECT Q.NO, Q.MEMBER_NO, Q.TITLE, Q.CONTENT, TO_CHAR(Q.ENROLL_DATE, 'YYYY-MM-DD') AS ENROLL_DATE, M.NICK FROM QNA Q JOIN MEMBER M ON (Q.MEMBER_NO = M.NO) WHERE M.NO='2' AND DELETE_YN='N'
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
					
				// 데이터 준비
				int listCount = is.selectCnt();
				String page = req.getParameter("page");
				if(page == null) page = "1";
				int currentPage = Integer.parseInt(page); 
				int pageLimit = 5;
				int boardLimit = 10;
				PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
				
				// 서비스
				List<InqueryVo> list = is.selectInqueryList(pv);
				
				// 화면
				req.setAttribute("pv", pv);
				req.setAttribute("list", list);
				req.getRequestDispatcher("/WEB-INF/views/CScenter/inqueryList.jsp").forward(req, resp);
					
			} catch (Exception e) {
				System.out.println("[ERROR] notice list controller err");
				e.printStackTrace();
				
				req.setAttribute("errorMsg", "공지사항 목록 조회 실패..");
				req.getRequestDispatcher("/WEB-INF/views/common/error-page.jsp").forward(req, resp);
			}
		}
		
	
	}
	

