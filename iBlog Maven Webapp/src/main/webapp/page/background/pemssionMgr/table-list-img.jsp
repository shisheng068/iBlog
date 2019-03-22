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
    
    <link rel="stylesheet" href="<%=basePath%>plugins/my-ui/my-pagination/my-pagination.css">
    <script src="<%=basePath%>plugins/my-ui/my-pagination/my-pagination.js"></script>
    <link rel="stylesheet" href="<%=basePath%>plugins/my-ui/my-datagrid/my-datagrid.css">
    <script src="<%=basePath%>plugins/my-ui/my-datagrid/my-datagrid.js"></script>
    
    <style type="text/css">
    .am-selected
    {
    	width: 100%;
    }
    
    </style>
    
</head>

<body data-type="widgets">

		<!-- 头部 -->
        <%@include file="/page/background/common/header.jsp"%>
        <!-- 风格切换 -->
        <%@include file="/page/common/changetheme/changetheme.jsp"%>
        <!-- 侧边导航栏 -->
        <jsp:include page="/nav/nav.shtml" flush="true"/>
        <%-- <%@include file="/page/background/common/left.jsp"%> --%>



        <!-- 内容区域 -->
        <div class="tpl-content-wrapper">
            <div class="row-content am-cf">
                <div class="row">
                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title  am-cf">文章列表</div>


                            </div>
                            
                            <div class="widget-body  am-fr">
                            	<div class="am-u-sm-12 am-u-md-6 am-u-lg-3">
                                    <div class="am-form-group tpl-table-list-select">
                                        <select data-am-selected="{btnSize: 'sm'}" style="width: 100%">
							              <option value="option1">所有菜单</option>
							              <option value="option2">根菜单</option>
							              <option value="option3">系统管理</option>
							              <option value="option3">个人中心</option>
							            </select>
                                    </div>
                                </div>
                                <div class="am-u-sm-12 am-u-md-12 am-u-lg-3">
                                    <div class="am-input-group am-input-group-sm tpl-form-border-form cl-p">
                                        <input type="text" class="am-form-field ">
                                        <span class="am-input-group-btn">
            								<button class="am-btn  am-btn-default am-btn-success tpl-table-list-field am-icon-search" type="button"></button>
          								</span>
                                    </div>
                                </div>
                            
                            </div>
                            
                            <div id='datagridDiv' class="widget-body  am-fr">

                                <div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
                                    <div class="am-form-group">
                                        <div class="am-btn-toolbar">
                                            <div class="am-btn-group am-btn-group-xs">
                                                <button type="button" class="am-btn am-btn-default am-btn-success"><span class="am-icon-plus"></span> 新增</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-secondary"><span class="am-icon-save"></span> 保存</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-warning"><span class="am-icon-archive"></span> 审核</button>
                                                <button type="button" class="am-btn am-btn-default am-btn-danger"><span class="am-icon-trash-o"></span> 删除</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="am-u-sm-12 ">
                                    <table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black ">
                                        <thead>
                                            <tr>
                                            	<th>行号</th>
                                            	<th>id</th>
                                                <th>文章缩略图</th>
                                                <th>文章标题</th>
                                                <th>作者</th>
                                                <th>时间</th>
                                                <th>操作</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                            	<td class="am-text-middle">
                                            		1
                                            	</td>
                                            	<td class="am-text-middle">
                                            		<label class="am-checkbox">
												      <input type="checkbox" value="" data-am-ucheck>
												    </label>
                                            	</td>
                                                <td>
                                                    <img src="<%=basePath%>StaticResource/access-access/test.jpg" class="tpl-table-line-img" alt="">
                                                </td>
                                                <td class="am-text-middle">Amaze UI 模式窗口</td>
                                                <td class="am-text-middle">张鹏飞</td>
                                                <td class="am-text-middle">2016-09-26</td>
                                                <td class="am-text-middle">
                                                    <div class="tpl-table-black-operation">
                                                        <a href="javascript:;">
                                                            <i class="am-icon-pencil"></i> 编辑
                                                        </a>
                                                        <a href="javascript:;" class="tpl-table-black-operation-del">
                                                            <i class="am-icon-trash"></i> 删除
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr class="even gradeC">
                                            	<td class="am-text-middle">
                                            		2
                                            	</td>
                                            	<td class="am-text-middle">
                                            		<label class="am-checkbox">
												      <input type="checkbox" value="" data-am-ucheck>
												    </label>
                                            	</td>
                                                <td>
                                                    <img src="<%=basePath%>StaticResource/access-access/test.jpg" class="tpl-table-line-img" alt="">
                                                </td>
                                                <td class="am-text-middle">我建议WEB版本文件引入问题</td>
                                                <td class="am-text-middle">罢了</td>
                                                <td class="am-text-middle">2016-09-26</td>
                                                <td class="am-text-middle">
                                                    <div class="tpl-table-black-operation">
                                                        <a href="javascript:;">
                                                            <i class="am-icon-pencil"></i> 编辑
                                                        </a>
                                                        <a href="javascript:;" class="tpl-table-black-operation-del">
                                                            <i class="am-icon-trash"></i> 删除
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                            <!-- more data -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
	<script src="<%=basePath%>plugins/AmazeUI/js/amazeui.min.js"></script>
    <script src="<%=basePath%>plugins/AmazeUI/js/amazeui.datatables.min.js"></script>
    <script src="<%=basePath%>plugins/AmazeUI/js/dataTables.responsive.min.js"></script>

</body>
<script type="text/javascript">
$(function(){
	var datagridOption = 
	{
		columns:
		[
	        {
	    		title:'权限名',
	    		field:'permissionName',
	    		align:'center',
	    		verticalAlign:'middle',
	    		checkbox:false,
	    		hidden:false,
	    		adClass:'',
	    		showInSM:true,
	    		formatter:function(value,rowData,rowIndex)
				{
					return value;
				}
			},{
	    		title:'id',
	    		field:'id',
	    		align:'center',
	    		verticalAlign:'middle',
	    		checkbox:false,
	    		hidden:true,
	    		adClass:'',
	    		showInSM:true,
	    		formatter:function(value,rowData,rowIndex)
				{
					return value;
				}
			},{
	    		title:'权限类型',
	    		field:'permissionType',
	    		align:'center',
	    		verticalAlign:'middle',
	    		checkbox:false,
	    		hidden:false,
	    		adClass:'',
	    		showInSM:true,
	    		formatter:function(value,rowData,rowIndex)
				{
					return value;
				}
			},{
	    		title:'权限SN',
	    		field:'sn',
	    		align:'center',
	    		verticalAlign:'middle',
	    		checkbox:false,
	    		hidden:false,
	    		adClass:'',
	    		showInSM:true,
	    		formatter:function(value,rowData,rowIndex)
				{
					return value;
				}
			},{
	    		title:'父权限名',
	    		field:'parentName',
	    		align:'center',
	    		verticalAlign:'middle',
	    		checkbox:false,
	    		hidden:false,
	    		adClass:'',
	    		showInSM:true,
	    		formatter:function(value,rowData,rowIndex)
				{
					return value;
				}
			},{
	    		title:'操作',
	    		field:'op',
	    		align:'center',
	    		verticalAlign:'middle',
	    		checkbox:false,
	    		hidden:false,
	    		adClass:'',
	    		showInSM:true,
	    		formatter:function(value,rowData,rowIndex)
				{
					return value;
				}
			},
	    ],
		toolbar:
		[{
			id:'btnadd',
			text:'新增',
			icon:'am-icon-plus',
			adclass:'am-btn-success',
			handler:function()
			{
				alert('新增');
			}
		},
		{
			id:'btnsave',
			text:'保存',
			icon:'am-icon-save',
			adclass:'am-btn-secondary',
			handler:function()
			{
				alert('保存');
			}
		},
		{
			id:'btnarchive',
			text:'审核',
			icon:'am-icon-archive',
			adclass:'am-btn-warning',
			handler:function()
			{
				alert('审核');
			}
		},
		{
			id:'btndel',
			text:'删除',
			icon:'am-icon-trash-o',
			adclass:'am-btn-danger',
			handler:function()
			{
				alert('删除');
			}
		}],
		pagination:true,
		paginationOption :
		{
		    totalBars: 100,  //总行数
		    limit: 10,  //每页显示数
		    offset: 1,  //当前页
		    jumpToPageFn: function(offset,limit)  //ajax返回处理
		    {
		    	alert("第"+offset+"页");
		    	//TODO 获取并显示第 offset 页数据
		    }
		}
	};
	
	$("#datagridDiv").mydatagrid(datagridOption);
	
});
</script>
</html>