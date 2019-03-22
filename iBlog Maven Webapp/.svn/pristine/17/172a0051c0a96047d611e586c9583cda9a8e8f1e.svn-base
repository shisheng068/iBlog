package com.function.iBlog.service.pemission.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.function.iBlog.dao.pemission.PemissionDao;
import com.function.iBlog.service.pemission.PemissionService;
import com.function.iBlog.vo.MenuVO;
import com.function.iBlog.vo.PermissionVO;

public class PemissionServiceImpl implements PemissionService {

	@Autowired
	private PemissionDao dao;
	
	@Override
	public List<MenuVO> selectLeftNavMenuByUserID(int userid,boolean isLogin) {
		Map<String,String> seleteMap = new HashMap<String, String>();
		seleteMap.put("userid", ""+userid);
		seleteMap.put("alluser", "alluser");
		if(isLogin)
		{
			seleteMap.put("loginuser", "loginuser");
		}
		List<MenuVO> ret = dao.selectLeftNavMenuByUserID(userid,true,isLogin);
		return ret;
	}

	@Override
	public List<PermissionVO> queryPermissionInfo(Map<String, Object> queryMap) {
		List<PermissionVO> ret = dao.queryPermissionInfo(queryMap);
		return ret;
	}

}
