package com.function.iBlog.common.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Map;

/**
 * 加密工具类
 * 创建日期：(2015-1-21 上午10:36:57)
 * @author：
 * Version 1.0.0
 */
public class EncryptUtil
{
	public static final int INTERATIONS = 1024;
	public static final int SALT_SIZE = 8;
	public static final String ALGORITHM = "SHA-1";
	
	public static final char[] hexChar = { '0', '1', '2', '3', '4', '5', '6', '7',  
            '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };  
	
	/**
	 * 对密码明文进行md5加密
	 * 返回加密因子和密文
	 * @param plainText 密码明文
	 * @return Map{SALT->saltVal,PASSWD->passwdVal}
	 */
	public Map<String,String> encrypt(String plainText) {
		//构造返回Map对象
		Map<String,String> passwdMap = new HashMap<String,String>();
		//获取随机加密因子
		String salt = CharacterUtils.getRandomString(SALT_SIZE);
		passwdMap.put("SALT",salt);
		//用加密因子对明文进行md5加密
		String hashPassword = MD5Util.string2MD5(salt+salt+plainText);
		passwdMap.put("PASSWD",hashPassword);
		return passwdMap;
	}
	
	/**
	 * 指定加密因子对明文进行加密
	 * @param plainText 密码明文
	 * @return 加密后的密文
	 */
	public String encryptBySalt(String plainText,String salt) {
		//将因子转换为字节数组类型
		String old_salt = salt;
		//用加密因子对明文进行加密
		String hashPassword = MD5Util.string2MD5(old_salt+old_salt+plainText);
		//返回加密后的密码
		return hashPassword;
	}
	
	/**
     * 取得文件的哈希值
     * @param fileName 文件路径
     * @param hashType 哈希类型
     * @return 文件哈希值
     * @throws Exception
     */
    public static byte[] getBytesFromFile(File f) {
        if (f == null)
            return null;
        try
        {
            FileInputStream stream = new FileInputStream(f);
            ByteArrayOutputStream out = new ByteArrayOutputStream(10000);
            byte[] b = new byte[10000];
            int n;
            while ((n = stream.read(b)) != -1)
            {
                //int n =0;
                out.write(b, 0, n);
            }
            stream.close();
            out.close();
            return out.toByteArray();
        } catch (IOException e) {
            System.out.println("e>>>>>>>>" + e.getMessage());
        }
        return null;
    }
  
    /**
     * 取得文件的哈希值
     * @param fileName 文件路径
     * @param hashType 哈希类型
     * @return 文件哈希值
     * @throws Exception
     */
    public static String getHash(String fileName, String hashType)  throws Exception {  
        InputStream fis;  
        fis = new FileInputStream(fileName);//读取文件  
        byte[] buffer = new byte[1024];  
        MessageDigest md5 = MessageDigest.getInstance(hashType);  
        int numRead = 0;  
        while ((numRead = fis.read(buffer)) > 0) {  
            md5.update(buffer, 0, numRead);  
        }  
        fis.close();  
        return toHexString(md5.digest());  
    }  
  
    /**
     * md5码数组转十六进制字符串
     * @param b md5码数组
     * @return 十六进制字符串
     */
    private static String toHexString(byte[] b) {  
        StringBuffer sb = new StringBuffer(b.length * 2);  
        for (int i = 0; i < b.length; i++) {  
            sb.append(hexChar[(b[i] & 0xf0) >>> 4]);  
            sb.append(hexChar[b[i] & 0x0f]);  
        }  
        return sb.toString();  
    }
    
    public static void main(String[] args){
    	EncryptUtil eu=new EncryptUtil();
    	Map<String,String> ret = eu.encrypt("admin123456");
    	System.out.println(ret.get("PASSWD")+"    "+ret.get("SALT"));
    	System.out.println(eu.encryptBySalt("admin123456", ret.get("SALT"))+"    "+ret.get("SALT"));
    }
}
