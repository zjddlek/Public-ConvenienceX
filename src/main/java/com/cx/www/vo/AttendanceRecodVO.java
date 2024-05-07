package com.cx.www.vo;
 
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AttendanceRecodVO {
	private String ename;
	private int jobno;
	private String attstart;
	private String attend;
	private String empno;
	private String sno;
}
