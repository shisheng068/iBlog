package com.function.iBlog.controller.captcha;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.function.iBlog.common.util.captcha.VerifyCodeUtils;
import com.function.iBlog.service.captcha.ImgCaptchaService;
import com.function.iBlog.vo.ReturnDto;

@Controller
@RequestMapping("/captcha")
public class ImgCaptchaController
{
    
    private static String SESSION_ATTR_NAME = "imageCode";
    
    @Autowired
    private ImgCaptchaService imgCaptchaService;
    
    //生成验证码图片  
    @RequestMapping("/valicode") 
    public void valicode(HttpServletResponse response,HttpSession session) throws Exception
    {  
	
	//TODO 限定60秒刷新10次
	
	imgCaptchaService.createImgValicode(session, response.getOutputStream());
	
        //将图片输出给浏览器  
        response.setContentType("image/png");  
          
    }
    
    /**
     * 校验图片验证码是否正确
     * @param valicode
     * @param session
     * @return
     */
    @RequestMapping(value = "/checkImgValicode")
    @ResponseBody
    public ReturnDto checkImgValicode(String valicode,HttpSession session)
    {
	ReturnDto ret = imgCaptchaService.checkImgValicode(valicode, session, true);
	return ret;
    }

}
