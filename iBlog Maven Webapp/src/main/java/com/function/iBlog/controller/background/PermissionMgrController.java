package com.function.iBlog.controller.background;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.function.iBlog.service.pemission.PemissionService;
import com.function.iBlog.vo.PermissionVO;
import com.function.iBlog.vo.ReturnDto;

@Controller
@RequestMapping("/permissionMgr")
public class PermissionMgrController 
{
	
	@Autowired
	private PemissionService pemissionService;
	
	/**
	 * 查询所有权限列表
	 * @return
	 */
	@RequiresPermissions("pemissionMgrNav")
	@RequestMapping("/selectPermissions")
	@RequiresAuthentication
	@ResponseBody
	public ReturnDto selectPermissionInfo
	(
		String permissionid,
		String state,
		String parentid,
		String permissionname_complete,
		String permissionname_part
	)
	{
		ReturnDto ret = new ReturnDto();
		
		Map<String,Object> queryMap = new HashMap<String, Object>();
		queryMap.put("permissionid", permissionid);
		queryMap.put("state", state);
		queryMap.put("parentid", parentid);
		queryMap.put("permissionname_part", permissionname_part);
		queryMap.put("permissionname_complete", permissionname_complete);
		
		List<PermissionVO> permissionList = pemissionService.queryPermissionInfo(queryMap);
		
		ret.setData(permissionList);
		ret.setMsg("操作成功");
		ret.setReturnCode("success");
		ret.setSuccess(true);
		
		return ret;
	}

}
