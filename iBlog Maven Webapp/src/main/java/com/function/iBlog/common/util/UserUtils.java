package com.function.iBlog.common.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import com.function.iBlog.common.constants.SessionKeyConstants;
import com.function.iBlog.service.user.UserService;
import com.function.iBlog.vo.UserVO;

public class UserUtils {
    
	/**
	 * 获取已登录的用户VO
	 * @return
	 */
	public static UserVO findLoginUser(){
		Subject subject = SecurityUtils.getSubject();
		UserVO ret = (UserVO)subject.getSession().getAttribute(SessionKeyConstants.SEESION_LOGINUSERVO);
		//(UserVO)subject.getPrincipal();
		if(null==ret)
		{
			ret = new UserVO();
			ret.setNickName("游客");
		}
		return ret;
	}
	
	/**
	 * 判断用户是否已登录
	 * @return
	 */
	public static boolean isLogin()
	{
		Subject subject = SecurityUtils.getSubject();
		UserVO ret = (UserVO)subject.getSession().getAttribute(SessionKeyConstants.SEESION_LOGINUSERVO);
		if(null==ret)
		{
			return false;
		}
		
		return true;
	}
	
	/**
	 * 更新已登录的用户VO
	 */
	public static void flashLoginUserInfo(UserService userService)
	{
	    UserVO oldUserVO = findLoginUser();
	    
	    //尚未登录
	    if(0 == oldUserVO.getUserid())
	    {
		return ;
	    }
	    
	    UserVO newUser = userService.selectUserByID(oldUserVO.getUserid());
	    
	    //TODO 更新session中的user信息
	    Subject subject = SecurityUtils.getSubject();
	    subject.getSession().setAttribute(SessionKeyConstants.SEESION_LOGINUSERVO,newUser);
	}
}
