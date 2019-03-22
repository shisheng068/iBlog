package com.function.iBlog.common.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 一些校验代码
 * @author San
 *
 */
public class CheckoutUtil
{
    
    /**
     * 验证是否是正确的手机号
     * @param telNum
     * @return
     */
    public static boolean trueMobiPhoneNum(String telNum){  
        String regex = "^((13[0-9])|(15[0-9])|(18[0-9])|(17[0-9])|(14[0-9]))\\d{8}$";  
        Pattern p = Pattern.compile(regex,Pattern.CASE_INSENSITIVE);  
        Matcher m = p.matcher(telNum);  
        return m.matches();  
    }

	public static boolean trueEmailAddr(String email) {
		String regex = "^\\s*\\w+(?:\\.{0,1}[\\w-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\\.[a-zA-Z]+\\s*$";
		Pattern p = Pattern.compile(regex,Pattern.CASE_INSENSITIVE);  
        Matcher m = p.matcher(email);
		return m.matches(); 
	}

}
