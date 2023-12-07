package com.cx.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.Context;
import com.cx.www.dbconnection.DBConnection;
import com.cx.www.vo.SalesVO;

public class SalesDAO{
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private StringBuffer sb = new StringBuffer();
	
	ArrayList<SalesVO> list = new ArrayList<SalesVO>();
	SalesVO vo = null;
	
	public SalesDAO() {
		Context initCtx;
		
		// conn을 DBConnection의 getConnection()으로 지정 ---> DBConnection을 만들었으니까 가져다 쓰기!
		conn = DBConnection.getConnection();
		System.out.println("conn : " + conn);
	}
	
	// 날짜 변경시 해당 날짜 포함한 7일전 날짜만 리스트에 보여줌 
	public ArrayList<SalesVO> getDateList(String date){
		
		sb.setLength(0);
		sb.append(" select SALENO, substr(SALEDATE,1,10) as sdate, SALEDATE ");
		sb.append(" from SALES ");
		sb.append(" where substr(SALEDATE,1,10) <= ? ");
		sb.append(" GROUP BY SALEDATE ");
		sb.append(" ORDER by substr(SALEDATE,1,10) desc LIMIT 7 ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, date+"%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String saleno = rs.getString("saleno");
				String salesdate = rs.getString("SALEDATE");
				String sdate = rs.getString("sdate");
				
				SalesVO vo = new SalesVO(saleno, salesdate, sdate);
				
				System.out.println("saleno: " + saleno);
				System.out.println("salesdate : "+salesdate);
				System.out.println("sdate : "+sdate);
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	
	// 거래일자로 검색하기
	public ArrayList<SalesVO> getSalesList(String salesDate){
		
		sb.setLength(0);
		sb.append(" SELECT SD.DETAILNO, S.SALENO, S.SALEDATE, SD.DEALNO, (P.PRICE_CONSUMER *cnt ) COST, SUM(P.PRICE_CONSUMER * cnt ) TOTAL ");
		sb.append(" FROM SALES S ");
		sb.append(" JOIN SALES_DETAIL SD ON S.SALENO = SD.SALENO ");
		sb.append(" JOIN STOCK ST ON SD.STOCKNO = ST.STOCKNO ");
		sb.append(" JOIN PRODUCT_INFO PI ON ST.PNO_INFO = PI.PNO_INFO ");
		sb.append(" JOIN PRODUCT P ON PI.PNO = P.PNO ");
		sb.append(" JOIN PRODUCT_ACCOUNT PA ON PA.PNO_ACCOUNT = P.PNO_ACCOUNT ");
		sb.append(" WHERE S.SALEDATE LIKE ? ");
		sb.append(" GROUP BY S.SALENO ");
		sb.append(" ORDER BY S.SALEDATE DESC ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, salesDate+"%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String saleno = rs.getString("saleno");
				String salesdate = rs.getString("SALEDATE");
				int dealno = rs.getInt("dealno");
				int detailno = rs.getInt("DETAILNO");
				int cost = rs.getInt("cost");
				int total = rs.getInt("total");
				
				vo = new SalesVO(saleno, salesdate, null, null, 0, dealno, detailno, null, null, 0, cost, total);
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	// 거래번호로 검색하기
	public ArrayList<SalesVO> getDetailList(String num){
		
		sb.setLength(0);
		
		sb.append(" SELECT SD.DETAILNO, S.SALENO,(P.PRICE_CONSUMER *cnt ) COST, SD.STOCKNO, S.SALEDATE, PA.PNAME, SD.CNT, SD.ISREFUND, SD.DEALNO, P.PRICE_CONSUMER ");
		sb.append(" FROM SALES S ");
		sb.append(" JOIN SALES_DETAIL SD ON S.SALENO = SD.SALENO ");
		sb.append(" JOIN STOCK ST ON SD.STOCKNO = ST.STOCKNO ");
		sb.append(" JOIN PRODUCT_INFO PI ON ST.PNO_INFO = PI.PNO_INFO ");
		sb.append(" JOIN PRODUCT P ON PI.PNO = P.PNO ");
		sb.append(" JOIN PRODUCT_ACCOUNT PA ON PA.PNO_ACCOUNT = P.PNO_ACCOUNT ");
		sb.append(" WHERE S.SALENO LIKE ? ");
		sb.append(" ORDER BY S.SALEDATE DESC ");

		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, num+"%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String saleno = rs.getString("saleno");
				String salesdate = rs.getString("SALEDATE");
				String stockno = rs.getString("stockno");
				int cnt = rs.getInt("cnt");
				int dealno = rs.getInt("dealno");
				int detailno = rs.getInt("DETAILNO");
				String isrefund = rs.getString("isrefund");
				String pname = rs.getString("pname");
				int price_consumer = rs.getInt("price_consumer");
				int cost = rs.getInt("cost");
				
				vo = new SalesVO(saleno, salesdate, stockno, null, cnt, dealno, detailno, isrefund, pname, price_consumer, cost, 0);
				
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
			if ( rs != null ) {
				rs.close();
			}
			if ( pstmt != null ) {
				pstmt.close();
			}
			if ( conn != null ) {
				conn.close();
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 전체조회
	/*public ArrayList<SalesVO> getAll(){
		sb.setLength(0);
		
		sb.append(" select SALENO, SALEDATE ");
		sb.append(" from SALES ");
		sb.append(" GROUP BY SALEDATE ");
		sb.append(" ORDER by SALEDATE desc LIMIT 7 OFFSET 1 ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String saleno = rs.getString("saleno");
				String date = rs.getString("SALEDATE");
				
				String salesdate = date.substring(0, 10);
				
				SalesVO vo = new SalesVO(saleno, salesdate);
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	} */
}
