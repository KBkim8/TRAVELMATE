package com.kh.app.member.service;

import com.kh.app.member.dao.MemberDao;

public class MemberService {
	
	private final MemberDao dao;
	
	public MemberService() {
		dao = new MemberDao(); 
	}

}
