package com.function.iBlog.service.captcha;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpSession;

import com.function.iBlog.vo.ReturnDto;

public interface ImgCaptchaService
{
    /**
     * 校验验证码是否正确
     * @param valicode  待校验的验证码
     * @param session   httpsession
     * @param flashCaptcha  是否刷新验证码
     * @return
     */
    public ReturnDto checkImgValicode(String valicode,HttpSession session,boolean flashCaptcha);
    
    /**
     * 生成一个图片验证码
     * @param session       Httpsession
     * @param outputStream  图片输出流
     * @return
     * @throws IOException 
     */
    public ReturnDto createImgValicode(HttpSession session,OutputStream outputStream) throws IOException;
    
}
