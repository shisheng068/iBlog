package com.function.iBlog.service.network;

import java.io.InputStream;

import com.function.iBlog.vo.ReturnDto;

/**
 * OSS服务抽象层
 * @author San
 *
 */
public interface OssService 
{
	
	/**
	 * 上传文件到OSS中
	 * @param inStream  文件输入流
	 * @param pathName 文件保存全路径
	 * @return
	 */
	public ReturnDto updateToOss(InputStream inStream,String pathName);
	
	/**
	 * 根据文件路径获取访问地址,默认允许访问时间一小时
	 * @param pathName
	 * @return
	 */
	public String gainUrlForOssFile(String pathName);
	
	/**
	 * 根据文件路径获取访问地址,并设置URL有效时间
	 * @param pathName
	 * @param validTime  有效时间秒
	 * @return
	 */
	public String gainUrlForOssFile(String pathName,int validTime);

}
