package com.kh.app.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.app.member.service.MemberService;
import com.kh.app.member.vo.MemberVo;

@WebServlet(urlPatterns = "/join")
public class JoinController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/member/join.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			
			//ㄷㄲ
			String memberId = req.getParameter("memberId");
			String memberPwd = req.getParameter("memberPwd");
			String memberEmail = req.getParameter("memberEmail");
			String memberNick = req.getParameter("memberNick");
			
			//ㄷㅁ
			MemberVo vo = new MemberVo();
			vo.setId(memberId);
			vo.setPwd(memberPwd);
			vo.setEmail(memberEmail);
			vo.setNick(memberNick);
			
			//ㅅㅄ
			MemberService ms = new MemberService();
			int result = ms.join(vo);
			
			//ㅎㅁ
			if(result ==1) {
				req.getRequestDispatcher("/WEB-INF/views/member/login.jsp").forward(req, resp);
			}else {
				throw new Exception();
			}
			
		}catch(Exception e) {
			System.out.println("[ERROR] join error...");
			e.printStackTrace();
			
			req.setAttribute("errorMsg", "회원가입 에러 ㅋㅋ");
			req.getRequestDispatcher("/WEB-INF/views/common/error-page.jsp").forward(req, resp);
		}
		
		
	}

}
