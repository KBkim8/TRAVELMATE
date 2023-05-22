package com.kh.app.admin.controller;

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
import com.kh.app.admin.vo.MemberSearchVo;
import com.kh.app.common.page.PageVo;

@WebServlet("/admin/memberSearch")
public class MemberSearchController extends HttpServlet{
	private final AdminService as = new AdminService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {	
			String searchType = req.getParameter("searchType");
			String searchValue = req.getParameter("searchValue");
			int listCount = as.MemberSearchCnt();
			int currentPage = Integer.parseInt(req.getParameter("page"));
			int pageLimit = 5;
			int boardLimit= 7;
			
			String page_ = req.getParameter("page");
			if(page_ == null) {
				page_ = "1";
			}
			
			PageVo pv = new PageVo(listCount, currentPage, pageLimit, boardLimit);
			
			//서비스
			AdminService as = new AdminService();
			List<MemberSearchVo> voList = null;
			if(searchType == null || searchType.equals("")) {
				voList = as.memberSearch(pv);	
			}else {
				voList = as.memberSearch(pv, searchType, searchValue);			
			}
			
			Map<String, String> map = new HashMap<>();
			map.put("searchType", searchType);
			map.put("searchValue", searchValue);
			//화면
			if(voList != null) {
				req.setAttribute("searchVo", map);
				req.setAttribute("pv", pv);
				req.setAttribute("voList", voList);
				req.getRequestDispatcher("/WEB-INF/views/admin/memberSearch.jsp").forward(req, resp);
			}else {
				throw new Exception();
			}
		}catch(Exception e) {
			req.setAttribute("errMsg", "신고내역 조회 에러");
			req.getRequestDispatcher("/WEB-INF/views/common/error-page.jsp").forward(req, resp);
			System.out.println("[ERR-103] 회원조회 에러");
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}

}
