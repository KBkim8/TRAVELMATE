package com.kh.app.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.kh.app.board.vo.CategoryVo;
import com.kh.app.common.db.JDBCTemplate;

public class BoardDao {

	public List<CategoryVo> getCategoryList(Connection conn) throws Exception {
			
			// SQL
			String sql = "SELECT * FROM CATEGORY";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			// tx || rs
			List<CategoryVo> cvoList = new ArrayList<>();
			while(rs.next()) {
				String no = rs.getString("NO");
				String name = rs.getString("NAME");
				
				CategoryVo vo = new CategoryVo();
				vo.setNo(no);
				vo.setName(name);
				
				cvoList.add(vo);
			}
			
			JDBCTemplate.close(rs);
			JDBCTemplate.close(pstmt);
			
			return cvoList;
		}
		
	

}
