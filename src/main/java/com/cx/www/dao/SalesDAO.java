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
		
		System.out.println("dao salesdate : " +date);
		
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
		
		System.out.println("dao salesDate : " +salesDate);
		
		sb.setLength(0);
		sb.append(" SELECT SD.DETAILNO, S.SALENO, S.SALEDATE, SD.DEALNO, (P.PRICE_CONSUMER *cnt ) COST");
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
				
				vo = new SalesVO(saleno, salesdate, null, null, 0, dealno, detailno, null, null, 0, cost);
				
				System.out.println("dao vo : " + vo);
				
				list.add(vo);
				
				System.out.println("dao list : " + list);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	// 거래번호로 검색하기
	public ArrayList<SalesVO> getDetailList(String num){
		
		System.out.println("dao num : " +num);
		
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
				
				vo = new SalesVO(saleno, salesdate, stockno, null, cnt, dealno, detailno, isrefund, pname, price_consumer, cost);
				
				System.out.println("dao vo : " + vo);
				
				list.add(vo);
				
				System.out.println("dao list : " + list);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	//거래일자로 검색하기
	/*public SalesDetailVO getSalesDetail(String saleno){
		
		//salesdate += "%";
		
		sb.setLength(0);
		sb.append(" select sd.DETAILNO, sd.SALENO, sd.PNO_INFO, sd.CNT, sd.ISREFUND, sd.DEALNO, s.SALEDATE ");
		sb.append(" from SALES_DETAIL sd ");
		sb.append(" RIGHT JOIN SALES s ");
		sb.append(" ON sd.? = s.? ");
		sb.append(" WHERE s.SALEDATE LIKE = ? ");
		
		/*
  	    -- 거래번호로 검색하기 ( 
  	    select SALES_DETAIL.DETAILNO, SALES.SALENO, SALES_DETAIL.PNO_INFO, SALES_DETAIL.CNT, SALES_DETAIL.ISREFUND, SALES_DETAIL.DEALNO,
        PRODUCT_ACCOUNT.PNAME, PRODUCT_ACCOUNT.PRICE_SERVER
		from SALES_DETAIL 
		JOIN SALES ON SALES_DETAIL.SALENO = SALES.SALENO
		join STOCK on STOCK.STOCKNO = SALES.STOCKNO
		join PRODUCT_INFO on PRODUCT_INFO.PNO_INFO = STOCK.PNO_INFO
		join PRODUCT on PRODUCT.PNO = PRODUCT_INFO.PNO 
		join PRODUCT_ACCOUNT on PRODUCT_ACCOUNT.PNO_ACCOUNT = PRODUCT.PNO_ACCOUNT 
		join ACCOUNTS on PRODUCT_ACCOUNT.ACCNO = ACCOUNTS.ACCNO
		where SALES_DETAIL.SALENO = '23110501'; 
		* /
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setString(1, saleno);
			pstmt.setString(2, saleno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String stockno = rs.getString("stockno");
				int dealno = rs.getInt("dealno");
				int pno_info = rs.getInt("PNO_INFO");
				int detailno = rs.getInt("DETAILNO");
				String isrefund = rs.getString("isrefund");
				int cnt = rs.getInt("cnt");
				String salesdate = rs.getString("salesdate");
				
				vo2 = new SalesDetailVO(dealno, pno_info, detailno, isrefund, cnt);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo2;
	} */
	
	
	public void close() {
		try {
		
			if(rs != null) {
				rs.close();
			}	
			if(conn != null) {
				conn.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int getTotalCount() {
		sb.setLength(0);
		sb.append("select count(*) as cnt from SALES ");
		
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
