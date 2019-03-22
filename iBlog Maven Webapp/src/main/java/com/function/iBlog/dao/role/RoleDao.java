package com.function.iBlog.dao.role;

import java.util.List;

public interface RoleDao
{

    /**
     * 根据用户ID查询用户权限
     * @param userid
     * @return
     */
    List<String> selectPermissSnByUserID(int userid);

}
