package com.kh.app.board.service;

import com.kh.app.board.dao.BoardDao;
import com.kh.app.member.dao.MemberDao;

public class BoardService {
	
private final BoardDao dao;
	
	public BoardService() {
		dao = new BoardDao(); 
	}

}
