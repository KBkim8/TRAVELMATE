package com.kh.app.admin.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.app.admin.service.AdminService;
import com.kh.app.admin.vo.ReportListVo;
import com.kh.app.common.page.PageVo;

@WebServlet("/admin/reportlist")
public class ReportListController extends HttpServlet{

	private final AdminService as = new AdminService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String searchType = req.getParameter("searchType");
			String searchValue = req.getParameter("searchValue");
			int listCount = as.reportListCnt();
			int currentPage = Integer.parseInt(req.getParameter("page"));
			int pageLimit = 5;
			int boardLimit = 7;
			
			String page_ = req.getParameter("page");
			if(page_ == null) {
				page_ = "1";
			}
			
			PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
			
			//서비스
			List<ReportListVo> reportVoList = null;
			if(searchType == null || searchType.equals("")) {
				reportVoList = as.reportList(pv);				
			}else {
				reportVoList = as.reportList(pv, searchType, searchValue);				
			}
			
			Map<String, String> map = new HashMap<>();
			map.put("searchType", searchType);
			map.put("searchValue", searchValue);
			
			
			//화면보여주기
			req.setAttribute("searchVo", map);
			req.setAttribute("pv", pv);
			req.setAttribute("reportVoList", reportVoList);

			req.getRequestDispatcher("/WEB-INF/views/admin/reportList.jsp").forward(req, resp);
		}catch(Exception e) {
			req.setAttribute("errMsg", "신고내역 조회 에러");
			req.getRequestDispatcher("/WEB-INF/views/common/error-page.jsp").forward(req, resp);
			System.out.println("[ERR-101] 신고내역 조회 에러");
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
}