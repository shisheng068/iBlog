package com.function.iBlog.service.impl.login;

import java.util.HashMap;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.function.iBlog.common.constants.SessionKeyConstants;
import com.function.iBlog.common.util.EncryptUtil;
import com.function.iBlog.service.login.LoginService;
import com.function.iBlog.service.user.UserService;
import com.function.iBlog.vo.ReturnDto;
import com.function.iBlog.vo.UserVO;

public class LoginServiceImpl implements LoginService
{

    @Autowired
    private UserService userService;

    @Override
    public ReturnDto login(Map<String, Object> queryMap)
    {
	ReturnDto ret = new ReturnDto();
	try
	{
	    String username = String.valueOf(queryMap.get("username"));
	    String password = String.valueOf(queryMap.get("password"));
	    UserVO userVO = (UserVO) queryMap.get("userVO");
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("username", username);
	    UserVO user = userService.selectUserByLoginName(username);
	    if (null == user)
	    {
		ret.setMsg("用户名密码错误");
		ret.setReturnCode("loginFailure");
		ret.setSuccess(false);
		return ret;
	    }
	    EncryptUtil eu = new EncryptUtil();
	    String checkPassword = eu.encryptBySalt(password, user.getSalt());
	    // 验证成功
	    if (checkPassword.equals(user.getPassword()))
	    {
		if (user.getLoginstate() == 0)
		{
		    ret.setMsg("用户被禁用");
		    ret.setReturnCode("loginFailure");
		    ret.setSuccess(false);
		    return ret;
		}
		Subject subject = SecurityUtils.getSubject();
		
		//保存登录用户信息
		subject.getSession().setAttribute(SessionKeyConstants.SEESION_LOGINUSERVO, user);
		
		// 封装令牌s
		UsernamePasswordToken token = null;
		token = new UsernamePasswordToken(username, checkPassword);
		token.setRememberMe(user.isRemember());
		subject.login(token);
		ret.setMsg("登录成功");
		ret.setReturnCode("loginSuccess");
		ret.setSuccess(true);
	    }
	    // 验证失败
	    else
	    {
		ret.setMsg("用户名密码错误");
		ret.setReturnCode("loginFailure");
		ret.setSuccess(false);
	    }
	} 
	catch (Exception e)
	{
	    ret.setMsg("登录出现异常");
	    ret.setReturnCode("loginError");
	    ret.setSuccess(false);
	}
	return ret;
    }

}
