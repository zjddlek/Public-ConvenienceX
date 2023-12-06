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
	
	// SalesDetail
	private int cnt;	
	private int dealno;
	private int detailno;
	private String isrefund;
	private int pno_info;

	public SalesVO(String saleno, String salesdate) {
		this.saleno = saleno;
		this.salesdate = salesdate;
	}
}
