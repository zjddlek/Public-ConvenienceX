package com.cx.www.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class ProfitVO {

	private int CALNO; // 정산번호
	private String ATTNO; // 근태관리번호
	private int CALCULATE; // 정산종류
	private String CALTIME; // 정산시간
	private int SALESAMOUNT; // 매출액
	private int DIFFERENCE; // 차액
	private String date; // 정산시간
	private String calday; // 정산시간
	
}
