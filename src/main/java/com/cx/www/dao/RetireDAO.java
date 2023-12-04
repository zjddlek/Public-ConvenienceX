package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.RetireVO;
import com.cx.www.vo.ShopVO;

public class RetireDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sb = new StringBuffer();
	
	public RetireDAO() {
		conn = DBConnection.getConnection();
	}
	
	public ArrayList<RetireVO> getAll(){
		sb.setLength(0);
		sb.append("select * from RETIRE");
		ArrayList<RetireVO> list = new ArrayList<RetireVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			 
			while(rs.next()) {
				RetireVO vo = new RetireVO(rs.getString("empno"),rs.getString("retiredate"));
				list.add(vo);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public RetireVO getOne(String empno) {
		sb.setLength(0);
		sb.append("select * from RETIRE where empno = ?");
		RetireVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, empno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new RetireVO(empno,rs.getString("retiredate"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	public void addOne(RetireVO vo) {
		sb.setLength(0);
		sb.append("insert into RETIRE values (?,?)");
		
		try {
			pstmt= conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getEmpno());
			pstmt.setString(2, vo.getRetireDate());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void deleteOne(String empno) {
		sb.setLength(0);
		sb.append("delete from RETIRE where sno=?");
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, empno);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void updateOne(RetireVO vo) {
		sb.setLength(0);
		sb.append("update RETIRE set retiredate=? where empno=?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getRetireDate());
			pstmt.setString(2, vo.getEmpno());

			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
}
