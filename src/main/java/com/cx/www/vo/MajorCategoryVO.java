package com.cx.www.vo;
 
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MajorCategoryVO {
	private String mcNo;
	private String mcName;
	private String scNo;
}
