package com.function.iBlog.vo;

import java.util.Date;

import org.springframework.util.StringUtils;

import com.function.iBlog.common.util.PropertiesUtil;

import lombok.Data;

@Data
public class UserVO
{
	private int    userid = 0;
    
	private String username;//用户名
	
	private String password;//密码
	
	private String salt;//加密因子
	
	private String nickName;//昵称
	
	private String phone;//手机号
	
	private String email;//邮箱
	
	private Date createTime = new Date();//创建时间
	
	private int loginstate;//状态
	
	private String roleNameListStr;//包含角色名列表
	
	private Date loginTime;//登录时间
	
	private boolean remember =false;
	
	private String faceimgurl=PropertiesUtil.getDefualtHeaderImg();//头像地址
	
	public String getFullFaceimg() {
		String faceimg=this.faceimgurl;
		if(StringUtils.isEmpty(faceimg)){
			faceimg = PropertiesUtil.getDefualtHeaderImg();
		}
		else if(faceimg.indexOf("pic")==0){
			return getFaceimgurl();
		}
		else if(faceimg.indexOf("http")!=0){
			String rootUrl = PropertiesUtil.getImgReadPath();
			faceimg=rootUrl+faceimg;
		}
		return faceimg;
	}
	
	public static void main(String arg0[]){
		UserVO user = new UserVO();
		user.setFaceimgurl("1234");
		System.out.println(user.getFaceimgurl());
	}
}
