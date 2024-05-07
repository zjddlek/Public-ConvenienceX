package com.cx.www.vo;
 
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ProductAccountVO {
	String pNoAccount;
	String pName;
	int priceServer;
	String expirydate;
	String accNo;
}
