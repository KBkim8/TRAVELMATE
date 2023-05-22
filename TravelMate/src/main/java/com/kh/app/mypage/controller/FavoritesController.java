package com.kh.app.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.app.board.vo.BoardVo;
import com.kh.app.common.page.PageVo;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.mypage.service.FavoriteService;
import com.kh.app.mypage.vo.FavoriteVo;

@WebServlet("/mypage/favorites")
public class FavoritesController extends HttpServlet{

	// 관심상품 화면
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/mypage/favorites.jsp").forward(req, resp);
	}
	
	// 관심상품 
	// 회원번호로 select 해서 차량, 숙소, 기념품 
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		FavoriteService fs = new FavoriteService();

		// 데이터 준비
		MemberVo loginMember = (MemberVo) req.getSession().getAttribute("loginMember");
		String mno = loginMember.getNo();
		int cnt = fs.getFavListCntByNo(mno);
		String page_ = req.getParameter("page");
		if(page_ == null) {
			page_ = "1";
		}
		int page = Integer.parseInt(page_);
		PageVo pv = new PageVo(cnt, page, 5, 10);
		
		// 서비스
		List<FavoriteVo> voList = null;
		voList = fs.getFavListByNo(pv,mno);
		
		// 결과 화면
		
	
	}
	
	
}
