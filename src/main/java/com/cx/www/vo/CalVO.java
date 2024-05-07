package com.cx.www.vo;
 
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CalVO {
	private String pno;
	private int price;
	private int pno_info;
	private int cnt;
	private int dealno;
	private String saledate;
}
