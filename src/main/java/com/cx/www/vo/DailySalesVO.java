package com.cx.www.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DailySalesVO implements Serializable{
	int saleamount;
	String empno;
	String sno;
	String caltime;
	int claculate;
	int daynum;
	
	
	
}
