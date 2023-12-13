package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.DiscardMonthVO;
import com.cx.www.vo.DiscardVO;
import com.cx.www.vo.ExpiredItemsVO;

public class DiscardDAO {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	StringBuffer sb = new StringBuffer();
	
	public DiscardDAO() {
		conn = DBConnection.getConnection();
		 System.out.println("conn : " +conn);
	}
	
	public ArrayList<DiscardVO> getOneday(String discardDate, String sno) {
		ArrayList<DiscardVO> list = new ArrayList<DiscardVO>();
		DiscardVO vo = null;
		discardDate += "%";
		sb.setLength(0);
		sb.append("select DISCARD.DISCARDNO, STOCK.STOCKNO, SUBSTRING(STOCK.STOCKNO,1,5) AS SNO, DISCARD.DISCARD_DATE, PRODUCT_INFO.MANUDATE, PRODUCT_ACCOUNT.PNAME, ACCOUNTS.ACCNAME, DISCARD.DISCARD_COUNT, PRODUCT_ACCOUNT.PRICE_SERVER, DISCARD.DISCARD_COUNT * PRODUCT_ACCOUNT.PRICE_SERVER as sum "
				+ "from STOCK join DISCARD on STOCK.STOCKNO = DISCARD.STOCKNO "
				+ "join PRODUCT_INFO on PRODUCT_INFO.PNO_INFO = STOCK.PNO_INFO "
				+ "join PRODUCT on PRODUCT.PNO = PRODUCT_INFO.PNO "
				+ "join PRODUCT_ACCOUNT on PRODUCT_ACCOUNT.PNO_ACCOUNT = PRODUCT.PNO_ACCOUNT "
				+ "join ACCOUNTS on PRODUCT_ACCOUNT.ACCNO = ACCOUNTS.ACCNO "
				+ "where DISCARD_DATE like ? AND SUBSTRING(STOCK.STOCKNO,1,5) = ?");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, discardDate);
			pstmt.setString(2, sno);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String discardNo = rs.getString("DISCARDNO");
				String stockNO = rs.getString("STOCKNO");
				String manuDate = rs.getString("MANUDATE");
				String pname = rs.getString("PNAME");
				String accName = rs.getString("ACCNAME");
				int discardCount = rs.getInt("DISCARD_COUNT");
				int priceServer = rs.getInt("PRICE_SERVER");
				int sum = rs.getInt("sum");
				
				vo = new DiscardVO(discardNo, stockNO, sno, discardDate, manuDate, pname, accName, discardCount, priceServer, sum);
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	
	public ArrayList<DiscardMonthVO> getOneMonth(String date, String sno){
		
		ArrayList<DiscardMonthVO> listMonth = new ArrayList<DiscardMonthVO>();
		DiscardMonthVO vo = null;
		
		date += "%"; 
		sb.setLength(0);
		
		sb.append("SELECT LEFT(DISCARD.DISCARD_DATE, 10) AS DISCARD_DATE, SUM(DISCARD_COUNT) AS SUM, SUM(PRODUCT_ACCOUNT.PRICE_SERVER * DISCARD.DISCARD_COUNT) AS TOTALSUM, SUBSTRING(STOCK.STOCKNO,1,5) AS SNO FROM DISCARD "
				+ "join STOCK ON STOCK.STOCKNO = DISCARD.STOCKNO "
				+ "join PRODUCT_INFO on PRODUCT_INFO.PNO_INFO = STOCK.PNO_INFO "
				+ "join PRODUCT on PRODUCT.PNO = PRODUCT_INFO.PNO "
				+ "join PRODUCT_ACCOUNT on PRODUCT_ACCOUNT.PNO_ACCOUNT = PRODUCT.PNO_ACCOUNT "
				+ "where DISCARD.DISCARD_DATE like ? and SUBSTRING(STOCK.STOCKNO,1,5) = ? "
				+ "GROUP BY DISCARD.DISCARD_DATE ORDER BY DISCARD.DISCARD_DATE");
		
		try {
			pstmt= conn.prepareStatement(sb.toString());
			pstmt.setString(1, date);
			pstmt.setString(2, sno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String discardDate = rs.getString("DISCARD_DATE");
				int sum = rs.getInt("sum");
				int totalsum = rs.getInt("totalsum");
				
				vo = new DiscardMonthVO(discardDate, sum, totalsum);
				listMonth.add(vo);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return listMonth;
	}
	
	public ArrayList<ExpiredItemsVO> searchExpredItems(String sno){
		ArrayList<ExpiredItemsVO> list = new ArrayList<ExpiredItemsVO>();
		ExpiredItemsVO vo = null;
		
		sb.setLength(0);
		sb.append("select m.STOCKNO, m.SNO, m.PNO_INFO, m.PNAME, m.STOCK_COUNT, m.SALES_SUM, m.REMAIN_CNT, IFNULL(m.DISCARD_COUNT,0) AS DISCARD_COUNT , m.MANUDATE, m.WAREHOUSEDATE, m.EXPIRY_ENDDATE "
				+ "from (select STOCK.STOCKNO, SUBSTRING(STOCK.STOCKNO,1,5) AS SNO, PRODUCT_INFO.PNO_INFO, PRODUCT_ACCOUNT.PNAME, STOCK.STOCK_COUNT, SUM(SALES_DETAIL.CNT) AS SALES_SUM, STOCK.STOCK_COUNT - SUM(SALES_DETAIL.CNT) AS REMAIN_CNT, "
				+ "DISCARD.DISCARD_COUNT, PRODUCT_ACCOUNT.PRICE_SERVER, PRODUCT_INFO.MANUDATE, STOCK.WAREHOUSEDATE, DATE_ADD(PRODUCT_INFO.MANUDATE, INTERVAL PRODUCT_ACCOUNT.EXPIRYDATE DAY) AS EXPIRY_ENDDATE "
				+ "from STOCK "
				+ "join PRODUCT_INFO on PRODUCT_INFO.PNO_INFO = STOCK.PNO_INFO "
				+ "join PRODUCT on PRODUCT.PNO = PRODUCT_INFO.PNO "
				+ "join PRODUCT_ACCOUNT on PRODUCT_ACCOUNT.PNO_ACCOUNT = PRODUCT.PNO_ACCOUNT "
				+ "join ACCOUNTS on ACCOUNTS.ACCNO = PRODUCT_ACCOUNT.ACCNO "
				+ "join SALES_DETAIL on SALES_DETAIL.STOCKNO = STOCK.STOCKNO "
				+ "left join DISCARD on DISCARD.STOCKNO = STOCK.STOCKNO "
				+ "where PRODUCT_ACCOUNT.EXPIRYDATE is not null "
				+ "and SUBSTRING(STOCK.STOCKNO,1,5)=? "
				+ "group by STOCKNO "
				+ "order by EXPIRY_ENDDATE) AS m "
				+ "where m.REMAIN_CNT != IFNULL(m.DISCARD_COUNT,0) "
				+ "and m.EXPIRY_ENDDATE< CURDATE()");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, sno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int stockNO = rs.getInt("STOCKNO");
				int pNoInfo = rs.getInt("PNO_INFO");
				String pName = rs.getString("PNAME");
				int stockCount = rs.getInt("STOCK_COUNT");
				int salesSum = rs.getInt("SALES_SUM");
				int remainCount = rs.getInt("REMAIN_CNT");
				String manudate = rs.getString("MANUDATE");
				String warehouseDate = rs.getString("WAREHOUSEDATE");
				String expiryEndDate = rs.getString("EXPIRY_ENDDATE");
				
				vo = new ExpiredItemsVO(stockNO, pNoInfo, pName, stockCount, salesSum, remainCount, manudate, warehouseDate, expiryEndDate);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
	
	public void exporedInsert(ArrayList<ExpiredItemsVO> list, String sno) {
		sb.setLength(0);
		sb.append("insert into DISCARD (DISCARD_COUNT, STOCKNO, DISCARD_DATE) ");
		sb.append("select m.REMAIN_CNT, m.STOCKNO, NOW() "
				+ "from (select STOCK.STOCKNO, SUBSTRING(STOCK.STOCKNO,1,5) AS SNO, PRODUCT_INFO.PNO_INFO, PRODUCT_ACCOUNT.PNAME, STOCK.STOCK_COUNT, SUM(SALES_DETAIL.CNT) AS SALES_SUM, STOCK.STOCK_COUNT - SUM(SALES_DETAIL.CNT) AS REMAIN_CNT, "
				+ "DISCARD.DISCARD_COUNT, PRODUCT_ACCOUNT.PRICE_SERVER, PRODUCT_INFO.MANUDATE, STOCK.WAREHOUSEDATE, DATE_ADD(PRODUCT_INFO.MANUDATE, INTERVAL PRODUCT_ACCOUNT.EXPIRYDATE DAY) AS EXPIRY_ENDDATE "
				+ "from STOCK "
				+ "join PRODUCT_INFO on PRODUCT_INFO.PNO_INFO = STOCK.PNO_INFO "
				+ "join PRODUCT on PRODUCT.PNO = PRODUCT_INFO.PNO "
				+ "join PRODUCT_ACCOUNT on PRODUCT_ACCOUNT.PNO_ACCOUNT = PRODUCT.PNO_ACCOUNT "
				+ "join ACCOUNTS on ACCOUNTS.ACCNO = PRODUCT_ACCOUNT.ACCNO "
				+ "join SALES_DETAIL on SALES_DETAIL.STOCKNO = STOCK.STOCKNO "
				+ "left join DISCARD on DISCARD.STOCKNO = STOCK.STOCKNO "
				+ "where PRODUCT_ACCOUNT.EXPIRYDATE is not null "
				+ "and SUBSTRING(STOCK.STOCKNO,1,5)=? "
				+ "group by STOCKNO "
				+ "order by EXPIRY_ENDDATE) AS m "
				+ "where m.REMAIN_CNT != IFNULL(m.DISCARD_COUNT,0) "
				+ "and m.EXPIRY_ENDDATE< CURDATE()");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, sno);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
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
				e.printStackTrace();
			}
	}	
	
}//class end
