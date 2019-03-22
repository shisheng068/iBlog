package com.function.iBlog.service.captcha;

import javax.servlet.http.HttpSession;

import com.function.iBlog.vo.ReturnDto;

public interface MsgCaptchaService
{

    /**
     * 验证图片验证码并发送手机验证码至指定手机号
     * @param valicode
     * @param phoneNum
     * @param session
     * @return
     */
    public ReturnDto sendMsgValicodeByImgValicode(String valicode, String phoneNum,
	    HttpSession session);

    /**
     * 验证手机验证码是否正确，并选择是否移除手机验证码
     * @param msgValicode
     * @param session
     * @param flashMsgValicode
     * @return
     */
    public ReturnDto checkMsgValicode(String msgValicode,HttpSession session,boolean flashMsgValicode);

}
