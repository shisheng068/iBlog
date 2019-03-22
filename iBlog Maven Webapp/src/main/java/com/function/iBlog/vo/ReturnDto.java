package com.function.iBlog.vo;

import lombok.Data;

/**
 * 执行结果
 * @author Administrator
 *
 */
@Data
public class ReturnDto {

	private String msg;//信息
	
	private String returnCode;//结果代码
	
	private boolean success;//是否成功
	
	private Object data;//返回数据
	
}
