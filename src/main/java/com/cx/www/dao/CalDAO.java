package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.CalVO;
import com.cx.www.vo.DailySalesVO;

public class CalDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sb = new StringBuffer();
	
	public CalDAO() {
		conn = DBConnection.getConnection();
	}

	public ArrayList<CalVO> getCashCal(String empno) {
		sb.setLength(0);
		sb.append(
				"SELECT P.PNO, P.PRICE_CONSUMER,  PI.PNO_INFO, AA.CNT, AA.DEALNO, AA.SALEDATE "
				+ "FROM PRODUCT_INFO PI, PRODUCT P,  "
				+ "    (SELECT SAD.DETAILNO, SAD.SALENO, PI.PNO_INFO, SAD.CNT, SAD.ISREFUND, SAD.DEALNO, SA.SALEDATE "
				+ "    FROM SALES_DETAIL SAD, SALES SA, STOCK ST, PRODUCT_INFO PI"
				+ "    WHERE SAD.STOCKNO = ST.STOCKNO "
				+ "    AND ST.PNO_INFO = PI.PNO_INFO "
				+ "    AND SAD.SALENO = SA.SALENO  "
				+ "    AND SA.SALEDATE BETWEEN ( "
				+ "    SELECT ATT.ATTSTART  "
				+ "    FROM ATTENDANCE ATT, CXEMP CX  "
				+ "    WHERE ATT.EMPNO = CX.EMPNO  "
				+ "    AND CX.EMPNO = ? "
				+ "    ORDER BY ATT.ATTSTART DESC LIMIT 1 "
				+ "    ) AND NOW() ) AA  "
				+ "WHERE P.PNO = PI.PNO AND PI.PNO_INFO = AA.PNO_INFO AND DEALNO = 2 ");

		ArrayList<CalVO> list = new ArrayList<CalVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, empno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				CalVO vo = new CalVO(rs.getString("pno"), rs.getInt("price_consumer"), rs.getInt("pno_info"),
						rs.getInt("cnt"), rs.getInt("dealno"), rs.getString("saledate"));
				list.add(vo);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<CalVO> getGiftCal(String empno) {
		sb.setLength(0);
		sb.append(
				"SELECT P.PNO, P.PRICE_CONSUMER,  PI.PNO_INFO, AA.CNT, AA.DEALNO, AA.SALEDATE  "
				+ "FROM PRODUCT_INFO PI, PRODUCT P,   "
				+ "    (SELECT SAD.DETAILNO, SAD.SALENO, PI.PNO_INFO, SAD.CNT, SAD.ISREFUND, SAD.DEALNO, SA.SALEDATE  "
				+ "    FROM SALES_DETAIL SAD, SALES SA, STOCK ST, PRODUCT_INFO PI "
				+ "    WHERE SAD.STOCKNO = ST.STOCKNO  "
				+ "    AND ST.PNO_INFO = PI.PNO_INFO  "
				+ "    AND SAD.SALENO = SA.SALENO   "
				+ "    AND SA.SALEDATE BETWEEN (  "
				+ "    SELECT ATT.ATTSTART   "
				+ "    FROM ATTENDANCE ATT, CXEMP CX   "
				+ "    WHERE ATT.EMPNO = CX.EMPNO   "
				+ "    AND CX.EMPNO = ? "
				+ "    ORDER BY ATT.ATTSTART DESC LIMIT 1  "
				+ "    ) AND NOW() ) AA   "
				+ "WHERE P.PNO = PI.PNO AND PI.PNO_INFO = AA.PNO_INFO AND DEALNO = 3 ");

		ArrayList<CalVO> list = new ArrayList<CalVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, empno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				CalVO vo = new CalVO(rs.getString("pno"), rs.getInt("price_consumer"), rs.getInt("pno_info"),
						rs.getInt("cnt"), rs.getInt("dealno"), rs.getString("saledate"));
				list.add(vo);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<CalVO> getCardCal(String empno) {
		sb.setLength(0);
		sb.append(
				"SELECT P.PNO, P.PRICE_CONSUMER,  PI.PNO_INFO, AA.CNT, AA.DEALNO, AA.SALEDATE  "
				+ "FROM PRODUCT_INFO PI, PRODUCT P,   "
				+ "    (SELECT SAD.DETAILNO, SAD.SALENO, PI.PNO_INFO, SAD.CNT, SAD.ISREFUND, SAD.DEALNO, SA.SALEDATE  "
				+ "    FROM SALES_DETAIL SAD, SALES SA, STOCK ST, PRODUCT_INFO PI "
				+ "    WHERE SAD.STOCKNO = ST.STOCKNO  "
				+ "    AND ST.PNO_INFO = PI.PNO_INFO  "
				+ "    AND SAD.SALENO = SA.SALENO   "
				+ "    AND SA.SALEDATE BETWEEN (  "
				+ "    SELECT ATT.ATTSTART   "
				+ "    FROM ATTENDANCE ATT, CXEMP CX   "
				+ "    WHERE ATT.EMPNO = CX.EMPNO   "
				+ "    AND CX.EMPNO = ? "
				+ "    ORDER BY ATT.ATTSTART DESC LIMIT 1  "
				+ "    ) AND NOW() ) AA   "
				+ "WHERE P.PNO = PI.PNO AND PI.PNO_INFO = AA.PNO_INFO AND DEALNO = 1 ");

		ArrayList<CalVO> list = new ArrayList<CalVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, empno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				CalVO vo = new CalVO(rs.getString("pno"), rs.getInt("price_consumer"), rs.getInt("pno_info"),
						rs.getInt("cnt"), rs.getInt("dealno"), rs.getString("saledate"));
				list.add(vo);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
		
	public ArrayList<DailySalesVO> dailyCal(String sno) {
		sb.setLength(0);
		sb.append(
				"SELECT C.ATTNO, C.SALESAMOUNT, E.EMPNO, S.SNO, C.CALTIME, C.CALCULATE, DAYOFWEEK(C.CALTIME) DAYNUM, DAYNAME(C.CALTIME) "
				+ "FROM SHOP S JOIN CXEMP E ON S.SNO=E.SNO JOIN ATTENDANCE A ON E.EMPNO=A.EMPNO JOIN CALCULATION C ON A.ATTNO=C.ATTNO "
				+ "WHERE S.SNO = ? AND C.CALCULATE = 2 "
				+ "AND CALTIME >= (SELECT DISTINCT(SUBSTRING(CALTIME,1,10)) DATE FROM CALCULATION WHERE DAYOFWEEK(CALTIME) = 1 AND CALTIME >= DATE_SUB('2023-11-11', INTERVAL 14 DAY) ORDER BY CALTIME LIMIT 1) "
				+ "ORDER BY CALTIME ");

		ArrayList<DailySalesVO> list = new ArrayList<DailySalesVO>();
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, sno);

			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				DailySalesVO vo = new DailySalesVO(rs.getInt("C.SALESAMOUNT"), rs.getString("E.EMPNO"), sno, rs.getString("C.CALTIME"), rs.getInt("C.CALCULATE"), rs.getInt("DAYNUM"));
				list.add(vo);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
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
