package com.kh.app.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.app.member.service.MemberService;
import com.kh.app.member.vo.MemberVo;

@WebServlet("/mypage/member/detail")
public class MemberDetailController extends HttpServlet{

	
	private final MemberService ms = new MemberService();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// 데꺼
			String mno = req.getParameter("mno");
			
			// 데뭉
			
			// 서비스
			// 도연님 작업 끝나면 작업하기 
			MemberVo loginMember = ms.selectMemberOneByNo(mno);
			System.out.println(mno);
			System.out.println(loginMember);
			
			// 화면
			if(loginMember != null) {
				req.setAttribute("loginMember", loginMember);
				req.getRequestDispatcher("/WEB-INF/views/mypage/memberDetail.jsp").forward(req, resp);
			}else {
				throw new Exception();
			}
			
		} catch (Exception e) {
			System.out.println("[ERROR] member detail err");
			e.printStackTrace();
			
			req.setAttribute("errorMsg", "상세조회 실패..");
			req.getRequestDispatcher("/WEB-INF/views/common/error-page.jsp").forward(req, resp);
		}
	}
	
}
