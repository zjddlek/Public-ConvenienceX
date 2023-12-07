package com.cx.www.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SalesVO {
	// Sales
	private String saleno;
	private String salesdate;
	private String stockno;
	private String sdate;
	
	// SalesDetail
	private int cnt;	
	private int dealno;
	private int detailno;
	private String isrefund;
	
	// 추가
	private String pname;
	private int price_consumer;
	private int cost;
	private int total;
	

	// 전체 조회용
	public SalesVO(String saleno, String salesdate) {
		this.saleno = saleno;
		this.salesdate = salesdate;
	}

	// 날짜 변경시 조회용
	public SalesVO(String saleno, String salesdate, String sdate) {
		this.saleno = saleno;
		this.salesdate = salesdate;
		this.sdate = sdate;
		
	}
}
