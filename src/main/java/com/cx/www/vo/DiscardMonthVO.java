package com.cx.www.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DiscardMonthVO {
	String discardDate;
	int sum;
	int totalsum;
}
