package com.cx.www.vo;
 
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DiscardVO {
	String discardNo;
	String stockNO;
	String sno;
	String discardDate;
	String manuDate;
	String pname;
	String accName;
	int discardCount;
	int priceServer;
	int sum;
}
