package com.function.iBlog.controller.captcha;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.function.iBlog.service.captcha.MsgCaptchaService;
import com.function.iBlog.vo.ReturnDto;

/**
 * 手机验证码控制端
 * @author San
 *
 */
@Controller
@RequestMapping("/msgCaptcha")
public class MsgCaptchaController
{
    
    @Autowired
    private MsgCaptchaService msgCaptchaService;
    
    
    @RequestMapping("/sendMsgValicode") 
    @ResponseBody
    public ReturnDto sendMsgValicodeByImgValicode(String valicode,String phoneNum,HttpSession session)
    {
    	//TODO 限制发送间隔
		ReturnDto ret = new ReturnDto();
		
		ret = msgCaptchaService.sendMsgValicodeByImgValicode(valicode,phoneNum,session);
		
		return ret;
    }

}
