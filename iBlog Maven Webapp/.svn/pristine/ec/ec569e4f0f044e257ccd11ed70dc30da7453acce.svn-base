package com.function.iBlog.service.pemission;

import java.util.List;
import java.util.Map;

import com.function.iBlog.vo.MenuVO;
import com.function.iBlog.vo.PermissionVO;

public interface PemissionService {

	/**
	 * 根据ID查询用户可用右侧菜单
	 * @param userid
	 * @return
	 */
	public List<MenuVO> selectLeftNavMenuByUserID(int userid,boolean isLogin);

	/**
	 * 根据条件查询权限信息
	 * @param queryMap
	 * 		<br> permissionid  权限ID
	 *  	<br> state  权限状态
	 *  	<br> parentid  父权限ID
	 *  	<br> permissionname_complete  全部权限名
	 *  	<br> permissionname_part  部分权限名
	 * @return
	 */
	public List<PermissionVO> queryPermissionInfo(Map<String, Object> queryMap);

}
