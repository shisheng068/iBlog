<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/page/common/include/baseParam.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Amaze UI Admin index Examples</title>
    <meta name="description" content="这是一个 index 页面">
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="<%=basePath%>plugins/AmazeUI/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="<%=basePath%>plugins/AmazeUI/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="<%=basePath%>plugins/AmazeUI/css/amazeui.min.css" />
    <link rel="stylesheet" href="<%=basePath%>plugins/AmazeUI/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="<%=basePath%>css/app.css">
    
    <script src="<%=basePath%>plugins/AmazeUI/js/echarts.min.js"></script>
    <script src="<%=basePath%>plugins/AmazeUI/js/jquery.min.js"></script>
    
    <style type="text/css">
    .form_nobroder_padding
    {
        padding-top: 5px;
    }
    
    .form_btn_follow
    {
        line-height: 1;
    }
    
    .info_red
    {
        color: red;
    }
    </style>

</head>

<body data-type="widgets">
<div class="am-g tpl-g">
        <!-- 头部 -->
        <%@include file="/page/background/common/header.jsp"%>
        <!-- 风格切换 -->
        <%@include file="/page/common/changetheme/changetheme.jsp"%>
        <!-- 侧边导航栏 -->
        <jsp:include page="/nav/nav.shtml" flush="true"/>
        <%-- <%@include file="/page/background/common/left.jsp"%> --%>

        <!-- 内容区域 -->
        <div class="tpl-content-wrapper">

            <div class="container-fluid am-cf">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-9">
                        <div class="page-header-heading"><span class="am-icon-home page-header-heading-icon"></span> 个人信息<small> Amaze UI</small></div>
                        <p class="page-header-description">此页面可以查看和修改个人信息。</p>
                    </div>
                    <!--  
                    <div class="am-u-lg-3 tpl-index-settings-button">
                        <button type="button" class="page-header-button"><span class="am-icon-paint-brush"></span> 设置</button>
                    </div>
                    -->
                </div>

            </div>

            <div class="row-content am-cf">

                <div class="row">

                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">信息表单</div>
                                <div class="widget-function am-fr">
                                    <a href="javascript:;" class="am-icon-cog"></a>
                                </div>
                            </div>
                            <div class="widget-body am-fr">

                                <form class="am-form tpl-form-border-form tpl-form-border-br" enctype="multipart/form-data">
                                    <div class="am-form-group">
                                        <label for="user-name" class="am-u-sm-3 am-form-label">用户名 <span class="tpl-form-line-small-title">UserName</span></label>
                                        <div class="am-u-sm-9 form_nobroder_padding">
                                            <span style="border: none;">${user.username}</span>
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <label for="user-email" class="am-u-sm-3 am-form-label">创建时间 <span class="tpl-form-line-small-title">CreateTime</span></label>
                                        <div class="am-u-sm-9 form_nobroder_padding">
                                            <span style="border: none;"><fmt:formatDate value="${user.createTime}" type="date" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                                         </div>
                                    </div>

                                    <div class="am-form-group">
                                        <label for="user-phone" class="am-u-sm-3 am-form-label">昵称&nbsp <span class="tpl-form-line-small-title">NickName</span></label>
                                        <div class="am-u-sm-5">
                                            <input type="text" id="newNickName" placeholder="输入昵称" value="${user.nickName}">
                                        </div>
                                        <div class="am-u-sm-1">
                                            <button type="button" id="nickNameBtn" class="am-btn am-btn-primary form_btn_follow">修改</button>
                                        </div>
                                        <div class="am-u-sm-1">
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <label for="user-phone" class="am-u-sm-3 am-form-label">电话<span class="tpl-form-line-small-title">Phone</span></label>
                                        <div class="am-u-sm-5">
                                            <input type="text" id="oldPhoneNum"  placeholder="输入电话" value="${user.phone}">
                                        </div>
                                        <div class="am-u-sm-1">
                                            <button type="button" id="phoneBtn" class="am-btn am-btn-primary form_btn_follow">修改</button>
                                        </div>
                                        <div class="am-u-sm-1">
                                        </div>
                                    </div>
                                    
                                    <div class="am-form-group">
                                        <label for="user-phone" class="am-u-sm-3 am-form-label">邮箱 <span class="tpl-form-line-small-title">Email</span></label>
                                        <div class="am-u-sm-5">
                                            <input type="text" id="newEmail" placeholder="输入邮箱" value="${user.email}">
                                        </div>
                                        <div class="am-u-sm-1">
                                            <button type="button" id="newEmailBtn" class="am-btn am-btn-primary form_btn_follow" >修改</button>
                                        </div>
                                        <div class="am-u-sm-1">
                                        </div>
                                    </div>

                                    <div class="am-form-group">
                                        <label for="user-weibo" class="am-u-sm-3 am-form-label">头像 <span class="tpl-form-line-small-title">Head</span></label>
                                        <div class="am-u-sm-9">
                                              <div class="am-form-group">
                                                <div class="tpl-form-file-img am-form-file">
                                                    <input id="filePath" type="hidden" name="path" value="faceImg">
                                                    <img class="am-circle" src="<%=basePath%>StaticResource/access-access/${user.faceimgurl}" alt="">
                                                </div>
                                                <button type="button" class="am-btn am-btn-danger am-btn-sm" id="uploadImgBtn">
                                                	<i class="am-icon-cloud-upload"></i> 修改头像图片
                                                </button>
                                            </div>

                                        </div>
                                    </div> 

                                </form>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
    </div>
    
    <div id="alertDigDiv" class="am-modal am-modal-prompt" tabindex="-1" >
	  <div class="am-modal-dialog">
	    <div class="am-modal-hd dig_title">请稍后</div>
	    <div class="am-modal-bd dig_text">
	      正在提交.....
	    </div>
	    <div class="am-modal-footer">
	      <%-- <span class="am-modal-btn" data-am-modal-cancel>取消</span>  --%>
	      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
	    </div>
	  </div>
	</div>
	
	
	<div id="changePhoneDigDiv" class="am-modal am-modal-prompt" tabindex="-1" >
	  <div class="am-modal-dialog">
	    <div class="am-modal-hd dig_title" id ="capInfo">请稍后</div>
	    
	    <div class="am-modal-bd"><img id="valicodeImg"></div>
	    
	    <ul class="am-modal-bd am-avg-sm-3 am-avg-md-3 am-avg-lg-3">
	        <li><div class="dig_text">请输入新手机号</div></li>
	    	<li><input type="text" id="newPhoneNum" placeholder="新手机号"></li>
	    	<li></li>
    	</ul>
	    
	    <ul class="am-modal-bd am-avg-sm-3 am-avg-md-3 am-avg-lg-3">
	        <li><div class="dig_text" id="imgCapInfo">请输入图片验证码</div></li>
	    	<li><input type="text" id="phoneValicode" placeholder="图片验证码"></li>
	    	<li><button id="sendMsgBtn" class="am-btn am-btn-sm am-btn-primary .am-fl" type="button"  ><span id="time_sec"></span><span id="time_context">确定</span></button></li>
    	</ul>
    	
    	<ul class="am-modal-bd am-avg-sm-3 am-avg-md-3 am-avg-lg-3">
    	    <li><div class="dig_text">请输入短信验证码</div></li>
	    	<li><input type="text" id="sendPhoneValicode" placeholder="短信验证码"></li>
	    	<li><button id="changePhoneBtn" class="am-btn am-btn-sm am-btn-primary .am-fl" type="button" >确定</button></li>
    	</ul>
	    
	    <div class="am-modal-footer">
	      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
	      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
	    </div>
	  </div>
	</div>
	
	<!-- 侧边导航栏 -->
    <%@include file="/page/common/faceImgUpload/faceImgUpload.jsp"%>
    
    <script type="text/javascript">
    $(function() {
		$('#nickNameBtn').on('click', function(){
			var newNickName = $('#newNickName').val();
			updataMyNewNickName(newNickName);
 		});
		
		$('#phoneBtn').on('click', function(){
			openUpdataPhoneNum();
 		});
		
		$('#sendMsgBtn').on('click', function(){
			var valicode = $('#phoneValicode').val();
			sendMsgValicode(valicode,sendMsgValicodeSucess);
 		});
		
		$('#changePhoneBtn').on('click', function(){
			updataPhoneNum();
 		});
		
		$('#newEmailBtn').on('click', function(){
			updataEmail();
 		});
		
		var iBlog_ImgUp = CREATE_iBlog_ImgUp();
		iBlog_ImgUp.url = "<%=basePath%>fileUpload/uploadImgBase64.shtml";
		iBlog_ImgUp.successFunction = function(retDto){
			updataFaceImg(retDto);
		};
		iBlog_ImgUp.errorFunction = function(){
			showAlertDig("上传失败","头像上传失败！请检查网络或联系管理员");
		};
		
        $("#uploadImgBtn").click(function()
      	{
        	iBlog_ImgUp.show();
        });
		
    });
    
    function updataFaceImg(returnDto)
    {
    	if(!returnDto.success)
    	{
    		showAlertDig("上传失败","头像上传失败！请检查网络或联系管理员");
    		return;
    	}
    	
    	var url = "<%=basePath%>mySetting/changeFaceImgMySelf.shtml";
    	
    	var faceImg = returnDto.data;
    	
    	if(null==faceImg||""==faceImg)
    	{
    		showAlertDig("上传失败","头像地址为空！！");
    		return;
    	}
    	
    	showAlertDig("请稍候","正在提交.....");
    	$.ajax({
    		url:url,
    		type:'POST',
    		data:
    		{
    			faceImg:faceImg
    		},
    		success:function(dto)
    		{
    			var title = "操作失败";
    			if(dto){
    				if(dto.success)
    				{
    					title = "操作成功";
    				}
    				changeAlertDig(title,dto.msg,flashPage);
    			}else{
    				changeAlertDig(title,"操作失败");
    			}
    		},
    		error:function(){
    			changeAlertDig("操作失败","请检查网络");
    		}
    	});
    }
    
    function updataEmail()
    {
    	showAlertDig("请稍候","正在提交.....");
    	
    	var newEmail = $("#newEmail").val();
    	var url = "<%=basePath%>mySetting/changeEmailMySelf.shtml";
    		
    	$.ajax({
    		url:url,
    		type:'POST',
    		data:
    		{
    			email:newEmail
    		},
    		success:function(dto)
    		{
    			var title = "操作失败";
    			if(dto){
    				if(dto.success)
    				{
    					title = "操作成功";
    				}
    				changeAlertDig(title,dto.msg);
    			}else{
    				changeAlertDig(title,"操作失败");
    			}
    		},
    		error:function(){
    			changeAlertDig("操作失败","请检查网络");
    		}
    	});
    }
    
    function sendMsgValicode(phoneValicode,successFun)
    {
    	var url = "<%=basePath%>msgCaptcha/sendMsgValicode.shtml";
    	var phoneNum = $("#newPhoneNum").val();
    	
    	if(""==phoneValicode)
    	{
    		showCapInfo("图片验证码不能为空");
    		return;
    	}
    	
    	$.ajax({
    		url:url,
    		type:'POST',
    		data:
    		{
    			valicode:""+phoneValicode,
    			phoneNum:""+phoneNum
    		},
    		success:function(dto)
    		{
    			if(dto){
   					if(dto.success)
 					{
   						successFun();
  					}
   					else
   					{
   						showCapInfo("操作失败,"+dto.msg);
   						flashImgValicode();
   					}
    			}else{
    				showCapInfo("操作失败,验证码错误");
    			}
    		},
    		error:function(){
    			showCapInfo("操作失败,请检查网络");
    			flashImgValicode();
    		}
    	});
    }
    
    function sendMsgValicodeSucess(sendPhoneNum)
    {
    	showCapInfo("请稍候,验证码已发送");
    	startMsgSendCountDown();
    }
    
    function startMsgSendCountDown()
    {
    	$("#time_context").text("秒后重新发送");
    	$("#time_sec").text("60");
    	$("#sendMsgBtn").attr("disabled","disabled");
    	
    	var timeCountDown = setInterval(function(){
    		var sec = $("#time_sec").text();
        	sec = sec -1;
        	$("#time_sec").text(sec);
        	if(sec<=0)
        	{
        	    clearInterval(timeCountDown);
        	    flashSendMsgValicode();
       	  	}
    	},1000);
    	
    }
    
    function flashImgValicode()
    {
    	var alertDig=$("#changePhoneDigDiv");
    	var timestamp=new Date().getTime();
		alertDig.find("#valicodeImg").attr("src", "<%=basePath%>captcha/valicode?timestamp="+timestamp);
    }
    
    function flashSendMsgValicode()
    {
    	flashImgValicode();
    	$("#time_context").text("确定");
    	$("#time_sec").text("");
    }
    
    
    function flashPage()
    {
    	window.location.reload();
    }
    
    
    
    function openUpdataPhoneNum()
    {
    	showChangePhoneDig("修改手机号");
    }
    
    function updataPhoneNum(newPhoneNum)
    {
    	var url = "<%=basePath%>mySetting/changePhoneNumMySelf.shtml";
    	var phoneValicode = $('#sendPhoneValicode').val();
    	var newPhoneNum = $('#newPhoneNum').val();
    	
    	$.ajax({
    		url:url,
    		type:'POST',
    		data:
    		{
    			msgValiCode:""+phoneValicode,
    			newPhoneNum:""+newPhoneNum
    		},
    		success:function(dto)
    		{
    			if(dto){
    				if(dto.success)
    				{
    					var alertDig=$("#changePhoneDigDiv");
        				alertDig.modal('close');
        				showAlertDig("操作完成","修改手机号成功");
        				changeAlertDig("操作完成","修改手机号成功",flashPage);
    				}
    				else
   					{
   						showCapInfo("操作失败,"+dto.msg);
   						flashImgValicode();
   					}
    			}else{
    				showCapInfo("操作失败,手机验证码错误");
    				flashImgValicode();
    			}
    		},
    		error:function(){
    			showCapInfo("操作失败,请检查网络");
    			flashImgValicode();
    		}
    	});
    }
    
    function showCapInfo(imgCapInfo)
	{
		$("#capInfo").addClass("info_red");
		$("#capInfo").text(imgCapInfo);
	}
    
    function updataMyNewNickName(newNickName)
    {
    	showAlertDig("请稍候","正在提交.....");
    	
    	var url = "<%=basePath%>mySetting/changeNickNameMySelf.shtml";
    	$.ajax({
    		url:url,
    		type:'POST',
    		data:
    		{
    			newNickName:newNickName
    		},
    		success:function(dto)
    		{
    			var title = "操作失败";
    			if(dto){
    				if(dto.success)
    				{
    					title = "操作成功";
    				}
    				changeAlertDig(title,dto.msg);
    			}else{
    				changeAlertDig(title,"操作失败");
    			}
    		},
    		error:function(){
    			changeAlertDig("操作失败","请检查网络");
    		}
    	});
    }
    
    function showAlertDig(title,msg)
    {
		var alertDig=$("#alertDigDiv");
		alertDig.find(".dig_title:first").html(title);
		alertDig.find(".dig_text:first").html(msg);
		alertDig.modal({
	  		relatedTarget: this,
	  		closeViaDimmer:false,
	  		onConfirm: function(e) 
	  		{
	  	    	
	  		}
  	    });
		alertDig.onConfirm=function(){};
 	}
    
    function changeAlertDig(title,msg)
    {
		var alertDig=$("#alertDigDiv");
		alertDig.find(".dig_title:first").html(title);
		alertDig.find(".dig_text:first").html(msg);
 	}
    
    function changeAlertDig(title,msg,closfunction)
    {
		var alertDig=$("#alertDigDiv");
		alertDig.find(".dig_title:first").html(title);
		alertDig.find(".dig_text:first").html(msg);
		
		alertDig.onConfirm=closfunction();
		
 	}
    
    function showChangePhoneDig(title)
    {
    	var alertDig=$("#changePhoneDigDiv");
    	var timestamp=new Date().getTime();
		alertDig.find(".dig_title:first").html(title);
		alertDig.find(".dig_title:first").removeClass("info_red");
		var oldPhoneNum = $("#oldPhoneNum").val();
		alertDig.find("#newPhoneNum").val(oldPhoneNum);
		alertDig.find("#imgCapInfo").html("请输入图片验证码");
		alertDig.find("#imgCapInfo").removeClass("info_red");
		alertDig.find("#phoneCapInfo").html("请输入手机验证码");
		alertDig.find("#phoneCapInfo").removeClass("info_red");
		alertDig.find("#valicodeImg").attr("src", "<%=basePath%>captcha/valicode?timestamp="+timestamp);
		alertDig.modal({
	  		relatedTarget: this,
	  		closeViaDimmer:false,
	  		onConfirm: function(e) 
	  		{
	  	    	
	  		}
  	    });
		alertDig.onConfirm=function(){};
    }
    
    </script>
    <script src="<%=basePath%>plugins/AmazeUI/js/amazeui.min.js"></script>
    <script src="<%=basePath%>plugins/AmazeUI/js/amazeui.datatables.min.js"></script>
    <script src="<%=basePath%>plugins/AmazeUI/js/dataTables.responsive.min.js"></script>

</body>

</html>