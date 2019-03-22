package com.function.iBlog.controller.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.aliyun.oss.common.comm.ServiceClient.Request;
import com.function.iBlog.service.network.OssService;

@Controller
@RequestMapping("/StaticResource")
public class ResourceAccessController 
{
	
	@Autowired
	private OssService ossService;
	
	@RequestMapping(value = "/access-access/**/{pathName:[\\s\\S]*}")
	public String staticResourceAccess(@PathVariable("pathName")String pathName,HttpServletRequest request)
	{
		String URL = request.getRequestURL().toString();
		String[] split = URL.split("/StaticResource/access-access/");
		String fatherPathName = split[1];
		String staticResourceUrl = ossService.gainUrlForOssFile(fatherPathName);
		return "redirect:"+staticResourceUrl;
	}

}
