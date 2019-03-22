<%@ page pageEncoding="UTF-8" %>
<%@include file="/page/common/include/baseParam.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
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

		<div class="left-sidebar">
            <!-- 用户信息 -->
            <div class="tpl-sidebar-user-panel">
                <div class="tpl-user-panel-slide-toggleable">
                    <div class="tpl-user-panel-profile-picture">
                        <img src="<%=basePath%>StaticResource/access-access/${user.faceimgurl}" alt="">
                    </div>
                    <span class="user-panel-logged-in-text">
              <i class="am-icon-circle-o am-text-success tpl-user-panel-status-icon"></i>
              ${user.nickName}
          </span>
                    <a href="<%=basePath%>backer/myUserSetting" class="tpl-user-panel-action-link"> <span class="am-icon-pencil"></span> 账号设置</a>
                </div>
            </div>

            <!-- 菜单 -->
            <ul class="sidebar-nav">
                <li class="sidebar-nav-heading"> 快捷菜单 <span class="sidebar-nav-heading-info">Menu</span></li>
                <c:forEach items="${menus}" var="menu">
	               	<c:if test="${menu.parentid == 0}">
	               	<li class="sidebar-nav-link">
	               	
	               	    <c:set var="hasChrflag" value="false" />
	                    <c:forEach items="${menus}" var="chrMenu">
		                    <c:if test="${chrMenu.parentid == menu.menuid}">
		                    	<c:set var="hasChrflag" value="true" />
		                    </c:if>
	                    </c:forEach>
	                    
	                    <c:choose>
						    <c:when test="${fn:startsWith(menu.menuurl, 'http') or fn:startsWith(menu.menuurl, 'www')}">
						        <c:set var="thisMenuurl" value="${menu.menuurl}" />
						    </c:when>
						    <c:when test="${empty menu.menuurl}">
						        <c:set var="thisMenuurl" value="javascript:void(0);" />
						    </c:when>
						    <c:otherwise>
						        <c:set var="thisMenuurl" value="${pageScope.basePath}${menu.menuurl}" />
						    </c:otherwise>
						</c:choose>
	                    <a href='${thisMenuurl}' class='<c:if test="${menu.active}">active</c:if> <c:if test="${hasChrflag}">sidebar-nav-sub-title</c:if>' >
	                        <i class="${menu.menuicon} sidebar-nav-link-logo"></i> ${menu.menuName}
	                        <c:if test="${hasChrflag}">
	                        	<span class="am-icon-chevron-down am-fr am-margin-right-sm sidebar-nav-sub-ico"></span>
                        	</c:if>
	                    </a>
	                    
	                    <c:if test="${hasChrflag}">
	                    <ul class="sidebar-nav sidebar-nav-sub">
	                    <c:forEach items="${menus}" var="chrMenu">
		                    <c:if test="${chrMenu.parentid == menu.menuid}">
		                    
		                        <c:choose>
								    <c:when test="${fn:startsWith(chrMenu.menuurl, 'http') or fn:startsWith(chrMenu.menuurl, 'www')}">
								        <c:set var="thisMenuurl" value="${chrMenu.menuurl}" />
								    </c:when>
								    <c:when test="${empty chrMenu.menuurl}">
								        <c:set var="thisMenuurl" value="javascript:void(0);" />
								    </c:when>
								    <c:otherwise>
								        <c:set var="thisMenuurl" value="${pageScope.basePath}${chrMenu.menuurl}" />
								    </c:otherwise>
								</c:choose>
		                    	<li class="sidebar-nav-link">
		                            <a href='${thisMenuurl}' <c:if test="${menu.active}">  class="active" </c:if> >
		                                <span class="${chrMenu.menuicon} sidebar-nav-link-logo"></span> ${chrMenu.menuName}
		                            </a>
		                        </li>
		                    </c:if>
	                    </c:forEach>
	                    </ul>
	                    </c:if>
	                    
	                </li>
	               	</c:if>
                </c:forEach>

                <li class="sidebar-nav-heading">近期动态<span class="sidebar-nav-heading-info">Recent Publication</span></li>
                <li class="sidebar-nav-link">
                    <a href="sign-up.html">
                    	<span class="am-badge am-badge-secondary sidebar-nav-link-logo-ico am-round am-fr am-margin-right-sm">top</span>
                        <i class="am-icon-clone sidebar-nav-link-logo"></i> 发表了文章  iBlog搭建日志
                    </a>
                </li>
                <li class="sidebar-nav-link">
                    <a href="login.html">
                        <i class="am-icon-key sidebar-nav-link-logo"></i> 上传了图片  D750入手了+使用指南
                    </a>
                </li>
                <li class="sidebar-nav-link">
                    <a href="404.html">
                        <i class="am-icon-tv sidebar-nav-link-logo"></i> 发表了文章  阿里云OSS使用介绍
                    </a>
                </li>

            </ul>
        </div>
</body>
<script src="<%=basePath%>js/autoLeftNav.js"></script>