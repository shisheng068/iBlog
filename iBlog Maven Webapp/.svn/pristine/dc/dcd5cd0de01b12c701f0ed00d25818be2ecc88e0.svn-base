package iBlog;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import com.function.iBlog.common.util.FileUtil;
import com.function.iBlog.common.util.captcha.SCaptcha;
import com.function.iBlog.common.util.captcha.ValidateCode;

public class TestCaptcha {
    
    /** 
     * @Title:bytes2HexString 
     * @Description:字节数组转16进制字符串 
     * @param b 
     *            字节数组 
     * @return 16进制字符串 
     * @throws 
     */  
    public static String bytes2HexString(byte[] b) {  
        StringBuffer result = new StringBuffer();  
        String hex;   
        for (int i = 0; i < b.length; i++) {  
            hex = Integer.toHexString(b[i] & 0xFF);  
            if (hex.length() == 1) {  
                hex = '0' + hex;  
            }  
            result.append(hex.toUpperCase());  
        }  
        return result.toString();  
    } 
    
	 public static void main(String[] args) {  
	        ValidateCode vCode = new ValidateCode(120,40,4,150);  
	        try {  
	        	//注意，先检查是否创建了文件夹，否则会异常
	            String path="D:"+File.separator+"fileOrImg"+File.separator+"test"+File.separator+""+new Date().getTime();
	            String validatepath = path+"_validate.png";
	            String scaptchapath = path+"_scaptcha.png";
	            
	            vCode.write(validatepath);  
	            
	            SCaptcha scaptcha = new SCaptcha();
	            scaptcha.write(scaptchapath);
	            
	            System.out.println(vCode.getCode()+"   "+scaptcha.getCode());
	            
	        } catch (IOException e) {  
	            e.printStackTrace();  
	        }  
	    }
}
