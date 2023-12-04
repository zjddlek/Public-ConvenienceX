package com.cx.www.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SalesVO {
	private String saleno;
	private String salesdate;
	private String stockno;
	
	//sales_detail
	private int cnt;	
	private int dealno;
	private int detailno;
	private String isrefund;
	private int pno_info;
	

	// SALE_COUNT 오류 때문에 추가함
	public SalesVO(String saleno, String salesdate, String stockno) {
		this.saleno = saleno;
		this.salesdate = salesdate;
		this.stockno = stockno;
	}
}
