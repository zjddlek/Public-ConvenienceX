package com.cx.www.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProfitVO {

	private int calno; // 정산번호
	private String attno; // 근태관리번호
	private int calculate; // 정산종류
	private String caldate; // 정산시간
	private int salesamount; // 매출액
	private int difference; // 차액
	
}
