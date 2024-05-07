package com.cx.www.vo;
 
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderVO {
	String ordno;
	String ordDate;
	int ordCount;
	int pnoInfo;
	String sno;
}
