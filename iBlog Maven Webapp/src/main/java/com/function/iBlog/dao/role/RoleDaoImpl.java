package com.function.iBlog.dao.role;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.function.iBlog.dao.impl.BaseDao;

public class RoleDaoImpl extends BaseDao implements RoleDao
{

    @Override
    public List<String> selectPermissSnByUserID(int userid)
    {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("userID", userid);
		List<String> ret = sqlSession.selectList("com.lingcong.mybatis.role.selectPermissSnByUserID", map);
		return ret;
    }

}
