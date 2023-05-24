package com.kh.app.admin.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.app.admin.dao.AdminDao;
import com.kh.app.admin.vo.AccommodationInventoryVo;
import com.kh.app.admin.vo.AdBannerVo;
import com.kh.app.admin.vo.CarInventoryVo;
import com.kh.app.admin.vo.MemberDetailVo;
import com.kh.app.admin.vo.MemberSearchVo;
import com.kh.app.admin.vo.ReportListDetailVo;
import com.kh.app.admin.vo.ReportListVo;
import com.kh.app.admin.vo.ReportSearchDetailVo;
import com.kh.app.admin.vo.ReportSearchVo;
import com.kh.app.admin.vo.SellRequestDetailVo;
import com.kh.app.admin.vo.SellRequestVo;
import com.kh.app.admin.vo.SouvenirInventoryVo;
import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.common.page.PageVo;

public class AdminService {

	private final AdminDao dao;
	
	public AdminService() {
		dao = new AdminDao();
	}
	
	//신고내역 페이징처리
	public int reportListCnt(String searchType, String searchValue) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		int cnt = dao.reportListCnt(conn, searchType, searchValue);
		
		JDBCTemplate.close(conn);
		
		return cnt;
	}
	
	//제재이력조회 페이징처리
	public int reportSearchCnt(String searchType, String searchValue) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		int cnt = dao.reportSearchCnt(conn, searchType, searchValue);
		
		JDBCTemplate.close(conn);
		
		return cnt;
	}
	
	//회원조회 페이징처리
	public int memberSearchCnt(String searchType, String searchValue) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		int cnt = dao.memberSearchCnt(conn, searchType, searchValue);
		
		JDBCTemplate.close(conn);
	
		return cnt;
	}
	
	//차량재고조회 페이징처리
	public int carInventoryCnt(String searchType, String searchValue) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		int cnt = dao.carInventroy(conn, searchType, searchValue);
		
		JDBCTemplate.close(conn);
		
		return cnt;
	}

	//숙소재고조회 페이징처리
	public int accommodationInventoryCnt(String searchType, String searchValue) throws Exception {
		Connection conn = JDBCTemplate.getConnection();
		
		int cnt = dao.accommodationInventoryCnt(conn, searchType, searchValue);
		
		JDBCTemplate.close(conn);
		
		return cnt;
	}
	
	//기념품재고조회 페이징처리
	public int souvenirInventoryCnt(String searchType, String searchValue) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		int cnt = dao.souvenirInventory(conn, searchType, searchValue);
		
		JDBCTemplate.close(conn);
		
		return cnt;
	}


	//판매등록요청조회 페이징처리
	public int sellRequestCnt(String searchType, String searchValue) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		int cnt = dao.sellRequestCnt(conn,searchType, searchValue);
		
		JDBCTemplate.close(conn);
	
		return cnt;
	}
	
	//광고배너관리 페이징처리
	public int adBannerCnt(String searchType, String searchValue) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		int cnt = dao.adBannerCnt(conn, searchType, searchValue);
		
		JDBCTemplate.close(conn);
	
		return cnt;
	}
		
	//신고내역조회
	public List<ReportListVo> reportList(PageVo pv) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		List<ReportListVo> reportVoList = dao.reportList(conn, pv);
		
		//close
		JDBCTemplate.close(conn);
		
		return reportVoList;
	}
	
	//신고내역 카테고리 검색 조회
	public List<ReportListVo> reportList(PageVo pv, String searchType, String SearchValue) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		List<ReportListVo> reportVoList = dao.reportList(conn, pv, searchType, SearchValue);
		
		//close
		JDBCTemplate.close(conn);
		
		return reportVoList;
	}
	
	//제재이력조회
	public List<ReportSearchVo> reportSearch(PageVo pv) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		List<ReportSearchVo> voList = dao.reportSearch(conn, pv);
		
		JDBCTemplate.close(conn);
		
		return voList;
	}

	//제재이력 카테고리 검색조회
	public List<ReportSearchVo> reportSearch(PageVo pv, String searchType, String searchValue) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		List<ReportSearchVo> voList = dao.reportSearch(conn, pv, searchType, searchValue);
		
		JDBCTemplate.close(conn);
		
		return voList;
	}

	//회원조회
	public List<MemberSearchVo> memberSearch(PageVo pv) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		List<MemberSearchVo> voList = dao.memberSearch(conn, pv);
				
		JDBCTemplate.close(conn);
		
		return voList;
	}

	//회원 카테고리 검색조회
	public List<MemberSearchVo> memberSearch(PageVo pv, String searchType, String searchValue) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		List<MemberSearchVo> voList = dao.memberSearch(conn, pv, searchType, searchValue);
				
		JDBCTemplate.close(conn);
		
		return voList;
	}

	//차량재고조회
	public List<CarInventoryVo> carInventory(PageVo pv) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		List<CarInventoryVo> voList = dao.carInventory(conn, pv);
		
		JDBCTemplate.close(conn);
		
		return voList;
	}
	
	//차량재고조회 검색조회
	public List<CarInventoryVo> carInventory(PageVo pv, String searchType, String searchValue) throws Exception {
		Connection conn = JDBCTemplate.getConnection();
		
		List<CarInventoryVo> voList = dao.carInventory(conn, pv, searchType, searchValue);
		
		JDBCTemplate.close(conn);
		
		return voList;
	}
	
	//숙소재고조회
	public List<AccommodationInventoryVo> accommodationInventory(PageVo pv) throws Exception {
		Connection conn = JDBCTemplate.getConnection();
		
		List<AccommodationInventoryVo> voList = dao.accommodationInventory(conn, pv);
		
		JDBCTemplate.close(conn);
		
		return voList;
	}
	
	//숙소재고조회 검색조회
	public List<AccommodationInventoryVo> accommodationInventory(PageVo pv, String searchType, String searchValue) throws Exception {
		Connection conn = JDBCTemplate.getConnection();
		
		List<AccommodationInventoryVo> voList =  dao.accommodationInventory(conn, pv, searchType, searchValue);
		
		JDBCTemplate.close(conn);
		
		return voList;
	}
	
	//기념품재고조회
	public List<SouvenirInventoryVo> souvenirInventory(PageVo pv) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		List<SouvenirInventoryVo> voList = dao.souvenirInventory(conn, pv);
	
		JDBCTemplate.close(conn);
		
		return voList;
	}
	
	//기념품재고조회 검색조회
	public List<SouvenirInventoryVo> souvenirInventory(PageVo pv, String searchType, String searchValue) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		List<SouvenirInventoryVo> voList = dao.souvenirInventory(conn, pv, searchType, searchValue);
	
		JDBCTemplate.close(conn);
		
		return voList;
	}
	
	//판매등록요청
	public List<SellRequestVo> sellRequest(PageVo pv) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		List<SellRequestVo> voList = dao.sellRequest(conn, pv);
		
		JDBCTemplate.close(conn);
		
		return voList;
	}

	//판매등록요청 검색조회
	public List<SellRequestVo> sellRequest(PageVo pv, String searchType, String searchValue) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		List<SellRequestVo> voList = dao.sellRequest(conn, pv, searchType, searchValue);
		
		JDBCTemplate.close(conn);
		
		return voList;
	}

	//광고배너관리
	public List<AdBannerVo> adBanner(PageVo pv) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		List<AdBannerVo> voList = dao.adBanner(conn, pv);
		
		JDBCTemplate.close(conn);
		
		return voList;
	}
	
	//광고배너관리 검색조회
	public List<AdBannerVo> adBanner(PageVo pv, String searchType, String searchValue) throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		List<AdBannerVo> voList = dao.adBanner(conn, pv, searchType, searchValue);
		
		JDBCTemplate.close(conn);
		
		return voList;
	}

	////////////////////////////////////////////////////////////////////////////////////////////
	//신고내역상세조회
	public ReportListDetailVo reportListDetail(String no) throws Exception {
		Connection conn = JDBCTemplate.getConnection();
		
		ReportListDetailVo vo = dao.reportListDetail(conn, no);
		
		JDBCTemplate.close(conn);
		
		return vo;
	}

	//제재이력조회 상세조회
	public ReportSearchDetailVo reportSearchDetail(String no) throws Exception {
		Connection conn = JDBCTemplate.getConnection();
		
		ReportSearchDetailVo vo = dao.reportSearchDetail(conn, no);
		
		JDBCTemplate.close(conn);
		
		return vo;
	}

	//회원상세조회
	public MemberDetailVo memberSearchDetail(String no) throws Exception {
		Connection conn = JDBCTemplate.getConnection();
		
		MemberDetailVo vo = dao.memberSearchDetail(conn, no);
		
		JDBCTemplate.close(conn);
		
		return vo;
	}

	//판매등록요청 상세조회
	public SellRequestDetailVo sellRequestDetail(String no) throws Exception {
		Connection conn = JDBCTemplate.getConnection();
		
		SellRequestDetailVo vo = dao.sellRequestDetail(conn, no);
		
		JDBCTemplate.close(conn);
		
		return vo;
	}

	//판매등록요청 등록
	public int sellRequestEnroll(String no) throws Exception {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = dao.sellRequestEnroll(conn, no);
		
		if(result == 1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

}
