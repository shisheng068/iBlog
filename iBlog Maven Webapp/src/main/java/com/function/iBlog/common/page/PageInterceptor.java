package com.function.iBlog.common.page;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Properties;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.reflection.MetaObject;
import org.apache.ibatis.scripting.defaults.DefaultParameterHandler;
import org.apache.ibatis.session.RowBounds;




/**
 * mybatis分页拦截器
 * @author zqc
 *2015-1-22 下午03:39:52
 */
@Intercepts({ @Signature(type = StatementHandler.class, method = "prepare", args = { Connection.class }) })  
public class PageInterceptor extends MyBatisInterceptor {  
    private final static Log log = LogFactory.getLog(PageInterceptor.class);  
    private String dialect; //使用哪种数据库方言
   
	@Override  
    public Object intercept(Invocation invocation) throws Throwable { 
        StatementHandler statementHandler = (StatementHandler) invocation.getTarget();  
        //元数据  
        MetaObject metaStatementHandler =  getMetaStatementHandler(statementHandler);
        MappedStatement mappedStatement = (MappedStatement)metaStatementHandler.getValue("delegate.mappedStatement");
               
        
        BoundSql boundSql = statementHandler.getBoundSql();
        Object parameterObject = boundSql.getParameterObject();  //传入参数对象
        String originalSql = boundSql.getSql();//得到原始sql语句
        
        //分页只针对查询语句
        if (mappedStatement.getSqlCommandType().name().equalsIgnoreCase("select")) {
        	if(parameterObject != null && (( parameterObject instanceof HashMap && metaStatementHandler.getValue("delegate.boundSql.parameterObject."+PaginationAndOrderVO.PAGE_KEY)!=null) || (parameterObject instanceof PaginationAndOrderVO)  ))
        	{
       		log.info("========page:enter pageIntereptor=======");
            log.info("========page:originalSQL:"+originalSql+"=====");
            //得到参数传入的页面对象
            PaginationAndOrderVO pageAndOrder=null;
            if(parameterObject instanceof HashMap)
            	pageAndOrder=(PaginationAndOrderVO)metaStatementHandler.getValue("delegate.boundSql.parameterObject."+PaginationAndOrderVO.PAGE_KEY);
            else
            	pageAndOrder=(PaginationAndOrderVO)parameterObject;
            
            String changedSQL=originalSql;//最终生成的SQL
            
            if(pageAndOrder.getOrders()!=null&&pageAndOrder.getOrders().size()>0) //需要排序
            {	
            	StringBuffer orderSQL=new StringBuffer(" order by ");
                for(OrderVO order:pageAndOrder.getOrders())
                	 orderSQL.append(order).append(",");
                 orderSQL.deleteCharAt(orderSQL.length()-1);
                 changedSQL+=orderSQL.toString();
            }
            
            if(pageAndOrder.getPage()!=null) //需要分页
            {
            	PaginationVO page=pageAndOrder.getPage();
            	if(page.getTotalItems()==-1) //表示从未取得过总记录数，需要取得总记录数
                 {
                 	Connection connection = (Connection) invocation.getArgs()[0];  
                     // 重设分页参数里的总页数等  
                     setPageParameter(originalSql, connection, mappedStatement, boundSql, page);  
                 	
                 }
                 else
                 log.info("=======page:not query totalItems,current totalItems:"+page.getTotalItems()+"====");
                 Dialect dialectObject = DialectFactory.createDialect(dialect);  
                 changedSQL=dialectObject.changeToPageSql(changedSQL,page);
                 
                 //采用物理分页后，就不需要mybatis的内存分页了，所以重置下面的两个参数
                 metaStatementHandler.setValue("delegate.rowBounds.offset", RowBounds.NO_ROW_OFFSET);  
                 metaStatementHandler.setValue("delegate.rowBounds.limit", RowBounds.NO_ROW_LIMIT);  
                 	
            }
            
            log.info("======page:final sql:"+changedSQL+"======");
            
            metaStatementHandler.setValue("delegate.boundSql.sql",changedSQL);  
        }  
        
        }
          
        return invocation.proceed();  
          
    }  
  
    @Override  
    public Object plugin(Object target) {  
    	 // 当目标类是StatementHandler类型时，才包装目标类，否者直接返回目标本身,减少目标被代理的次数
        if (target instanceof StatementHandler) {
            return Plugin.wrap(target, this);
        } else {
            return target;
        }
    }  
  
    @Override  
    public void setProperties(Properties properties) {  
  
    }  
    
    /** 
     * 从数据库里查询总的记录数，回写进分页参数<code>PaginationVO</code>,这样调用  
     *  
     * @param sql 
     * @param connection 
     * @param mappedStatement 
     * @param boundSql 
     * @param page 
     */  
    private void setPageParameter(String sql, Connection connection, MappedStatement mappedStatement,  
            BoundSql boundSql, PaginationVO page)throws Exception {  
        // 记录总记录数
        String countSql = "select count(0) from (" + sql + ") a ";
    	log.info("=========page:selectTotalItems:"+sql+"======");
        PreparedStatement countStmt = null;  
        ResultSet rs = null;  
        try {  
            countStmt = connection.prepareStatement(countSql);  
            BoundSql countBS = new BoundSql(mappedStatement.getConfiguration(), countSql,  
                    boundSql.getParameterMappings(), boundSql.getParameterObject());  
            setParameters(countStmt, mappedStatement, countBS, boundSql.getParameterObject());  
            rs = countStmt.executeQuery();  
            int totalCount = 0;  
            if (rs.next()) {  
                totalCount = rs.getInt(1);  
            }  
            page.setTotalItems(totalCount);
            log.info("=========page:selectTotalItems="+totalCount+"======");  
        } catch (SQLException e) {  
        	log.error("Ignore this exception", e);
        	throw e;
        } finally {  
            try {  
                rs.close();  
            } catch (SQLException e) {  
            	log.error("Ignore this exception", e);  
            }  
            try {  
                countStmt.close();  
            } catch (SQLException e) {  
            	log.error("Ignore this exception", e);  
            }  
        }  
    }  
      
    /** 
     * 对SQL参数(?)设值 
     *  
     * @param ps 
     * @param mappedStatement 
     * @param boundSql 
     * @param parameterObject 
     * @throws SQLException 
     */  
    private void setParameters(PreparedStatement ps, MappedStatement mappedStatement, BoundSql boundSql,  
            Object parameterObject) throws SQLException {  
        ParameterHandler parameterHandler = new DefaultParameterHandler(mappedStatement, parameterObject, boundSql);  
        parameterHandler.setParameters(ps);  
    }  
    
	public String getDialect() {
		return dialect;
	}

	public void setDialect(String dialect) {
		this.dialect = dialect;
	}
  
}  