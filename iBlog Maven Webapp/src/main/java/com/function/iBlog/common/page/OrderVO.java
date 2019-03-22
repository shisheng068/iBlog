package com.function.iBlog.common.page;
/**
 * 排序VO
 * @author zqc
 *2015-1-24 上午09:59:11
 */

public class OrderVO {

	//传入mybatis参数时map的key值
	public final static String ORDER_KEY="MUST_ORDER";
	
	private String order="asc";//顺序
	private String sort="";//字段
	
	public OrderVO()
	{
		
	}
	
	public OrderVO(String sort,String order) {
		this.order = order;
		this.sort = sort;
	}

	public OrderVO(String sort) {
		this.sort = sort;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}
	
	
	@Override
	public String toString() {
		return sort+" "+order;
	}
	
}
