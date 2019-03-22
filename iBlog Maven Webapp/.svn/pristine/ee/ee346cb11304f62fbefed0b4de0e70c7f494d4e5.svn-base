(function ($) {  
    $.fn.mypaginator = function (options) 
    {  
        //this指向当前的选择器  
        var config = 
        {  
            totalBars: -1,  //总行数
            limit: -1,  //每页显示数
            offset: 1,  //当前页
            jumpToPageFn:function(offset,limit)
            {
            	;
            }
        }; 
        //合并参数  
        var opts = $.extend(config, options);  
        
        opts.liPageStr = '<li></li>';
        opts.liDisableClss = 'am-disabled';
        
        opts.aPageStr = '<a href="javascript:void(0);">2</a>';
        opts.aPageOffsetAttr = 'my-page-offset';
        
        opts.selectDivStr = '<div class="am-dropdown" data-am-dropdown></div>';
        opts.selectBtnStr = '<button class="am-btn am-btn-primary am-dropdown-toggle" data-am-dropdown-toggle></button>';
        opts.selectBtnTextStr = '<span class="">1/5<span>';
        opts.selectBtnIcon = '<span class="am-icon-caret-down"></span>';
        
        opts.selectUlStr = '<ul class="am-dropdown-content"></ul>';
        opts.selectLlStr = '<li></li>';
        opts.selectLlActiveClass = 'am-active';
        opts.selectLiTitleStr = '<li class="am-dropdown-header"></li>';
        opts.selectLiLineStr = '<li class="am-divider"></li>';

        
        function setAPageOffsetAttr($aBtn,offset)
        {
        	$aBtn.attr(opts.aPageOffsetAttr,offset);
        }
        
        function getAPageOffsetAttr($aBtn)
        {
        	return $aBtn.attr(opts.aPageOffsetAttr);
        }
        
        function setLiEnable($li,enable)
        {
        	$li.removeClass(opts.liDisableClss);
        	if(enable)
    		{
        		$li.removeClass(opts.liDisableClss);
    		}
        	else
    		{
        		$li.addClass(opts.liDisableClss);
    		}
        }
        
        function setSelectLlActive($li,active)
        {
        	$li.removeClass(opts.selectLlActiveClass);
        	if(!active)
    		{
        		$li.removeClass(opts.selectLlActiveClass);
    		}
        	else
    		{
        		$li.addClass(opts.selectLlActiveClass);
    		}
        }
  
        //计算总页数
        opts.totalpage = Math.ceil(opts.totalBars / opts.limit);  
        
        //重新装配分页按钮  
        var pageCore = function (offset,flash) 
        {  
            if (opts.offset == offset && true!=flash) //如果是当前页面，那么就什么事都不用干了！  
            {  
                return;  
            } 
            else 
            {  
                opts.target.empty();  
                //否则，清空所有的节点，重新向DOM插入新的分页按钮  
                var aBtn = $(opts.aPageStr);
                
                var preBar = $(opts.liPageStr);
                aBtn = $(opts.aPageStr);
                setAPageOffsetAttr(aBtn, parseInt(offset)-1);
                aBtn.text("<");
                preBar.append(aBtn);
                if(1 == offset)
            	{
                	setLiEnable(preBar,false);
            	}
                else
            	{
                	setLiEnable(preBar,true);
            	}
                
                var nextBar = $(opts.liPageStr);
                aBtn = $(opts.aPageStr);
                setAPageOffsetAttr(aBtn, parseInt(offset)+1);
                aBtn.text(">");
                nextBar.append(aBtn);
                if(offset == opts.totalpage)
            	{
                	setLiEnable(nextBar,false);
            	} 
                else
            	{
                	setLiEnable(nextBar,true);
            	}
                
                //组装中间的select节点
                var selectLi = $(opts.liPageStr);
                
                	var selectDiv = $(opts.selectDivStr);
                		var selectBtn = $(opts.selectBtnStr);
                			var selectBtnText = $(opts.selectBtnTextStr);
                			selectBtnText.text(offset+"/"+opts.totalpage);
                			selectBtn.append(selectBtnText);
                			var selectBtnIcon = $(opts.selectBtnIcon);
                			selectBtn.append(selectBtnIcon);
                		selectDiv.append(selectBtn);
                		
                        var selectUl = $(opts.selectUlStr);
                        	var iter = 1;
                        	for(iter = 1;iter<=opts.totalpage;iter++)
                    		{
                        		var selectIterLi = $(opts.selectLlStr);
	                    			var aPage = $(opts.aPageStr);
	                    			setAPageOffsetAttr(aPage,iter);
	                    			aPage.text(iter);
	                    			selectIterLi.append(aPage);
	                    		if(iter == offset)
	                			{
	                    			setSelectLlActive(selectIterLi,true);
	                			}
	                    		selectUl.append(selectIterLi);
                    		}
                        
                        selectDiv.append(selectUl);
                        $(selectDiv).dropdown({justify: selectDiv});
                        
                	selectLi.append(selectDiv);
                setLiEnable(selectLi,false);
                
                opts.target.append(preBar);  
                opts.target.append(selectLi);
                opts.target.append(nextBar);
                opts.offset = offset; //将偏移量赋值给config里面的offset  
            }  
        }  
  
        //清理函数，防止多绑定事件和重新计算分页  
        var clear = function () {  
            opts.target.empty().undelegate();  
        }  
  
  
        //初始化装配分页按钮  
        var init = function (jumpToPageFn) 
        {  
        	var offset = opts.offset; 
        	
            if (typeof (jumpToPageFn) != "function") 
            {  
                console.log("将不能正确的执行翻页函数");  
            } else 
            {  
                opts.jumpToPageFn = jumpToPageFn;  
            } 
            
            clear();  
            pageCore(offset,true);
            
            opts.target.delegate("a","click", 
        		function () 
	            {  
	                var offset = getAPageOffsetAttr($(this));  
	                opts.jumpToPageFn(offset,opts.limit);
	                pageCore(offset); 
	            }
            );  
        };  
        
        //绑定jq对象
        opts.target = this;
        
        init(opts.jumpToPageFn);//初始化分页引擎  
    }  
}(window.jQuery));