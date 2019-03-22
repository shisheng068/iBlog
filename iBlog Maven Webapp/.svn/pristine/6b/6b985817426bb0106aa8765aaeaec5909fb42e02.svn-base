package com.function.iBlog.common.util;

import java.util.Random;

import org.springframework.util.StringUtils;

public class CharacterUtils {
    
    /**
     * 获取随机的数字+字符的字符串
     * @param length
     * @return
     */
    public static String getRandomString(int length)
    {  
        String str="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";  
        Random random = new Random();  
        StringBuffer sb = new StringBuffer();  
          
        for(int i = 0 ; i < length; ++i){  
            int number = random.nextInt(62);//[0,62)  
              
            sb.append(str.charAt(number));  
        }  
        return sb.toString();  
    } 
    
    /**
     * 获取随机的数字字符串
     * @param length
     * @return
     */
    public static String getRandomNumString(int length)
    {  
        String str="0123456789";  
        Random random = new Random();  
        StringBuffer sb = new StringBuffer();  
          
        for(int i = 0 ; i < length; ++i){  
            int number = random.nextInt(str.length()); 
              
            sb.append(str.charAt(number));  
        }  
        return sb.toString();  
    }
    
    /**
     * 根据指定字符串randStr获取任意长度的随机字符串
     * @param length
     * @param randStr
     * @return
     */
    public static String getRandomString(int length,String randStr)
    {
	if(StringUtils.isEmpty(randStr))
	{
	    return "";
	}
        String str=randStr;  
        Random random = new Random();  
        StringBuffer sb = new StringBuffer();  
          
        for(int i = 0 ; i < length; ++i){  
            int number = random.nextInt(str.length()); 
              
            sb.append(str.charAt(number));  
        }  
        return sb.toString();  
    }
      
    public static String getRandomString2(int length){  
        Random random = new Random();  
          
        StringBuffer sb = new StringBuffer();  
          
        for(int i = 0; i < length; ++i){  
            int number = random.nextInt(3);  
            long result = 0;  
              
            switch(number){  
            case 0:  
                result = Math.round(Math.random() * 25 + 65);  
                sb.append(String.valueOf((char)result));  
                break;  
            case 1:  
                result = Math.round(Math.random() * 25 + 97);  
                sb.append(String.valueOf((char)result));  
                break;  
            case 2:  
                sb.append(String.valueOf(new Random().nextInt(10)));  
                break;  
            }  
        }  
        return sb.toString();     
    }  
  
    public static void main(String[] args){  
        System.out.println(getRandomString(10));  
        System.out.println(getRandomString2(10));  
    }  
}
