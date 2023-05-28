package com.kh.app.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.kh.app.board.service.BoardService;
import com.kh.app.board.vo.BoardVo;
import com.kh.app.member.vo.MemberVo;
import com.kh.app.util.BoardImgVo;
import com.kh.app.util.FileUploader;

@MultipartConfig(
		maxFileSize = 1024 * 1024 * 100 ,
		maxRequestSize = 1024 * 1024 * 1000
	)

@WebServlet(urlPatterns = "/sell/request/write")
public class SellrequestWriteController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/board/sell-request-write.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		try {
			
			
			HttpSession session = req.getSession();
			MemberVo loginMember = (MemberVo) session.getAttribute("loginMember");
			
			String writer = loginMember.getNo();
			String title = req.getParameter("title");
			String contnet = req.getParameter("content");
			
			
			String path = req.getServletContext().getRealPath("/static/img/gallery/");
			Part f = req.getPart("f");
			BoardImgVo biVo = FileUploader.saveFile(path, f);

			//boardImg title 에 changename insert
			
			BoardVo vo = new BoardVo();
			vo.setMemberNo(writer);
			vo.setTitle(title);
			vo.setContent(contnet);
			vo.setBoardImgNo(biVo.getBno());
			vo.setContent(biVo.getChangeName());
			
			BoardService bs = new BoardService();
			
			int result = bs.sellRequestWrite(vo);
			
			if(result ==1) {
				resp.sendRedirect(req.getContextPath()+"/sell/request/list");
			}else {
				throw new IllegalStateException();
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}	

}
