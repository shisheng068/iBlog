(function ($) 
{  
	//默认参数
    $.fn.mydatagrid = function (options,param) 
    {  
    	if (typeof options == "string") {  
            return $.fn.mydatagrid.methods[options](this, param);  
        } 
        var config = 
        {  
			url:"",  //加载数据url
			pagination:true,  //是否显示分页
			rownumbers:true,  //是否显示行号
			remoteSort: true, //是否后端排序回传
			idField:'id',     //id标识列
			addClass:'',
			queryParams:      //默认查询参数
			{
			},
			ajaxSuccessCallBack:function(ret)
			{
			},
			ajaxErrorCallBack:function()
			{
			}
	
        };
        //合并参数  
        var opts = $.extend({},$.fn.mydatagrid.defaults, options);  
        
        opts.theadStr = '<thead></thead>';
        opts.trStr = '<tr></tr>';
        opts.thStr = '<th></th>';
        
        opts.tbodyStr = '<tbody></tbody>';
        opts.tdStr = '<td></td>';
        opts.tdVerticalCenterClass = 'am-text-middle';
        
        opts.checkboxStr = '<label class="am-checkbox"><input type="checkbox" value="" data-am-ucheck></label>';
        
        opts.btnDivStr = '<div class="am-u-sm-12 am-u-md-6 am-u-lg-6">'
        					+'<div class="am-form-group">'
        						+'<div class="am-btn-toolbar">'
        							+'<div class="am-btn-group am-btn-group-xs">'
        							+'</div></div></div></div>';
        
        opts.btnStr ='<button type="button" class="am-btn am-btn-default"></button>';
        opts.btnIconStr = '<span class=""></span>';
        opts.btnTextStr = '<span class=""></span>';
        
        opts.tableDivStr = '<div class="am-u-sm-12 "></div>';
        opts.tableStr = '<table width="100%" class="am-table am-table-compact am-table-striped tpl-table-black "></table>';
        
        opts.hiddenClass = 'mytable-hidden';
        opts.showInUpSMClass = '.am-show-sm-up';
        
        opts.paginationDivStr = '<div class="am-u-lg-12 am-cf"><div class="am-fr" ><ul class="my-pagination" id=""></ul></div></div>';
        
        //绑定jq对象
        opts.target = this;
        
        opts.btnOptionDefaults =
        	{
        		id:null,
				text:'按钮',
				icon:'icon-add',
				addClass:'',
				handler:function()
				{
					;
				}
        	};
        
        opts.columnsOptionDefaults =
        {
    		title:'',
    		field:'id',
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
		};
        
        opts.paginationOptionDefaults =
		{
		    totalBars: -1,  //总行数
		    limit: 10,  //每页显示数
		    offset: 1,  //当前页
		    jumpToPageFn: function(offset,limit)  //ajax返回处理
		    {
		    	
		    }
		};
        
        /**
         * 获取分页参数 当前页
         */
        function getOffset(opt)
        {
        	var offset = (null == opt.paginationOption.offset)?1:opt.paginationOption.offset;
        	return offset;
        }
        
        /**
         * 获取分页参数 每页行数
         */
        function getLimit(opt)
        {
        	var limit = (null == opt.paginationOption.limit)?1:opt.paginationOption.limit;
        	return limit;
        }
        
        /**
         * 获取ajax查询参数
         */
        function getQueryObj(opt)
        {
        	var queryObj;
        	if(typeof opt.queryParams == 'object')
    		{
        		queryObj = opt.queryParams;
    		}
        	else
    		{
        		queryObj = {};
    		}
        	queryObj.offset = getOffset(opt);
        	queryObj.limit = getLimit(opt);
        	
        	return queryObj;
        }
        
        /**
         * 使用ajax加载数据
         */
        function ajaxLoadData(opt,offset,queryObj,showDataFunction)
        {
        	if(typeof opt.showDataFunction != 'function')
    		{
        		queryObj = opt.queryParams;
    		}
        	queryObj.offset = offset;
        	$.ajax
        	({ 
        		type: opt.method, 
        		url: opt.url, 
        		data: queryObj, 
        		dataType: "json", 
        		success: function (ret) 
	        		{ 
        				if(null != ret)
    					{
        					var data = ret.data;
        					showDataFunction(data); 
    					}
        				opt.ajaxSuccessCallBack(ret);
        				
	        		}, 
            	error: function () 
            		{  
            			opt.ajaxErrorCallBack();
            		}  
            });  
        }
        
        /**
         * 清空div内容
         * @param opt
         * @returns
         */
        function clearDiv(opt)
        {
        	if(null != opt.target)
    		{
        		opt.target.empty();
    		}
        }
        
        /**
         * 获取按钮option
         * @param btnOption
         * @param opt
         * @returns
         */
        function getBtnOption(btnOption,opt)
        {
        	var option = $.extend({},opt.btnOptionDefaults, btnOption);  
        	return option;
        }
        
        /**
         * 获取最左下子节点（左先遍历第一个子节点）
         */
        function geBottomChild($object,seletor)
        {
        	var mySeletor = '';
        	if(null != seletor)
        	{
        		mySeletor = seletor;
        	}
        	var child = $object;
        	while(null != child && null !=child.children(mySeletor).get(0))
    		{
        		child = $(child.children(mySeletor).get(0));
    		}
        	return child;
        }
        
        /**
         * 获取最顶父节点
         */
        function getTopParent($object)
        {
        	var parent = $object;
        	while(null !=parent.parent().get(0))
    		{
        		parent = parent.parent();
    		}
        	return parent;
        }
        
        /**
         * 写入顶部按钮
         * @param opt
         * @returns
         */
        function loadTopBtn(opt)
        {
        	var btnDiv = $(opt.btnDivStr);
        	var btnGroupDiv = geBottomChild(btnDiv);
        	var iter = 0;
        	
        	if(typeof opt.toolbar =='array' || typeof opt.toolbar =='object')
    		{
        		for(iter = 0;iter<opt.toolbar.length;iter++)
    			{
        			var item = opt.toolbar[iter];
        			var itemOption = getBtnOption(item,opt);
        			var toolbarBtn = $(opt.btnStr);
        				var toolbarBtnIcon = $(opt.btnIconStr);
        				toolbarBtnIcon.addClass(itemOption.icon);
        				toolbarBtn.append(toolbarBtnIcon);
        				
        				var toolbarBtnText = $(opt.btnTextStr);
        				toolbarBtnText.text(itemOption.text);
        				toolbarBtn.append(toolbarBtnText);
        				
        			if(typeof itemOption.handler == 'function')
    				{
        				toolbarBtn.click(itemOption.handler);
    				}
        			toolbarBtn.attr('id',itemOption.id);
        			toolbarBtn.addClass(itemOption.adclass);
        			btnGroupDiv.append(toolbarBtn);
    			}
    		}
        	btnGroupDiv = getTopParent(btnGroupDiv);
        	opt.target.append(btnGroupDiv);
        	
        }
        
        /**
         * 获取列数据定义
         */
        function getColumnsOption(columnsOption,opt)
        {
        	var option = $.extend({},opt.columnsOptionDefaults, columnsOption);  
        	return option;
        }
        
        /**
         * 创建表格并写表头数据
         */
        function loadTable(opt)
        {
        	var tableDiv = $(opt.tableDivStr);
        		var table = $(opt.tableStr);
        			var thead = $(opt.theadStr);
        				var tr = $(opt.trStr);
        					var iter = 0;
        					if(typeof opt.columns =='array' || typeof opt.columns =='object')
    						{
	        					for(iter = 0;iter < opt.columns.length;iter++)
	    						{
	        						var item = opt.columns[iter];
	        						var itemOption = getColumnsOption(item,opt);
	        						var th = $(opt.thStr);
	        							th.data('option',itemOption);
	        							th.text(itemOption.title);
	        							th.addClass('am-text-'+itemOption.align);
	        							th.addClass('am-text-'+itemOption.align);
	        							if(true == itemOption.hidden)
        								{
	        								th.addClass(opt.hiddenClass);
        								}
	        							th.addClass(itemOption.adClass);
	        							if(false == itemOption.showInSM)
        								{
	        								th.addClass(opt.showInUpSMClass);
        								}
        							tr.append(th);
	    						}
    						}
        				thead.append(tr);
        			table.append(thead);
        		tableDiv.append(table);
        	opt.target.append(tableDiv);
        }
        
        /**
         * 获取分页定义数据
         */
        function getPaginationOption(paginationOption,opt)
        {
        	var option = $.extend({},opt.paginationOptionDefaults, paginationOption);  
        	return option;
        }
        
        /**
         * 创建分页栏
         */
        function loadPagination(opt)
        {
        	var paginationOption = getPaginationOption(opt.paginationOption,opt);
        	var paginationDiv = $(opt.paginationDivStr);
        	paginationDiv = geBottomChild(paginationDiv);
        		paginationDiv.mypaginator(paginationOption);
        	paginationDiv = getTopParent(paginationDiv);
        	if(false == opt.pagination)
			{
        		paginationDiv.addClass(opt.hiddenClass);
			}
        	opt.target.append(paginationDiv);
        }
        
        /**
         * 加载数据
         */
        function loadDataAjax(opt)
        {
        	
        }
        
        /**
         * 初始化表格
         * @param opt
         * @returns
         */
        function initDatagrid(opt)
        {
        	
        	//清空div
        	clearDiv(opt);
        	
        	//写顶部按钮
        	loadTopBtn(opt);
        	
        	//创建表格并写表头数据
        	loadTable(opt);
        	
        	//绑定翻页函数
        	
        	//绑定分页
        	loadPagination(opt);
        	
        	//ajax请求表格数据并写入表格
        	
        }
        
        initDatagrid(opts);
        
    }
    
    $.fn.mydatagrid.defaults = $.extend({}, 
	{
		url:"",  //加载数据url
		pagination:true,  //是否显示分页
		rownumbers:true,  //是否显示行号
		remoteSort: true, //是否后端排序回传
		idField:'id',     //id标识列
		adClass:'',
		queryParams:      //默认查询参数
		{
		},
		ajaxSuccessCallBack:function(ret)
		{
		},
		ajaxErrorCallBack:function()
		{
		}
	});
}(window.jQuery));