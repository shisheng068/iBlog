package com.function.iBlog.common.page;


/**
 * oracle分页 
 * @author zqc
 *2015-1-22 下午03:39:40
 */
public class OracleDialect implements Dialect{

	@Override
	public String changeToPageSql(String sql, PaginationVO page) {
        sql = sql.trim();  
        boolean isForUpdate = false;  
        if (sql.toLowerCase().endsWith(" for update")) {  
            sql = sql.substring(0, sql.length() - 11);  
            isForUpdate = true;  
        }  
        StringBuffer pageSql = new StringBuffer(sql.length() + 100);  
        pageSql.append("select * from ( select row_.*, rownum rownum_ from ( ");  
        pageSql.append(sql);  
        pageSql.append(" ) row_ ) where rownum_ > " + page.getStart() + " and rownum_ <= " + page.getEnd());  
          
        if (isForUpdate) {  
            pageSql.append(" for update");  
        }  
        return pageSql.toString();  
	}

}
