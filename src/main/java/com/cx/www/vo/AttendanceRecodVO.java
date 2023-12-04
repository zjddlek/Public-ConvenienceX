package com.cx.www.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttendanceRecodVO {
	String ename;
	int jobno;
	String attstart;
	String attend;
	String empno;
}
