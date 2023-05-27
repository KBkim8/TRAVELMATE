package com.kh.app.board.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.kh.app.board.dao.BoardDao;
import com.kh.app.board.vo.BoardVo;
import com.kh.app.board.vo.CategoryVo;
import com.kh.app.board.vo.CommentVo;
import com.kh.app.common.db.JDBCTemplate;
import com.kh.app.common.page.PageVo;
import com.kh.app.cs.vo.InqueryVo;
import com.kh.app.member.dao.MemberDao;
import com.kh.app.util.BoardImgVo;

public class BoardService {
	
private final BoardDao dao;
	
	public BoardService() {
		dao = new BoardDao(); 
	}

	//카테고리 리스트
	public List<CategoryVo> getCategoryList() throws Exception {
		
		// 커넥션
		try(Connection conn = JDBCTemplate.getConnection();){
			List<CategoryVo> cvoList = dao.getCategoryList(conn);

			return cvoList;
			}
		}

	//글쓰기
	public int write(BoardVo bvo) throws Exception {

		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		//sql
		int result = dao.write(conn ,bvo);
		//tx rs
		if(result ==1) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.close(conn);
		}
		
		// close
		JDBCTemplate.close(conn);
		
		return result;
	}


	// 강분 -회원별 게시글 개수
	public int getMyBoardListCntByNo(String searchType, String searchValue, String mno) throws Exception {

		// connn
		Connection conn = JDBCTemplate.getConnection();
		
		int cnt = dao.getMyBoardListCntByNo(conn,searchType, searchValue, mno);
		
		JDBCTemplate.close(conn);
		
		return cnt;
		
	}

	// 강분 -회원별 전체 게시글 목록 조회
	public List<BoardVo> getMyBoardListByNo(PageVo pv, String mno) throws Exception {
		
		// conn
		Connection conn = JDBCTemplate.getConnection();
		
		List<BoardVo> voList = dao.getMyBoardListByNo(conn,pv,mno);
		
		// close
		JDBCTemplate.close(conn);
		
		return voList;
		
	}

	// 강분 -회원별 검색 게시글 목록 조회
	public List<BoardVo> getMyBoardListByNo(PageVo pv, String searchType, String searchValue, String mno) throws Exception {

		// conn
		Connection conn = JDBCTemplate.getConnection();
		
		List<BoardVo> voList = dao.getMyBoardListByNo(conn,pv, searchType, searchValue, mno);
		
		// close
		JDBCTemplate.close(conn);
		
		return voList;
		
	}

	//도연 - 공지사항 게시글 목록 조회
	//전체조회
	public List<BoardVo> noticeList(PageVo pv ) throws Exception {
		
		Connection conn = JDBCTemplate.getConnection();
		
		List<BoardVo>bvoList = dao.noticeList(conn ,pv);
		
		JDBCTemplate.close(conn);
	
		return bvoList;
	}
	
	// 검색해서 글목록조회
	public List<BoardVo> noticeList(PageVo pv, String searchValue, String searchType) throws Exception {
		
		Connection conn = JDBCTemplate.getConnection();
		
		List<BoardVo>bvoList = dao.noticeList(conn ,pv ,searchValue ,searchType);
		
		JDBCTemplate.close(conn);
	
		return bvoList;
	}

	//board cnt
	public int selectCnt() throws Exception {

		//conn
		Connection conn = JDBCTemplate.getConnection();
		
		int cnt = dao.selectCnt(conn);
		
		JDBCTemplate.close(conn);
		
		return cnt;
	}

	//공지사항 상세조회 + 조회수 처리까지
	public BoardVo noticeDetail(String no) throws Exception {
		
		Connection conn = JDBCTemplate.getConnection();
		
		BoardVo vo = null;
		//                조회수 증가
		int result = dao.updateHit(conn , no);
		
		if(result ==1) {
			 vo = dao.noticeDetail(conn ,no);
		}else {
			throw new Exception();
		}
		JDBCTemplate.close(conn);
		return vo;
	}

	// 도연 - 공지사항 삭제
	public int noticeDelete(String no) throws Exception {
		
		try(Connection conn = JDBCTemplate.getConnection();){
			
			int result = dao.noticeDelete(conn , no);
			
			if(result ==1) {
				JDBCTemplate.commit(conn);
			}else{
				JDBCTemplate.rollback(conn);
			}
			return result;
		}
	}

	// 도연 - 공지사항 수정하기
	public int noticeEdit(BoardVo vo) throws Exception {
		
		try(Connection conn = JDBCTemplate.getConnection();){
			
			int result = dao.noticeEdit(conn , vo);
			
			if(result ==1) {
				JDBCTemplate.commit(conn);
			}else{
				JDBCTemplate.rollback(conn);
			}
			return result;
		}
	}//method

	//공지사항 댓글달기
	public int NoticeReplyWrite(CommentVo vo) throws Exception {
		
		try(Connection conn = JDBCTemplate.getConnection();){
			
			int result = dao.NoticeReplyWrite(conn , vo);
			
			if(result ==1) {
				JDBCTemplate.commit(conn);
			}else{
				JDBCTemplate.rollback(conn);
			}
			return result;
		}
		
	}
	
	// 자유게시판 목록 조회
		public List<BoardVo> freeList(PageVo pv) throws Exception {
			
			Connection conn = JDBCTemplate.getConnection();
			
			List<BoardVo>fvoList= dao.freeList(conn ,pv);
			
			JDBCTemplate.close(conn);
			
			return fvoList;
		}

		//공지사항 댓글보여주기
		public List<CommentVo> noticeReplyList(String boardNo) throws Exception {
			
			Connection conn = JDBCTemplate.getConnection();
			
			List<CommentVo> replyList = dao.noticeReplyList(conn ,boardNo);
			
			JDBCTemplate.close(conn);
			
			return replyList;
			
		}

		//자유게시판 상세조회 + 조회수
		public BoardVo freeDetail(String no) throws Exception {

			try(Connection conn = JDBCTemplate.getConnection();){
				
				int result = dao.updateHit(conn , no);
				BoardVo fvo = null;
				if (result ==1) {
					fvo = dao.freeDetail(conn ,no);
				}else {
					throw new Exception();
				}
				return fvo;
			}
		}

		//자유게시판 삭제
		public int freeDelete(String no) throws Exception {
			
			Connection conn =JDBCTemplate.getConnection();
			
			int result = dao.freeDelete(conn ,no);
			
			if(result ==1) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			JDBCTemplate.close(conn);
			return result;
			
		}

		//자유게시판 수정
		public int freeEdit(BoardVo vo) throws Exception {
			
			Connection conn =JDBCTemplate.getConnection();
			
			int result = dao.freeEdit(conn,vo);
			
			if(result ==1) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			
			JDBCTemplate.close(conn);
			
			return result;
		}

		//자유게시판 작성하기
		public int freeWrite(BoardVo bvo) throws Exception {

			Connection conn =JDBCTemplate.getConnection();
			
			int result = dao.freeWrite(conn,bvo);
			
			if(result ==1) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			
			JDBCTemplate.close(conn);
			
			return result;
		}

		//자유게시판 댓글달기
		public int freeBoardRplyWrite(CommentVo cvo) throws Exception {
			
			Connection conn = JDBCTemplate.getConnection();
			
			int result = dao.freeBoardRplyWrite(conn ,cvo);
			if(result ==1) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			
			JDBCTemplate.close(conn);
			return result;
		}

		//자유게시판 댓글 보여주기이이
		public List<CommentVo> freeReplyList(String boardNo) throws Exception {
		
			Connection conn = JDBCTemplate.getConnection();
			
			List<CommentVo> relpyList = dao.freeReplyList(conn ,boardNo);
			
			JDBCTemplate.close(conn);
			
			return relpyList;
		}

		//관리자 신분으로 판매요청글 조회
		public List<BoardVo> sellRequestList(PageVo pv) {
			// TODO Auto-generated method stub
			return null;
		}
		
		//판매지ㅏ 신분으로 판매요청글 조회
		public List<BoardVo> sellRequestList(PageVo pv, String memberCategoryNo) {
			return null;
		}

		

		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//class

