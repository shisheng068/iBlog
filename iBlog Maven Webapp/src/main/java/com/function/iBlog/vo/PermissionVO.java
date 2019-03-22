package com.function.iBlog.vo;

import lombok.Data;

@Data
public class PermissionVO 
{
	
	private int    permissionid = 0;
	
	private String permissionname;//菜单名
	
	private String menuicon;//菜单图标
	
	private String menuurl;//菜单跳转链接
	
	private int priority = 0;//菜单展示优先级
	
	private int parentid = 0;//父权限id
	
	private int state = 0;//菜单禁用状态
	
	private int showsysmenu = 0;//显示为菜单
	
	private String sn;//菜单权限字段
	
}
