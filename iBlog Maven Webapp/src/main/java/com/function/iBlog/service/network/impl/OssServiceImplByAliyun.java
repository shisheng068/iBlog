package com.function.iBlog.service.network.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Date;
import java.net.URL;

import com.aliyun.oss.OSSClient;
import com.function.iBlog.service.network.OssService;
import com.function.iBlog.vo.ReturnDto;

public class OssServiceImplByAliyun implements OssService 
{
	
	public int DEFAULT_VALIDTIME = 3600;
	
	private String accesskeyId = "LTAIDJSCj7Blr1SX" ;  
	private String accessKeySecret = "rJrwObuIiSsix6gRK4ADGcj4xugHY1" ;  
	private String endpoint = "http://oss-cn-hangzhou.aliyuncs.com" ;  
	private String bucketName = "iblog-oss-rw" ;
	
	@Override
	public ReturnDto updateToOss(InputStream inStream, String pathName) 
	{
		ReturnDto ret = new ReturnDto();
		
		try
		{
			OSSClient client = new OSSClient(endpoint,accesskeyId,accessKeySecret);
			client.putObject(bucketName, pathName, inStream);  
		    client.shutdown();
		    
		    ret.setMsg("OSS上传成功");
		    ret.setReturnCode("success");
		    ret.setSuccess(true);
		}
		catch(Exception e)
		{
			ret.setSuccess(false);
			ret.setMsg("OSS 上传出错");
			ret.setReturnCode("OSS_Exception");
		}
	    
	    return ret;
	}

	@Override
	public String gainUrlForOssFile(String pathName) 
	{
		return gainUrlForOssFile(pathName,DEFAULT_VALIDTIME);
		
	}

	@Override
	public String gainUrlForOssFile(String pathName, int validTime) 
	{
		String ret = "";
		
		try
		{
			OSSClient client = new OSSClient(endpoint,accesskeyId,accessKeySecret);
			Date expiration = new Date(new Date().getTime() + validTime*1000);
			URL url = client.generatePresignedUrl(bucketName, pathName, expiration);
			client.shutdown();
			ret = url.toString();
		    
		}
		catch(Exception e)
		{
			ret = "";
		}
	    
	    return ret;
	}
	
	
	public static void main(String[] args) 
	{  
		OssServiceImplByAliyun oss = new OssServiceImplByAliyun();
		
		File file = new File("D:\\fileOrImg\\pic\\2016-06-08\\1465361881gHJuDpjNOu.jpg");
		
		FileInputStream fin = null;
		try {
			fin = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		oss.updateToOss(fin, "test.jpg");
		
		String url = oss.gainUrlForOssFile("test.jpg");
		
		System.out.println(url);
		
	}

}
