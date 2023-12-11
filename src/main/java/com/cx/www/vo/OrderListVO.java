package com.cx.www.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OrderListVO {
	private String mcno;
	private String scno;
	private String pnoAccount;
	private String pno;
	private int pnoInfo;
	private String ordno;
	private String ordDate;
	private int ordCount;
	private String sno;
	private String manudate;
	private int tCount;
	private String regdate;
	private int priceConsumer;
	private String pname;
	private int priceServer;
	private String expirydate;
	private String accno;
	private String scname;
	private String mcname;
	private String sname;

}
