package com.function.iBlog.dao.pemission.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.function.iBlog.common.page.OrderVO;
import com.function.iBlog.common.page.PaginationAndOrderVO;
import com.function.iBlog.dao.impl.BaseDao;
import com.function.iBlog.dao.pemission.PemissionDao;
import com.function.iBlog.vo.MenuVO;
import com.function.iBlog.vo.PermissionVO;

public class PemissionDaoImpl extends BaseDao implements PemissionDao {

	@Override
	public List<MenuVO> selectLeftNavMenuByUserID(int userid,boolean alluser,boolean isLogin) {
		Map<String,Object> seleteMap = new HashMap<String, Object>();
		seleteMap.put("userid", ""+userid);
		if(alluser)
		{
			seleteMap.put("alluser", "alluser");
		}
		if(isLogin)
		{
			seleteMap.put("loginuser", "loginuser");
		}
		PaginationAndOrderVO pageOrder = new PaginationAndOrderVO();
		OrderVO order = new OrderVO("priority", "desc");
		pageOrder.addOrder(order);
		seleteMap.put(PaginationAndOrderVO.PAGE_KEY, pageOrder);
		
		List<MenuVO> ret = sqlSession.selectList("com.lingcong.mybatis.permission.selectLeftNavMenuByUserID", seleteMap);
		return ret;
	}

	@Override
	public List<PermissionVO> queryPermissionInfo(Map<String, Object> queryMap) {
		List<PermissionVO> ret = sqlSession.selectList("com.lingcong.mybatis.permission.selectPermissionInfo", queryMap);
		return ret;
	}

}
