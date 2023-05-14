package com.kh.app.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.app.member.service.MemberService;
import com.kh.app.member.vo.MemberVo;

@WebServlet("/mypage/checkPwd")
public class MypagePwdController extends HttpServlet{
	
	// 화면
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/mypage/checkPwd.jsp").forward(req, resp);
	}

	// 비밀번호 확인창
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		// INPUT 에 입력한 값이 DB에 있는 값과 EQUALS 면 조회화면으로, 아니면 에러 메세지와 함께 다시 확인 페이지로
		try {
			// 데꺼
			String memberPwd = req.getParameter("memberPwd");
			
			// 데뭉
			MemberVo vo = new MemberVo();
			vo.setPwd(memberPwd);
			
			// 서비스 
			MemberService ms = new MemberService();
//			MemberVo loginMember = ms.checkPwd(vo);
			
			// 화면
//			if(loginMember != null) {
//				String root = req.getContextPath();
//				req.getSession().setAttribute("loginMember", loginMember);
//				req.getRequestDispatcher("/WEB-INF/views/mypage/memberDetail.jsp").forward(req, resp);
//			}else {
//				throw new Exception();
//			}
			
		} catch (Exception e) {
			System.out.println("[ERROR] pwd check fail... ");
			e.printStackTrace();
			
			req.setAttribute("errorMsg", "MypagePwdController fail..");
			req.getRequestDispatcher("/WEB-INF/views/common/error-page.jsp").forward(req, resp);
		}
		
	
	}
}
