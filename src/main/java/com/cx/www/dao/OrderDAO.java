package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.OrderVO;
import com.cx.www.vo.ProductVO;

public class OrderDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sb = new StringBuffer();

	public OrderDAO() {
		conn = DBConnection.getConnection();
	}

	public ArrayList<OrderVO> getAll() {
		ArrayList<OrderVO> list = new ArrayList<OrderVO>();
		
		sb.setLength(0);
		sb.append("SELECT ORDNO, ORDDATE, ORD_COUNT, PNO_INFO, SNO "
				+ "FROM ORDERS ORDER BY LENGTH(ORDERNO) DESC, ORDERNO");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderVO vo = new OrderVO(
						rs.getString("ordno"), 
						rs.getString("ordDate"), 
						rs.getInt("ord_Count"),
						rs.getInt("pno_Info"), 
						rs.getString("sno"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<OrderVO> getAll(int startNo, int recordPerPage) {
		ArrayList<OrderVO> list = new ArrayList<OrderVO>();
		
		sb.setLength(0);
		sb.append("SELECT ORDNO, ORDDATE, ORD_COUNT, PNO_INFO, SNO "
				+ "FROM ORDERS ORDER BY LENGTH(ORDERNO) DESC, ORDERNO "
				+ "LIMIT ?, ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				OrderVO vo = new OrderVO(
						rs.getString("ordno"), 
						rs.getString("ordDate"), 
						rs.getInt("ord_Count"),
						rs.getInt("pno_Info"), 
						rs.getString("sno"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	public OrderVO getOne(String ordno) {
		sb.setLength(0);
		sb.append("SELECT ORDNO, ORDDATE, ORD_COUNT, PNO_INFO, SNO "
				+ "FROM ORDERS WHERE ORDNO = ?");
		OrderVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, ordno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new OrderVO(
						ordno, 
						rs.getString("ordDate"), 
						rs.getInt("ord_Count"), 
						rs.getInt("pno_Info"),
						rs.getString("sno"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return vo;
	}
	
	public OrderVO getLastOne(String sno) {
		sb.setLength(0);
		sb.append("SELECT ORDNO, ORDDATE, ORD_COUNT, PNO_INFO, SNO "
				+ "FROM ORDERS WHERE SNO = ? "
				+ "ORDER BY LENGTH(ORDNO) DESC, ORDNO DESC ");
		OrderVO vo = null;

		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, sno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				vo = new OrderVO(
						rs.getString("ordno"),
						rs.getString("ordDate"), 
						rs.getInt("ord_Count"), 
						rs.getInt("pno_Info"),
						sno);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return vo;
	}

	public void addOne(OrderVO vo) {
		
		sb.setLength(0);
		sb.append("insert into ORDERS values (?,NOW(),?,?,?)");
		/* 			 ORDNO, ORDDATE, ORD_COUNT, PNO_INFO, SNO */
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, vo.getOrdno());
				pstmt.setInt(2, vo.getOrdCount());
				pstmt.setInt(3, vo.getPnoInfo());
				pstmt.setString(5, vo.getSno());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteOne(String ordno) {
		sb.setLength(0);
		sb.append("DELETE FROM ORDERS WHERE ORDNO = ?");
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
				pstmt.setString(1, ordno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteDay(String yymmdd) {
		sb.setLength(0);
		sb.append("DELETE FROM ORDERS WHERE ORDNO LIKE ?");
		
		yymmdd += '%';
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
				pstmt.setString(1, yymmdd);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateCount(OrderVO vo) {
		sb.setLength(0);
		sb.append("UPDATE ORDERS SET ORD_COUNT = ? WHERE ORDNO = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			/*
			 * pstmt.setString(1, vo.getRegdate()); pstmt.setString(2, vo.getPNo());
			 */
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if (rs != null)	rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
