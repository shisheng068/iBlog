package com.function.iBlog.controller.background;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.function.iBlog.common.util.UserUtils;
import com.function.iBlog.service.pemission.PemissionService;
import com.function.iBlog.vo.MenuVO;
import com.function.iBlog.vo.UserVO;

@Controller
@RequestMapping("/nav")
public class NevigateController 
{
	@Autowired
	private PemissionService pemissionService;
	
	/**
     * 左侧导航栏
     * @param msg
     * @return
     */
    @RequestMapping(value = "/nav",method = RequestMethod.GET)
    public ModelAndView toNevigatePage(String activeName)
    {
		Map<String, Object> model = new HashMap<String, Object>();
		String url = "/background/common/left";
		UserVO user = UserUtils.findLoginUser();
		List<MenuVO> menus = pemissionService.selectLeftNavMenuByUserID(user.getUserid(),UserUtils.isLogin());
		
		for(MenuVO menu:menus)
		{
			if(menu.getMenuName().equals(activeName))
			{
				menu.setActive(true);
				break;
			}
		}
		
		model.put("user", user);
		model.put("menus", menus);
		
		return new ModelAndView(url, model);
    }

}
