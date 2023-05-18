package com.kh.app.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.app.member.vo.MemberVo;
import com.kh.app.mypage.service.AttendanceService;

@WebServlet("/mypage/attend")
public class MemberAttendController extends HttpServlet {

    
	private AttendanceService as; 
	
	 @Override
	    public void init() throws ServletException {
	        super.init();
	        as = new AttendanceService(); // AttendanceService 인스턴스 생성 및 초기화
	    }
	
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    	
    	try {
			req.getRequestDispatcher("/WEB-INF/views/mypage/memberAttend.jsp").forward(req, resp);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
    	HttpSession session = req.getSession();
    	MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
    	
        String mno = loginMember.getNo(); // 로그인한 회원의 번호를 가져옴

        // 출석 정보를 INSERT하는 로직
        int result;
		try {
			result = as.insertAttendance(mno);
			if(result == 1) {
				req.getRequestDispatcher("/WEB-INF/views/mypage/memberAttend.jsp").forward(req, resp);
			} else {
				req.setAttribute("errorMsg", "insert fail...");
				req.getRequestDispatcher("/WEB-INF/views/common/error-page.jsp").forward(req, resp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    
    }
}

