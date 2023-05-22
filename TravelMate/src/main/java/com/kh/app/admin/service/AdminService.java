package com.kh.app.admin.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.app.admin.dao.AdminDao;
import com.kh.app.admin.vo.AdBannerVo;
import com.kh.app.admin.vo.MemberSearchVo;
import com.kh.app.admin.vo.ReportListVo;
import com.kh.app.admin.vo.ReportSearchVo;
import com.kh.app.admin.vo.SellRequestVo;
import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.common.page.PageVo;

public class AdminService {

	private final AdminDao dao;
	
	public AdminService() {
		dao = new AdminDao();
	}
	
	//신고내역 페이징처리
	public int reportListCnt() throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		int cnt = dao.reportListCnt(conn);
		
		JDBCTemplate.close(conn);
		
		return cnt;
	}
	
	//제재이력조회 페이징처리
	public int reportSearchCnt() throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		int cnt = dao.reportSearchCnt(conn);
		
		JDBCTemplate.close(conn);
		
		return cnt;
	}
	
	//회원조회 페이징처리
	public int MemberSearchCnt() throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		int cnt = dao.memberSearchCnt(conn);
		
		JDBCTemplate.close(conn);
	
		return cnt;
	}

	//판매등록요청조회 페이징처리
	public int sellRequestCnt() throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		int cnt = dao.sellRequestCnt(conn);
		
		JDBCTemplate.close(conn);
	
		return cnt;
	}
	
	//광고배너관리 페이징처리
	public int adBannerCnt() throws Exception {
		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		int cnt = dao.adBannerCnt(conn);
		
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


}
