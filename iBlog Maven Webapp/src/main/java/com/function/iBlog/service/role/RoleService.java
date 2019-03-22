package com.function.iBlog.service.role;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

public interface RoleService
{
    /**
     * 根据用户ID查询用户权限
     * @param userid
     * @return
     */
    public List<String> selectPermissSnByUserID(int userid);

}
