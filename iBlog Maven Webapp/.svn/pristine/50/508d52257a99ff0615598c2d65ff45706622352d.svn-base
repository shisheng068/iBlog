package com.function.iBlog.common.page;

public class DialectFactory {

/**
 * 分页SQL工厂类
 * @param dialect
 * @return
 */
	public static Dialect createDialect(String dialect)
	{
		if(dialect.trim().equalsIgnoreCase("oracle"))
			return new OracleDialect();
		else if(dialect.trim().equalsIgnoreCase("mysql"))
			return new MysqlDialect();
		else
			throw new  RuntimeException("-----not set dialect");
	}
}
