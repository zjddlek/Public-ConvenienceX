package com.cx.www.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AllProductVO {
	String mcName;
	String scName;
	String accName;
	String pName;
	String expirydate;
	int priceServer;
	int priceConsumer;
	String regdate;
}
