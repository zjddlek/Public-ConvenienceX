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
				String warehousedate = rs.getString("warehousedate");
				
				vo = new StockVO(stockNo, stockCount, pnoInfo, warehousedate, null, null, null, null, null, 0);
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;	
	}//method end
	
	// 재고 리스트용
	public ArrayList<StockVO> getAllStockNo(String scno) {
		System.out.println("dao : " +scno);
		
		ArrayList<StockVO> list = new ArrayList<StockVO>();
		StockVO vo = null;
		
		sb.setLength(0);
		
		sb.append(" select ST.STOCKNO, MC.MCNAME, SC.SCNAME, PA.PNAME, P.PRICE_CONSUMER, ST.STOCK_COUNT, ST.PNO_INFO, ST.WAREHOUSEDATE  ");
		sb.append(" FROM MAJOR_CATEGORY MC ");
		sb.append(" JOIN SUB_CATEGORY SC ON MC.MCNO = SC.MCNO ");
		sb.append(" JOIN PRODUCT P ON SC.SCNO = P.SCNO ");
		sb.append(" JOIN PRODUCT_ACCOUNT PA ON P.PNO_ACCOUNT = PA.PNO_ACCOUNT ");		
		sb.append(" JOIN PRODUCT_INFO PI ON P.PNO = PI.PNO ");		
		sb.append(" JOIN STOCK ST ON PI.PNO_INFO = ST.PNO_INFO ");
		sb.append(" WHERE SC.SCNO = ? ");
		sb.append(" order by length(STOCKNO), STOCKNO ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, scno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String stockNo = rs.getString("STOCKNO");
				int stockCount = rs.getInt("STOCK_COUNT");
				String pnoInfo = rs.getString("PNO_INFO");
				String warehousedate = rs.getString("WAREHOUSEDATE");
				String pname = rs.getString("pname");
				String mcName = rs.getString("mcName");
				String scName = rs.getString("scName");
				int price_consumer = rs.getInt("PRICE_CONSUMER");
				
				vo = new StockVO(stockNo, stockCount, pnoInfo, warehousedate, pname, mcName, scName, null, null, price_consumer);
				list.add(vo);
				
				System.out.println("dao : "+list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;	
	}//method end
	
	// 재고리스트 메인
	public ArrayList<StockVO> getAllStock() {
		ArrayList<StockVO> list = new ArrayList<StockVO>();
		StockVO vo = null;
		
		sb.setLength(0);
		
		sb.append(" select MC.MCNAME, SC.SCNAME, MC.MCNO, SC.SCNO, ST.STOCKNO, PA.PNAME, P.PRICE_CONSUMER, ST.STOCK_COUNT, ST.PNO_INFO, ST.WAREHOUSEDATE ");
		sb.append(" FROM MAJOR_CATEGORY MC ");
		sb.append(" JOIN SUB_CATEGORY SC ON MC.MCNO = SC.MCNO ");
		sb.append(" JOIN PRODUCT P ON SC.SCNO = P.SCNO ");
		sb.append(" JOIN PRODUCT_ACCOUNT PA ON P.PNO_ACCOUNT = PA.PNO_ACCOUNT ");
		sb.append(" JOIN PRODUCT_INFO PI ON P.PNO = PI.PNO ");
		sb.append(" JOIN STOCK ST ON PI.PNO_INFO = ST.PNO_INFO ");
		sb.append(" group by ST.STOCKNO ");
		sb.append(" order by length(ST.STOCKNO), ST.STOCKNO ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String stockNo = rs.getString("STOCKNO");
				int stockCount = rs.getInt("STOCK_COUNT");
				String pnoInfo = rs.getString("PNO_INFO");
				String warehousedate = rs.getString("WAREHOUSEDATE");
				String pname = rs.getString("pname");
				String mcName = rs.getString("mcName");
				String scName = rs.getString("scName");
				String mcNo = rs.getString("mcNo");
				String scNo = rs.getString("scNo");
				int price_consumer = rs.getInt("PRICE_CONSUMER");
				
				vo = new StockVO(stockNo, stockCount, pnoInfo, warehousedate, pname, mcName, scName, mcNo, scNo, price_consumer);
				list.add(vo);
				
				System.out.println("dao : "+list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
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
