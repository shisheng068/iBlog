package com.function.iBlog.common.util;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.InputStream;

import org.springframework.util.Base64Utils;

/**
 * Base64工具类
 * @author San
 *
 */
public class IBlogBase64Utils {
	
	/**
	 * Base64数据转换为图片输入流
	 * @param base64Data
	 * @return
	 */
	public static InputStream base64ToImgInputStream(String base64Data)
	{
		InputStream inputStream = null; 
		try
		{                 
            String dataPrix = "";  
            String data = "";            
            if(base64Data == null || "".equals(base64Data))
            {
                throw new Exception("数据为空");  
            }
            else
            {  
                String [] d = base64Data.split("base64,");  
                if(d != null && d.length == 2)
                {  
                    dataPrix = d[0];  
                    data = d[1];  
                }
                else
                {  
                    throw new Exception("数据不合法");  
                }  
            }               
            String suffix = "";  
            if("data:image/jpeg;".equalsIgnoreCase(dataPrix))
            {//data:image/jpeg;base64,base64编码的jpeg图片数据  
                suffix = ".jpg";  
            } 
            else if("data:image/x-icon;".equalsIgnoreCase(dataPrix))
            {//data:image/x-icon;base64,base64编码的icon图片数据  
                suffix = ".ico";  
            } 
            else if("data:image/gif;".equalsIgnoreCase(dataPrix))
            {//data:image/gif;base64,base64编码的gif图片数据  
                suffix = ".gif";  
            } 
            else if
            ("data:image/png;".equalsIgnoreCase(dataPrix)){//data:image/png;base64,base64编码的png图片数据  
                suffix = ".png";  
            }
            else
            {  
                throw new Exception("图片格式不合法");  
            }  
            //因为BASE64Decoder的jar问题，此处使用spring框架提供的工具包  
            byte[] bs = Base64Utils.decodeFromString(data); 
            inputStream = new ByteArrayInputStream(bs);
            
            return inputStream;                
        }
		catch (Exception e) 
		{                  
            return inputStream;  
        }          
    }
	
	
	/**
	 * 获取base64图片后缀
	 * @param base64Data
	 * @return
	 * @throws Exception
	 */
	public static String base64GetImgSuffix(String base64Data) throws Exception
	{
		String suffix = "";
		String dataPrix = "";  
        if(base64Data == null || "".equals(base64Data))
        {
            throw new Exception("数据为空");  
        }
        else
        {  
            String [] d = base64Data.split("base64,");  
            if(d != null && d.length == 2)
            {  
                dataPrix = d[0];  
            }
            else
            {  
                throw new Exception("数据不合法");  
            }  
        }               
        if("data:image/jpeg;".equalsIgnoreCase(dataPrix))
        {//data:image/jpeg;base64,base64编码的jpeg图片数据  
            suffix = ".jpg";  
        } 
        else if("data:image/x-icon;".equalsIgnoreCase(dataPrix))
        {//data:image/x-icon;base64,base64编码的icon图片数据  
            suffix = ".ico";  
        } 
        else if("data:image/gif;".equalsIgnoreCase(dataPrix))
        {//data:image/gif;base64,base64编码的gif图片数据  
            suffix = ".gif";  
        } 
        else if
        ("data:image/png;".equalsIgnoreCase(dataPrix)){//data:image/png;base64,base64编码的png图片数据  
            suffix = ".png";  
        }
        else
        {  
            throw new Exception("图片格式不合法");  
        }
		
		return suffix;
	}
}

