package com.cx.www.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
 
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SubCategoryVO implements Serializable{
	private String scNo;
	private String mcNo;
	private String scName;
}
