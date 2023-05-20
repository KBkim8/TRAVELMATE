package com.kh.app.cs.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.app.board.service.BoardService;
import com.kh.app.board.vo.BoardVo;
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
					
			String searchType = req.getParameter("searchType");
			String searchValue = req.getParameter("searchValue");
			
			// 데이터 준비
			int cnt = is.getInqueryListCnt(searchType, searchValue);
			String page_ = req.getParameter("page");
			if(page_ == null) {
				page_ = "1";
			}
			int page = Integer.parseInt(page_);
			PageVo pv = new PageVo(cnt, page, 5, 10);
			
			// 서비스
			List<InqueryVo> voList = null;
			if(searchType == null || searchValue.equals("")) {
				voList = is.getInqueryList(pv);
			}else {
				voList = is.getInqueryList(pv, searchType, searchValue);
			}
			
			Map<String, String> map = new HashMap<>();
			map.put("searchType", searchType);
			map.put("searchValue", searchValue);
			
			// 화면
			req.setAttribute("searchVo", map);
			req.setAttribute("pv", pv);
			req.setAttribute("voList", voList);
			req.getRequestDispatcher("/WEB-INF/views/CScenter/inqueryList.jsp").forward(req, resp);
			
			} catch (Exception e) {
				System.out.println("[ERROR] inquery list controller err");
				e.printStackTrace();
				
				req.setAttribute("errorMsg", "공지사항 목록 조회 실패..");
				req.getRequestDispatcher("/WEB-INF/views/common/error-page.jsp").forward(req, resp);
			}
		}
		
	
	}
	

