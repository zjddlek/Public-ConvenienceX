package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.StockVO;

public class StockDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	StringBuffer sb = new StringBuffer();

	public StockDAO() {
		conn = DBConnection.getConnection();
	
		 System.out.println("conn : " +conn);
	}
	
	
	public ArrayList<StockVO> GetAll(String sno) {
		ArrayList<StockVO> list = new ArrayList<StockVO>();
		StockVO vo = null;
		
		sb.setLength(0);
		
		/* sb.append("SELECT STOCKNO, STOCK_COUNT, PNO_INFO FROM STOCK"); */
		sb.append("SELECT * FROM STOCK WHERE = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, sno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String stockNo = rs.getString("STOCKNO");
				int stockCount = rs.getInt("STOCK_COUNT");
				String pnoInfo = rs.getString("PNO_INFO");
				
				vo=new StockVO(stockNo, stockCount, pnoInfo);
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;	
	}//method end
	
	
	
	
	
	
	
	public void close() {

		try {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}// class end
