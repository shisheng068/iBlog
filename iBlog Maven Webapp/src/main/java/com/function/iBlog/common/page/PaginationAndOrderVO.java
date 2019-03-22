package com.function.iBlog.common.page;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFilter;

/**
 * 分页及排序控件VO对象
 * @author San
 *2016-5-22 上午09:22:55
 */

@JsonFilter("pageAndorderFilter")
public class PaginationAndOrderVO {
	
	//传入mybatis参数时map的key值
	public final static String PAGE_KEY="MUST_PAGE_ORDER";
	
	private PaginationVO page;
	private List<OrderVO> orders;
	
	
	public PaginationVO getPage() {
		return page;
	}
	public void setPage(PaginationVO page) {
		this.page = page;
	}
	public List<OrderVO> getOrders() {
		return orders;
	}
	public void setOrders(List<OrderVO> orders) {
		this.orders = orders;
	}
	
	public void addOrder(OrderVO order)
	{
		if(null == orders)
		{
			orders = new ArrayList<OrderVO>();
		}
		orders.add(order);
	}
	
}