package com.function.iBlog.controller.login;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.function.iBlog.service.login.LoginService;
import com.function.iBlog.vo.ReturnDto;
import com.function.iBlog.vo.UserVO;


@Controller
@RequestMapping("/login")
public class LoginController {
    
    @Autowired
    private LoginService loginService;
	
    /**
     * 登录页面
     * @param msg
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public ModelAndView toLogin(String msg,HttpServletRequest request)
    {
    	Map<String,Object> model = new HashMap<String,Object>();
    	if(StringUtils.isEmpty(msg))
    	{
    	    Subject user = SecurityUtils.getSubject();
    		Session session = user.getSession();
    		if(null==session.getAttribute("loginMsg"))
    			msg ="";
    		else
    			msg = String.valueOf(session.getAttribute("loginMsg"));
    		session.setAttribute("loginMsg", null);
    	}
    	model.put("msg", msg);
    	return new ModelAndView("/login", model);
    }
    
    /**
     * 用户登录
     * @param userVO
     * @param request
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public ModelAndView login(UserVO userVO, HttpServletRequest request)
    {
		Map<String, Object> model = new HashMap<String, Object>();
		// 已登录跳转last
		String returnUrl = request.getParameter("last");
		if (StringUtils.isEmpty(returnUrl))
		{
		    returnUrl = "/login/login.shtml";
		}
		Set<String> set = request.getParameterMap().keySet();
		for (String key : set)
		{
		    if ("last".equals(key))
			continue;
		    if ("loginName".equals(key))
			continue;
		    if ("password".equals(key))
			continue;
		    if (returnUrl.indexOf("?") >= 0)
		    {
			returnUrl += ("&" + key + "=" + request.getParameter(key));
		    } else
		    {
			returnUrl += ("?" + key + "=" + request.getParameter(key));
		    }
		}
		Subject user = SecurityUtils.getSubject();
		if (user.isAuthenticated())
		{
		    return new ModelAndView("redirect:" + returnUrl);
		}
		Map<String, Object> queryMap = new HashMap<String, Object>();
		// TODO 写登录日志
	
		// 验证登录
		queryMap.clear();
		queryMap.put("username", userVO.getUsername());
		queryMap.put("password", userVO.getPassword());
		queryMap.put("userVO", userVO);
		ReturnDto loginRet = loginService.login(queryMap);
	
		// 登录成功跳转last，失败则返回登录页
		user = SecurityUtils.getSubject();
		if (user.isAuthenticated())
		{
		    user.getSession().setAttribute("loginMsg", loginRet.getMsg());
		    return new ModelAndView("redirect:" + returnUrl);
		} else
		{
		    String url;
		    url = "redirect:/login/login.shtml";
		    user.getSession().setAttribute("loginMsg", loginRet.getMsg());
		    return new ModelAndView(url);
		}
    }
}
