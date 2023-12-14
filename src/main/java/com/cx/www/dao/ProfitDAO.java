package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.ProfitVO;

public class ProfitDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sb = new StringBuffer();

	public ProfitDAO() {
		conn = DBConnection.getConnection();
	}
	
	public ArrayList<ProfitVO> getList() { // 리스트 가져오기 - 시간별 정산
		ArrayList<ProfitVO> list = new ArrayList<ProfitVO>();
		ProfitVO vo = null;

		sb.setLength(0);		
		sb.append("SELECT * FROM CALCULATION ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			
			while (rs.next()) {

				int calno = rs.getInt("CALNO");
				String attno = rs.getString("ATTNO");
				int calculate = rs.getInt("CALCULATE");
				String caltime = rs.getString("CALTIME");
				int salesamount = rs.getInt("SALESAMOUNT");
				int difference = rs.getInt("DIFFERENCE");
				String day = rs.getString("DATE");
				String calday = rs.getString("CALDAY");
			
				vo = new ProfitVO(calno, attno, calculate, caltime, salesamount, difference, day, calday);

				list.add(vo);
				System.out.println(list);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<ProfitVO> getListDay() { // 리스트 가져오기 - 일자별 정산
		ArrayList<ProfitVO> list = new ArrayList<ProfitVO>();
		ProfitVO vo = null;
		
		sb.setLength(0);
		
		sb.append("SELECT DATE, SUM(CALTIME) CALDAY ");
		sb.append("FROM (SELECT ATTNO, SUM(CNT * PRICE_CONSUMER) CALTIME, SUBSTRING(SALEDATE,1,10) DATE ");
		sb.append("FROM (SELECT SA.SALENO, ATT.ATTNO, ATT.EMPNO, SA.SALEDATE ");
		sb.append("FROM SALES SA, ATTENDANCE ATT ");
		sb.append("WHERE SA.SALEDATE BETWEEN ATT.ATTSTART AND ATT.ATTEND) AA  ");
		sb.append("NATURAL JOIN SALES_DETAIL NATURAL JOIN STOCK NATURAL JOIN PRODUCT_INFO NATURAL JOIN PRODUCT ");
		sb.append("GROUP BY ATTNO) BB GROUP BY DATE ORDER BY DATE ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			
			while (rs.next()) {
				
				String day = rs.getString("DATE");
				String calday = rs.getString("CALDAY");
				
				vo = new ProfitVO(0, null, 0, null, 0, 0, day, calday);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<ProfitVO> getListDay( String yyyymm, String sno ) { // 리스트 가져오기 - 일자별 정산
		ArrayList<ProfitVO> list = new ArrayList<ProfitVO>();
		ProfitVO vo = null;
		
		sb.setLength(0);
		
		sb.append("select ifnull(a.day, b.seq) DATE, ifnull(a.calday,0) CALDAY ");
		sb.append("from (SELECT date_format(DATE,'%d') day , SUM(CALTIME) CALDAY ");
		sb.append("FROM (SELECT ATTNO, SUM(CNT * PRICE_CONSUMER) CALTIME, SUBSTRING(SALEDATE,1,10) DATE ");
		sb.append("FROM (SELECT SA.SALENO, ATT.ATTNO, ATT.EMPNO, SA.SALEDATE ");
		sb.append("FROM SALES SA, ATTENDANCE ATT  ");
		sb.append("WHERE SA.SALEDATE BETWEEN ATT.ATTSTART AND ATT.ATTEND) AA  ");
		sb.append("NATURAL JOIN SALES_DETAIL NATURAL JOIN STOCK NATURAL JOIN PRODUCT_INFO NATURAL JOIN PRODUCT  ");
		sb.append("WHERE AA.SALEDATE LIKE ? ");
		sb.append("AND SUBSTRING(STOCK.STOCKNO,1,5) = ? ");
		sb.append("GROUP BY ATTNO) BB GROUP BY DATE ORDER BY DATE ) a right outer join dummy b ");
		sb.append("on a.day =  b.seq ");

		/*sb.append("SELECT DATE, SUM(CALTIME) CALDAY ");
		sb.append("FROM (SELECT ATTNO, SUM(CNT * PRICE_CONSUMER) CALTIME, SUBSTRING(SALEDATE,1,10) DATE  ");
		sb.append("FROM (SELECT SA.SALENO, ATT.ATTNO, ATT.EMPNO, SA.SALEDATE ");
		sb.append("FROM SALES SA, ATTENDANCE ATT ");
		sb.append("WHERE SA.SALEDATE BETWEEN ATT.ATTSTART AND ATT.ATTEND) AA  ");
		sb.append("NATURAL JOIN SALES_DETAIL NATURAL JOIN STOCK NATURAL JOIN PRODUCT_INFO NATURAL JOIN PRODUCT ");
		sb.append("WHERE AA.SALEDATE LIKE ? ");
		sb.append("AND SUBSTRING(STOCK.STOCKNO,1,5) = ? ");
		sb.append("GROUP BY ATTNO) BB GROUP BY DATE ORDER BY DATE ");*/
		
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, yyyymm + "%");
			pstmt.setString(2, sno);
			
			rs = pstmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			
			while (rs.next()) {
				
				String day = rs.getString("DATE");
				String calday = rs.getString("CALDAY");
				
				vo = new ProfitVO(0, null, 0, null, 0, 0, day, calday);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public void addProfit(ProfitVO vo) {
		sb.setLength(0);
		sb.append("SELECT CALNO FROM CALCULATION ORDER BY CALNO DESC LIMIT 1;");
		int calno = 0;
		try {
			pstmt=conn.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
			calno = (rs.getInt("CALNO")+1);

			}
			sb.setLength(0); 
			sb.append("INSERT INTO CALCULATION VALUES(?, ?, ?, now(), ?, ?) ");
			
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, calno);
			pstmt.setString(2, vo.getATTNO());
			pstmt.setInt(3, vo.getCALCULATE());
			pstmt.setInt(4, vo.getSALESAMOUNT());
			pstmt.setInt(5, vo.getDIFFERENCE());
			
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
