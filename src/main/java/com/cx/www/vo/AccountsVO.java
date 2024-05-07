package com.cx.www.vo;
 
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class AccountsVO {
	String accNo;
	String accName;
	String accCeo;
	String accCeoPhone;
	String accHead;
	String accHeadPhone;
	String accLoc;
	String accStorageLoc;
}
