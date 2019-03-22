package com.function.iBlog.dao.pemission;

import java.util.List;
import java.util.Map;

import com.function.iBlog.vo.MenuVO;
import com.function.iBlog.vo.PermissionVO;

public interface PemissionDao {

	/**
	 * 根据条件查询用户可用左侧导航菜单
	 * @param userid
	 * @param alluser
	 * @param isLogin
	 * @return
	 */
	public List<MenuVO> selectLeftNavMenuByUserID(int userid,boolean alluser,boolean isLogin);

	/**
	 * 根据条件查询权限信息列表
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
