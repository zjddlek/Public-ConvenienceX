package com.cx.www.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DailySalesVO {
	int saleamount;
	String empno;
	String sno;
	String caltime;
	int claculate;
	int daynum;
	
	
	
}
