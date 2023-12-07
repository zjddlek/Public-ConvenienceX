package com.cx.www.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductVO {
	String pNo;
	String regdate;
	int priceConsumer;
	String pNoAccount;
	String scNo;
	String mcNo;
}
