package com.kh.app.pay.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.app.product.service.CarService;
import com.kh.app.product.vo.CarVo;
@WebServlet("/pay/car")
public class PayCarController extends HttpServlet{

	//차량 결제 화면
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/pay/pay_car.jsp").forward(req, resp);
	}
	
	//차량 결제 (payment 테이블 칼럼들 다 가져와서 insert하고 orderlist에 )
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

try {
			
			HttpSession session = req.getSession();
			CarVo cvo = (CarVo) session.getAttribute("cvo");
			
			//데꺼
			String max = req.getParameter("max");
			String licensePlate = req.getParameter("licensePlate");
			String price = req.getParameter("price");
			String lcname = req.getParameter("lcname");
			String title = req.getParameter("title");
			String carKindKind = req.getParameter("carKindKind");
			
			//데뭉
			CarVo vo = new CarVo();
			vo.setMax(max);
			vo.setLicensePlate(licensePlate);
			vo.setPrice(price);
			vo.setLcname(lcname);
			vo.setTitle(title);
			vo.setCarKindKind(carKindKind);
			
			//서비스
			CarService cs = new CarService();
			CarVo updatedCar = cs.edit(vo);
			
			//화면
			if(updatedCar != null) {
				req.getSession().setAttribute("alertMsg", "결제 완료!");
				req.getSession().setAttribute("cvo", updatedCar);
				resp.sendRedirect(req.getContextPath() + "/마이페이지/주문내역조회");
			}else {
				throw new Exception();
			}
			
		}catch(Exception e) {
			System.out.println("[ERROR] pay car errrr...");
			e.printStackTrace();
			
			req.setAttribute("errorMsg", "pay car fail...");
			req.getRequestDispatcher("/WEB-INF/views/common/error-page.jsp").forward(req, resp);
		}
		
	}
	
	
}
