package com.function.iBlog.service.impl.role;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.function.iBlog.dao.role.RoleDao;
import com.function.iBlog.service.role.RoleService;

public class RoleServiceImpl implements RoleService
{
    
    @Autowired
    RoleDao dao;

    @Override
    public List<String> selectPermissSnByUserID(int userid)
    {
		List<String> ret = dao.selectPermissSnByUserID(userid);
		return ret;
    }

}
