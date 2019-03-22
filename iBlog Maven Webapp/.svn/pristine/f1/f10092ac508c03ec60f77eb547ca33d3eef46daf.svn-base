package com.function.iBlog.common.util;

import java.io.File;

public class FileUtil {

	/**
	 * 获取后缀名
	 * @param fileName
	 * @return
	 */
	public static String findExtName(String fileName){
		String ret = "";
		String[] names = fileName.split(".");
		if(names.length>1){
			ret=names[names.length-1];
		}
		return ret;
	}
	
	/**
	 * 检查目录，不存在则创建
	 * @param dirStr
	 * @return
	 */
	public static boolean createOrCheckDir(String dirStr){
		try{
			File file=new File(dirStr);
			if(!file.exists()){
				file.mkdirs();
			}
		}catch(Exception e){
			return false;
		}
		return true;
	}
	
	/**
	 * 获取当前类路径
	 */
	public static String classBasePath()
	{
	    return Class.class.getClass().getResource("/").getPath();
	}
}
