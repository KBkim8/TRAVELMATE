package com.kh.app.admin.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.app.admin.dao.AdminDao;
import com.kh.app.admin.vo.ReportListVo;
import com.kh.app.admin.vo.ReportSearchVo;
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
}
