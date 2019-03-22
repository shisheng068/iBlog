<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/page/common/include/baseParam.jsp"%>

<html>

<head lang="en">
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
  
</head>

<body data-type="login">
    <div class="am-g tpl-g">
        <!-- 风格切换 -->
        <%@include file="/page/common/changetheme/changetheme.jsp"%>
        
        <div class="tpl-login">
            <div class="tpl-login-content">
                <div class="tpl-login-logo">

                </div>
                <label style="color: red;">${msg}</label>



                <form class="am-form tpl-form-line-form" action="<%=basePath%>login/login.do" method="post">
                    <input style="display: none" type="text" class="tpl-form-input" id="last" name="last" hidden="hidden" >
                    <div class="am-form-group">
                        <input type="text" class="tpl-form-input" id="user-name" name="username" placeholder="请输入账号">

                    </div>

                    <div class="am-form-group">
                        <input type="password" class="tpl-form-input" id="user-name" name="password" placeholder="请输入密码">

                    </div>
                    <div class="am-form-group tpl-login-remember-me">
                        <input id="remember-me" type="checkbox">
                        <label for="remember-me">
       
                        记住密码
                         </label>

                    </div>


                    <div class="am-form-group">

                        <button type="submit" class="am-btn am-btn-primary  am-btn-block tpl-btn-bg-color-success  tpl-login-btn">提交</button>

                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script type="text/javascript">
    
    $(function() {
    	$("#last").val(window.location.href);
    });
    
    </script>
    
    <script src="<%=basePath%>plugins/AmazeUI/js/amazeui.min.js"></script>
    <script src="<%=basePath%>plugins/AmazeUI/js/amazeui.datatables.min.js"></script>
    <script src="<%=basePath%>plugins/AmazeUI/js/dataTables.responsive.min.js"></script>
</body>

</html>