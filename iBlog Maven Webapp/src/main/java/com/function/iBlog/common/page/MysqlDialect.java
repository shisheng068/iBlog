package com.function.iBlog.common.page;


/**
 * oracle分页 
 * @author zqc
 *2015-1-22 下午03:39:40
 */
public class MysqlDialect implements Dialect{

	@Override
	public String changeToPageSql(String sql, PaginationVO page) {
        sql = sql.trim();
        StringBuffer pagingSelect = new StringBuffer(sql);
        pagingSelect.append(" limit ").append(page.getStart()).append(" , ").append(page.getRows());

        return pagingSelect.toString();

          
	}

}
