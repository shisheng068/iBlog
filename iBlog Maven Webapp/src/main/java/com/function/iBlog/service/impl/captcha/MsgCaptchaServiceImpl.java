package com.function.iBlog.service.impl.captcha;

import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import com.function.iBlog.common.util.CharacterUtils;
import com.function.iBlog.common.util.CheckoutUtil;
import com.function.iBlog.service.captcha.ImgCaptchaService;
import com.function.iBlog.service.captcha.MsgCaptchaService;
import com.function.iBlog.service.network.MsgService;
import com.function.iBlog.service.network.exception.MsgServiceException;
import com.function.iBlog.vo.ReturnDto;

public class MsgCaptchaServiceImpl implements MsgCaptchaService
{
    
    private static String SESSION_ATTR_NAME_MSGCODE = "msgCode";
    
    @Autowired
    private ImgCaptchaService imgCaptchaService;
    
    @Autowired
    private MsgService msgService;

    @Override
    public ReturnDto sendMsgValicodeByImgValicode(String valicode,
	    String phoneNum, HttpSession session)
    {
	
		ReturnDto valicodeCheckRet = imgCaptchaService.checkImgValicode(valicode, session, true);
		if(!valicodeCheckRet.isSuccess())
		{
		    return valicodeCheckRet;
		}
		
		ReturnDto ret = sendMsgValicode(phoneNum, session);
		return ret;
    }

    /**
     * 发送手机验证码至指定手机号
     * @param phoneNum
     * @param session
     * @return
     */
    private ReturnDto sendMsgValicode(String phoneNum,HttpSession session)
    {
		ReturnDto ret = new ReturnDto();
		//验证手机号是否合法
		if(!CheckoutUtil.trueMobiPhoneNum(phoneNum))
		{
		    ret.setMsg("错误的手机号");
		    ret.setReturnCode("errorPhoneNum");
		    ret.setSuccess(false);
		    
		    return ret;
		}
		
		String msgValicode = CharacterUtils.getRandomNumString(6);
		if(null == msgValicode||StringUtils.isEmpty(msgValicode))
		{
		    Random rand = new Random();
		    
		    msgValicode = ""+(100000+rand.nextInt(900000));
		}
		
		ReturnDto sendMsgRet = null;
		try {
			sendMsgRet = msgService.sendCaptchaMsg(phoneNum, msgValicode);
		} catch (MsgServiceException e) {
			
			ret.setMsg("手机验证码发送出错");
			ret.setReturnCode("errorSendMsg");
			ret.setSuccess(false);
			e.printStackTrace();
			    
			return ret;
			
		}
		if(sendMsgRet.isSuccess()&&null != session)
		{
		    session.setAttribute(SESSION_ATTR_NAME_MSGCODE, msgValicode);
		    
		    ret.setMsg("手机验证码发送成功");
			ret.setReturnCode("success");
			ret.setSuccess(true);
			    
			return ret;
		}
		
		
		ret.setMsg("手机验证码发送出错");
		ret.setReturnCode("errorSendMsg");
		ret.setSuccess(false);
		    
		return ret;
    }
	    
    public static void main(String[] args){  
    	MsgCaptchaServiceImpl msgSL= new MsgCaptchaServiceImpl();
		ReturnDto ret = msgSL.sendMsgValicode("15002128673",null);
		System.out.println(ret.getMsg());
    }
	
	    @Override
    public ReturnDto checkMsgValicode(String msgValicode, HttpSession session,
	    boolean flashMsgValicode)
    {
		ReturnDto ret = new ReturnDto();
		
		String trueMsgValicode = (String) session.getAttribute(SESSION_ATTR_NAME_MSGCODE);
		if(null==trueMsgValicode||StringUtils.isEmpty(trueMsgValicode)
			||null==msgValicode||StringUtils.isEmpty(msgValicode))
		{
		    ret.setMsg("手机验证码错误");
		    ret.setReturnCode("errorMsgValicode");
		    ret.setSuccess(false);
		    return ret;
		}
		
		msgValicode = msgValicode.trim();
		
		if(msgValicode.equals(trueMsgValicode))
		{
		    ret.setMsg("手机验证码正确");
		    ret.setReturnCode("success");
		    ret.setSuccess(true);
		    
		    if(flashMsgValicode)
		    {
			session.setAttribute(SESSION_ATTR_NAME_MSGCODE, null);
		    }
		    
		    return ret;
		}
	
		ret.setMsg("手机验证码错误");
		ret.setReturnCode("errorMsgValicode");
		ret.setSuccess(false);
		return ret;
    }  

}
