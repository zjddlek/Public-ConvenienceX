package com.cx.www.vo;
 
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ExpiredItemsVO {
	int stockNO;
	int pnoInfo;
	String pname;
	int stockCount;
	int salesSum;
	int remainCount;
	String manudate;
	String warehouseDate;
	String expiryEndDate;
	
}
