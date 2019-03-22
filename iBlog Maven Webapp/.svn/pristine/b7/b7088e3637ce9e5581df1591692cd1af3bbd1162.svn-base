package com.function.iBlog.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.function.iBlog.common.util.UserUtils;
import com.function.iBlog.service.user.UserService;
import com.function.iBlog.vo.ReturnDto;
import com.function.iBlog.vo.UserVO;

@Controller
@RequestMapping("/usr")
public class UserController
{
    @Autowired
    private UserService userService;
    
    /**
     * 校验昵称是否可用
     * @param NickName
     * @return
     */
    @RequestMapping(value = "/checkNickName")
    public ReturnDto checkNickName(String NickName)
    {
	ReturnDto ret = new ReturnDto();
	return ret;
    }

}
