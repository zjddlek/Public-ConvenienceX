package com.cx.www.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
 
@Data
@NoArgsConstructor
@AllArgsConstructor
public class StockVO {
	private String stockNo;
	private int stockCount;
	private String pnoInfo;
	private String warehousedate; // 입고일자
	
	private String pname; // 상품명
	private String mcName;
	private String scName;
	private String mcNo;
	private String scNo;
	private int price_consumer;
	
}
