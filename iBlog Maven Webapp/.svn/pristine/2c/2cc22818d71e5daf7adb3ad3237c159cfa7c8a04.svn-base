package com.function.iBlog.common.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {
	
	private static Calendar c = Calendar.getInstance();
	
	public static final String DATAFORMAT_SHORT = "yyyy-MM-dd";
	
	public static final String DATAFORMAT_LONG = "yyyy-MM-dd HH:mm:ss";
	
	/**
	 * 判断STR是否为空字符串或者NULL，如果是返回TRUE,否则返回FALSE
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isEmptyString(String str) {
		return (str == null) || (str.trim().equals(""));
	}

	/**
	 * 将字符串形式的时间转换成long形式的秒数,按format的格式指定
	 * 
	 * @param format
	 * @param date
	 * @return
	 */
	public static long dateStr2Long(String format, String dateStr) {
		long date = 0;
		if (!isEmptyString(format) && !isEmptyString(dateStr)) {
			try {
				c.setTime(new SimpleDateFormat(format).parse(dateStr));
				date = c.getTimeInMillis() / 1000;
			} catch (ParseException e) {
				System.out.println("日期转换错误");
			}
		}
		return date;
	}

	/**
	 * 将字符串形式的时间转换成long形式的秒数,默认形式为见XML配置文件
	 * 
	 * @param dateStr
	 * @return
	 */
	public static long dateStr2Long(String dateStr) {
		return dateStr2Long(DATAFORMAT_SHORT, dateStr);
	}

	/**
	 * 将long型秒计量时间转换成format格式的字符串
	 * 
	 * @param format
	 * @param date
	 * @return
	 */
	public static String long2DateStr(String format, long date) {
		String dateStr = "";
		if (!isEmptyString(format) && 0 != date) {
			Date d = new Date(date * 1000);
			SimpleDateFormat sdf = new SimpleDateFormat(format);
			dateStr = sdf.format(d);
		}
		return dateStr;
	}

	/**
	 * 将long型时间转换成"yyyy-MM-dd HH:mm:ss"格式的字符串
	 * 
	 * @param date
	 * @return
	 */
	public static String long2DateStr(long date) {
		return long2DateStr("yyyy-MM-dd HH:mm:ss", date);
	}

	/**
	 * 获取当前日期前/后指定数量的日期，返回格式"yyyy-MM-dd"
	 * 
	 * @param amount
	 *            正数表示当前日期后多少天，负数表示当前日期前多少天
	 * @param format
	 *            返回格式
	 * @return
	 */
	public static String dayMove(int amount, String format) {
		String dateStr = "";
		if (!isEmptyString(format) && amount != 0) {
			c.setTime(new Date());
			c.roll(Calendar.DAY_OF_MONTH, amount);
			dateStr = long2DateStr(format, c.getTimeInMillis() / 1000);
		}
		return dateStr;
	}

	/**
	 * 获取当前时间，返回时间字符串。默认时间格式见配置文档的短时间格式串
	 * @return
	 */
	public static String nowDate()
	 {
	  Date date=new Date();
	  DateFormat format=new SimpleDateFormat(DATAFORMAT_SHORT);
	  String time=format.format(date);
	  return time;
	 }
	
	/**
	 * 获取当前时间，返回时间字符串。
	 * @param timeformat 使用的时间格式串
	 * @return
	 */
	public static String nowDate(String timeformat)
	 {
		try{
		  Date date=new Date();
		  DateFormat format=new SimpleDateFormat(timeformat);
		  String time=format.format(date);
		  return time;
		}catch(Exception e)
		{
			return "";
		}
	 }
	
	/**
	 * 获取当前时间，数字格式
	 * @return
	 */
	public static long nowDateOfLong()
	{
		return dateStr2Long(DATAFORMAT_LONG,nowDate(DATAFORMAT_LONG));
	}
}
