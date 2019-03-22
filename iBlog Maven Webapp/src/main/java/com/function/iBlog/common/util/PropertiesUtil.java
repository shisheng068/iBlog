package com.function.iBlog.common.util;

import java.util.ResourceBundle;

import com.function.iBlog.common.constants.CommonConstants;


/**
 * 获取系统各个设置
 * @author San
 *
 */
public class PropertiesUtil {
	private static ResourceBundle rb;

	static {
		rb = ResourceBundle.getBundle("config");
	}
	
	/**
	 * 获取允许的最大上传文件大小 单位B
	 * @return
	 */
	public static long getMaxFileSize(){
		long ret = CommonConstants.UPLOAD_MAX_SIZE_HEADER_1M;
		return ret;
	}
	
	/**
	 * 获取图片上传根路径地址
	 * @return
	 */
	public static String getImgUploadPath(){
		String ret = rb.getString(CommonConstants.LINGCONG_IMG_UPLOAD_PATH);
		return ret;
	}

	/**
	 * 获取默认头像图片
	 * @return
	 */
	public static String getDefualtHeaderImg(){
		String ret = rb.getString(CommonConstants.LINGCONG_IMG_DEFAULT_HEADER);
		return ret;
	}
	
	/**
	 * 获取图片读取根目录地址
	 * @return
	 */
	public static String getImgReadPath(){
		String ret = rb.getString(CommonConstants.LINGCONG_IMG_READ_PATH);
		return ret;
	}
}
