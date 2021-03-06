package com.function.iBlog.controller.background;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.function.iBlog.common.util.UserUtils;
import com.function.iBlog.service.user.UserService;
import com.function.iBlog.vo.ReturnDto;
import com.function.iBlog.vo.UserVO;


@Controller
@RequestMapping("/mySetting")
public class MySettingController
{
    @Autowired
    private UserService userService;
    
    @RequestMapping(value = "/changeFaceImgMySelf")
    @RequiresAuthentication
    @ResponseBody
    public ReturnDto changeFaceImgMySelf(String faceImg)
    {
		UserVO user = UserUtils.findLoginUser();
		ReturnDto ret = userService.changeUserFaceImg(user.getUserid(),faceImg);
		return ret;
    }
    
    @RequestMapping(value = "/changeNickNameMySelf")
    @RequiresAuthentication
    @ResponseBody
    public ReturnDto changeNickNameMySelf(String newNickName)
    {
		UserVO user = UserUtils.findLoginUser();
		ReturnDto ret = userService.changeUserNickName(user.getUserid(),newNickName);
		return ret;
    }
    
    
    @RequestMapping(value = "/changePhoneNumMySelf")
    @RequiresAuthentication
    @ResponseBody
    public ReturnDto changePhoneNumMySelf(String msgValiCode,String newPhoneNum,HttpSession session)
    {
		UserVO user = UserUtils.findLoginUser();
		ReturnDto ret = userService.changePhoneNum(user.getUserid(),msgValiCode,newPhoneNum,session);
		return ret;
    }
    
    
    @RequestMapping(value = "/changeEmailMySelf")
    @RequiresAuthentication
    @ResponseBody
    public ReturnDto changeEmailMySelf(String email)
    {
		UserVO user = UserUtils.findLoginUser();
		ReturnDto ret = userService.changeUserEmail(user.getUserid(),email);
		return ret;
    }
    

}
