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
	
		 //System.out.println("conn : " +conn);
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
	
	// 재고리스트 메인
	public ArrayList<StockVO> getAllStock(String sno) {
		ArrayList<StockVO> list = new ArrayList<StockVO>();
		StockVO vo = null;
		
		sb.setLength(0);
		
		sb.append(" SELECT MCNAME, SCNAME, MCNO, SCNO, STOCKNO, PNAME, PRICE_CONSUMER, REALSTOCK, PNO_INFO, WAREHOUSEDATE FROM  "
				+ "(SELECT STOCKNO, STCNT-SADCNT-DISCNT REALSTOCK FROM "
				+ "(SELECT ST.STOCKNO, ST.CNT STCNT, IFNULL(SAD.CNT, 0) SADCNT, IFNULL(DIS.CNT, 0) DISCNT FROM "
				+ "(SELECT STOCKNO, STOCK_COUNT CNT FROM STOCK WHERE SUBSTRING(STOCKNO, 1, 5) = ?) ST "
				+ "LEFT JOIN (SELECT STOCKNO, CNT FROM SALES_DETAIL WHERE SUBSTRING(STOCKNO, 1, 5) = ? GROUP BY STOCKNO) SAD ON ST.STOCKNO = SAD.STOCKNO "
				+ "LEFT JOIN (SELECT STOCKNO, DISCARD_COUNT CNT FROM DISCARD WHERE SUBSTRING(STOCKNO, 1, 5) = ?) DIS ON ST.STOCKNO = DIS.STOCKNO) AA "
				+ "WHERE STCNT-SADCNT-DISCNT > 0) BB NATURAL JOIN STOCK ST NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT P NATURAL JOIN SUB_CATEGORY SC NATURAL JOIN MAJOR_CATEGORY NATURAL JOIN PRODUCT_ACCOUNT "
				+ "ORDER BY LENGTH(STOCKNO), STOCKNO ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, sno);
			pstmt.setString(2, sno);
			pstmt.setString(3, sno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String stockNo = rs.getString("STOCKNO");
				int stockCount = rs.getInt("REALSTOCK");
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
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	// 재고리스트 중분류 선택시 작동
	public ArrayList<StockVO> getSelectAllStockNo(String scno, String sno) {
		ArrayList<StockVO> list = new ArrayList<StockVO>();
		StockVO vo = null;
		
		sb.setLength(0);
		
		sb.append(" SELECT MCNAME, SCNAME, MCNO, SCNO, STOCKNO, PNAME, PRICE_CONSUMER, REALSTOCK, PNO_INFO, WAREHOUSEDATE FROM  "
				+ "(SELECT STOCKNO, STCNT-SADCNT-DISCNT REALSTOCK FROM "
				+ "(SELECT ST.STOCKNO, ST.CNT STCNT, IFNULL(SAD.CNT, 0) SADCNT, IFNULL(DIS.CNT, 0) DISCNT FROM "
				+ "(SELECT STOCKNO, STOCK_COUNT CNT FROM STOCK WHERE SUBSTRING(STOCKNO, 1, 5) = ?) ST "
				+ "LEFT JOIN (SELECT STOCKNO, CNT FROM SALES_DETAIL WHERE SUBSTRING(STOCKNO, 1, 5) = ? GROUP BY STOCKNO) SAD ON ST.STOCKNO = SAD.STOCKNO "
				+ "LEFT JOIN (SELECT STOCKNO, DISCARD_COUNT CNT FROM DISCARD WHERE SUBSTRING(STOCKNO, 1, 5) = ?) DIS ON ST.STOCKNO = DIS.STOCKNO) AA "
				+ "WHERE STCNT-SADCNT-DISCNT > 0) BB NATURAL JOIN STOCK ST NATURAL JOIN PRODUCT_INFO  "
				+ "NATURAL JOIN PRODUCT P NATURAL JOIN SUB_CATEGORY SC NATURAL JOIN MAJOR_CATEGORY NATURAL JOIN PRODUCT_ACCOUNT "
				+ "WHERE SCNO = ? "
				+ "ORDER BY LENGTH(STOCKNO), STOCKNO ");
				
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, sno);
			pstmt.setString(2, sno);
			pstmt.setString(3, sno);
			pstmt.setString(4, scno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String stockNo = rs.getString("STOCKNO");
				int stockCount = rs.getInt("REALSTOCK");
				String pnoInfo = rs.getString("PNO_INFO");
				String warehousedate = rs.getString("WAREHOUSEDATE");
				String pname = rs.getString("pname");
				String mcName = rs.getString("mcName");
				String scName = rs.getString("scName");
				String mcNo = rs.getString("mcNo");
				int price_consumer = rs.getInt("PRICE_CONSUMER");
				
				vo = new StockVO(stockNo, stockCount, pnoInfo, warehousedate, pname, mcName, scName, mcNo, scno, price_consumer);
				list.add(vo);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 재고 리스트 검색 
	public ArrayList<StockVO> getSearch(String pname) {
		
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
		sb.append(" WHERE PA.PNAME LIKE ? ");
		sb.append(" group by ST.STOCKNO ");
		sb.append(" order by length(ST.STOCKNO), ST.STOCKNO ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, "%" + pname + "%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String stockNo = rs.getString("STOCKNO");
				String Pname = rs.getString("PNAME");
				int stockCount = rs.getInt("STOCK_COUNT");
				String pnoInfo = rs.getString("PNO_INFO");
				String warehousedate = rs.getString("WAREHOUSEDATE");
				String mcName = rs.getString("mcName");
				String scName = rs.getString("scName");
				int price_consumer = rs.getInt("PRICE_CONSUMER");
				
				vo = new StockVO(stockNo, stockCount, pnoInfo, warehousedate, Pname, mcName, scName, null, null, price_consumer);
				list.add(vo);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;	
	}
	
	// 재고 리스트 검색 + 점포만
	public ArrayList<StockVO> getSearch(String pname, String sno) {
		
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
		sb.append(" WHERE PA.PNAME LIKE ?  AND SUBSTRING(ST.STOCKNO,1,5) = ? ");
		sb.append(" group by ST.STOCKNO ");
		sb.append(" order by length(ST.STOCKNO), ST.STOCKNO ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, "%" + pname + "%");
			pstmt.setString(2, sno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String stockNo = rs.getString("STOCKNO");
				String Pname = rs.getString("PNAME");
				int stockCount = rs.getInt("STOCK_COUNT");
				String pnoInfo = rs.getString("PNO_INFO");
				String warehousedate = rs.getString("WAREHOUSEDATE");
				String mcName = rs.getString("mcName");
				String scName = rs.getString("scName");
				int price_consumer = rs.getInt("PRICE_CONSUMER");
				
				vo = new StockVO(stockNo, stockCount, pnoInfo, warehousedate, Pname, mcName, scName, null, null, price_consumer);
				list.add(vo);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;	
	}//method end
	
	
	// 카운트
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("select count(*) as cnt from STOCK ");
		
		// 카운트 초기화
		int count = 0;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			rs.next();
			count = rs.getInt("cnt");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return count;
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
