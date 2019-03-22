package com.function.iBlog.controller.common;

import java.io.InputStream;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.function.iBlog.common.util.IBlogBase64Utils;
import com.function.iBlog.service.network.OssService;
import com.function.iBlog.vo.ReturnDto;

@Controller
@RequestMapping("/fileUpload")
public class FileUpdateContorller 
{
	
	@Autowired
	private OssService ossService;
	
	/**
	 * 使用 multiFile 表单上传文件
	 * @param multiFile
	 * @param path
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/uploadMultiFile",method = RequestMethod.POST)
	@RequiresAuthentication
	@ResponseBody
	public ReturnDto uploadPicByMultiFile(MultipartFile multiFile,@RequestParam(required =false)String path,HttpServletRequest request, HttpServletResponse response)
	{
		ReturnDto ret = new  ReturnDto();
		
		if(null == multiFile)
		{
			ret.setMsg("空文件");
			ret.setReturnCode("NullFile");
			ret.setSuccess(false);
			return ret;
		}
		
		String filePathName=path+"\\"+multiFile.getName();
		
		try {
			 ossService.updateToOss(multiFile.getInputStream(), filePathName);
		} catch (Exception e) {
			ret.setMsg("文件上传失败");
			ret.setReturnCode("error");
			ret.setSuccess(false);
			return ret;
		}
		
		ret.setMsg("文件上传成功");
		ret.setReturnCode("success");
		ret.setSuccess(true);
		ret.setData(filePathName);
		return ret;
	}
	
	@RequestMapping(value = "/uploadImgBase64",method = RequestMethod.POST)
	@RequiresAuthentication
	@ResponseBody
	public ReturnDto uploadPicByBase64(String base64,String path,HttpServletRequest request, HttpServletResponse response)
	{
		ReturnDto ret = new  ReturnDto();
		
		InputStream inputStream = IBlogBase64Utils.base64ToImgInputStream(base64);
		if(null == inputStream)
		{
			ret.setMsg("base64数据无法解析");
			ret.setReturnCode("errorData");
			ret.setSuccess(false);
		}
		
		String suffix = "";
		try {
			suffix = IBlogBase64Utils.base64GetImgSuffix(base64);
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		String tempFileName = UUID.randomUUID().toString() + suffix;
		
		String filePathName=path+"/"+tempFileName;
		
		try {
			 ossService.updateToOss(inputStream, filePathName);
		} catch (Exception e) {
			ret.setMsg("文件上传失败");
			ret.setReturnCode("error");
			ret.setSuccess(false);
			return ret;
		}
		
		ret.setMsg("文件上传成功");
		ret.setReturnCode("success");
		ret.setSuccess(true);
		ret.setData(filePathName);
		return ret;
	}

}

