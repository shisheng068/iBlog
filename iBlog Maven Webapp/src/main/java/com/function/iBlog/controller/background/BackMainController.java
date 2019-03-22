package com.function.iBlog.controller.background;

import java.util.HashMap;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.function.iBlog.common.constants.SessionKeyConstants;
import com.function.iBlog.common.util.UserUtils;
import com.function.iBlog.service.user.UserService;
import com.function.iBlog.vo.UserVO;


@Controller
@RequestMapping("/backer")
public class BackMainController 
{
    @Autowired
    private UserService userService;
    
    /**
     * 后台主页
     * @param msg
     * @return
     */
    @RequestMapping(value = "/main",method = RequestMethod.GET)
    @RequiresAuthentication
    public ModelAndView toBackMain()
    {
		Map<String, Object> model = new HashMap<String, Object>();
		String url = "/background/main/index";
		
		UserVO user = UserUtils.findLoginUser();
		
		model.put("user", user);
		return new ModelAndView(url, model);
    }
    
    /**
     * 个人信息页
     * @param msg
     * @return
     */
    @RequestMapping(value = "/myUserSetting",method = RequestMethod.GET)
    @RequiresAuthentication
    public ModelAndView toUserSetting()
    {
		Map<String, Object> model = new HashMap<String, Object>();
		String url = "/background/usersetting/usersetting";
		
		UserUtils.flashLoginUserInfo(userService);
		UserVO user = UserUtils.findLoginUser();
		
		model.put("user", user);
		return new ModelAndView(url, model);
    }
    
}
