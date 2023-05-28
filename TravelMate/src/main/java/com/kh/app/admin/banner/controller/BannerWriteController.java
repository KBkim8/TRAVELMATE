package com.kh.app.admin.banner.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.kh.app.admin.service.AdminService;
import com.kh.app.admin.util.AttachmentVo;
import com.kh.app.admin.util.FileUploader;
import com.kh.app.admin.vo.AdBannerVo;

@MultipartConfig(
		maxFileSize = 1024 * 1024 * 50,
		maxRequestSize = 1024 * 1024 * 50 * 10
	)
@WebServlet("/admin/bannerwrite")
public class BannerWriteController extends HttpServlet{
	private final AdminService as = new AdminService();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/admin/bannerWrite.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			//데꺼
			String bannerName = req.getParameter("bannerName");
			String memberNick = req.getParameter("memberNick");
			String souvenirNo = req.getParameter("souvenirNo");

			String path = req.getServletContext().getRealPath("/static/img/adBanner/");	
			Part f = req.getPart("f");
			AttachmentVo attVo = FileUploader.saveFile(path, f);

			AdBannerVo vo = new AdBannerVo();
			vo.setName(bannerName);
			vo.setNick(memberNick);
			vo.setSouvenirNo(souvenirNo);
			vo.setImage(attVo.getChangeName());
			
			int result = as.AdbannerWrite(vo);
			
			if(result != 1) {
				throw new Exception();
			}
			
			req.getSession().setAttribute("alertMsg", "게시글이 등록되었습니다.");
			resp.sendRedirect(req.getContextPath() + "/admin/banner");
		}catch(Exception e) {
			e.printStackTrace();
			req.setAttribute("errMsg", "숙소조회에러");
			req.getRequestDispatcher("/WEB-INF/views/common/error-page.jsp").forward(req, resp);
		}
	}

}
