package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.OrderVO;

public class OrderDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sb = new StringBuffer();

	public OrderDAO() {
		conn = DBConnection.getConnection();
	}

	public ArrayList<OrderVO> getAll() {
		sb.setLength(0);
		sb.append("select * from ORDERS");
		ArrayList<OrderVO> list = new ArrayList<OrderVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderVO vo = new OrderVO(rs.getString("ordno"), rs.getString("ordDate"), rs.getInt("ordCount"),
						rs.getString("pnoInfo"), rs.getString("pno"), rs.getString("sno"));
				list.add(vo);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public OrderVO getOne(String ordno) {
		sb.setLength(0);
		sb.append("select * from ORDERS where ordno = ?");
		OrderVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, ordno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new OrderVO(ordno, rs.getString("ordDate"), rs.getInt("ordCount"), rs.getString("pnoInfo"),
						rs.getString("pno"), rs.getString("sno"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}

	public void addOne(OrderVO vo) {
		sb.setLength(0);
		sb.append("insert into ORDERS values (?,sysdate,?,?,?,?)");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getOrdno());
			pstmt.setInt(2, vo.getOrdCount());
			pstmt.setString(3, vo.getPnoInfo());
			pstmt.setString(4, vo.getPno());
			pstmt.setString(5, vo.getSno());

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
	
	public void deleteOne(String ordno) {
		sb.setLength(0);
		sb.append("delete from ORDERS where ordno=?");
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, ordno);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	public void updateOne(OrderVO vo) {
		sb.setLength(0);
		sb.append("update ORDERS set orddate=sysdate , ordcount=? where ordno=?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, vo.getOrdCount());
			
			pstmt.setString(2, vo.getOrdno());
			
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
