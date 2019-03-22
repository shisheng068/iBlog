package com.function.iBlog.service.impl.captcha;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpSession;

import org.springframework.util.StringUtils;

import com.function.iBlog.common.util.captcha.VerifyCodeUtils;
import com.function.iBlog.service.captcha.ImgCaptchaService;
import com.function.iBlog.vo.ReturnDto;

public class ImgCaptchaServiceImpl implements ImgCaptchaService
{

    private static String SESSION_ATTR_NAME = "imageCode";
    
    @Override
    public ReturnDto checkImgValicode(String valicode, HttpSession session,
	    boolean flashCaptcha)
    {
	ReturnDto ret = new ReturnDto();
	ret.setMsg("图片验证码错误");
	ret.setReturnCode("errorValicode");
	ret.setSuccess(false);
	
	if(StringUtils.isEmpty(valicode))
	{
	    return ret;
	}
	
	String trueImgValicode = (String) session.getAttribute(SESSION_ATTR_NAME);
	
	if(StringUtils.isEmpty(trueImgValicode))
	{
	    return ret;
	}
	
	if(trueImgValicode.equals(valicode))
	{
	    if(flashCaptcha)
	    {
		session.setAttribute(SESSION_ATTR_NAME,null);  
	    }
	    
	    ret.setMsg("验证通过");
	    ret.setReturnCode("success");
	    ret.setSuccess(true);
	    return ret;
	}
	
	return ret;
	 
    }

    @Override
    public ReturnDto createImgValicode(HttpSession session,
	    OutputStream outputStream) throws IOException
    {
	//利用图片工具生成图片  
        //verifyCode是生成的验证码，生成的图片直接写到out对象中 
	String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
        VerifyCodeUtils.outputImage(120, 40, outputStream, verifyCode);
        //将验证码存入Session  
        session.setAttribute(SESSION_ATTR_NAME,verifyCode);
	return null; 
    }


}
