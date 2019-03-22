package com.function.iBlog.common.util;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.sdicons.json.mapper.JSONMapper;
import com.sdicons.json.mapper.MapperException;
import com.sdicons.json.model.JSONArray;
import com.sdicons.json.model.JSONValue;
import com.sdicons.json.parser.JSONParser;

  
/** 
 * JSON转换工具类 
 *  
 * @author San 
 * @date 2015-11-09
 */  
public class JsonUtil {  
    
    /** 
     * JAVA对象转换成JSON字符串 
     *  
     * @param obj JAVA对象 
     * @return JSON字符串 
     * @throws MapperException 
     */  
    public static String obj2Json(Object obj) throws MapperException {  
        return obj2Json(obj, false);  
    } 
    
    /** 
     * JAVA对象转换成JSON字符串 
     *  
     * @param obj JAVA对象 
     * @return JSON字符串 
     * @throws 不抛出异常 
     */  
    public static String obj2JsonNoException(Object obj) {  
    	String ret;
		try {
			ret = obj2Json(obj, false);
		} catch (MapperException e) {
			ret="{}";
			e.printStackTrace();
		}
        return ret;  
    }
  
    /** 
     * JAVA数组对象转换成JSON字符串 
     *  
     * @param list JAVA数组对象 
     * @return JSON字符串 
     * @throws MapperException 
     */  
    public static String obj2Json(List<Class<?>> list) throws MapperException {  
        if (list == null || list.size() == 0) {  
            return "{}";  
        }  
        StringBuilder jsonString = new StringBuilder();  
        for (int i = 0; i < list.size(); i++) {  
            if (i != 0) {  
                jsonString.append(",");  
            }  
            Class<?> cla = list.get(i);  
            jsonString.append(obj2Json(cla, false));  
        }  
        return jsonString.toString();  
    }  
  
    /** 
     * JAVA集合对象转换成JSON字符串 
     *  
     * @param map JAVA集合对象 
     * @return JSON字符串 
     * @throws MapperException 
     */  
    public static String obj2Json(Map<String, Class<?>> map) throws MapperException {  
        if (map == null || map.size() == 0) {  
            return "{}";  
        }  
        StringBuilder jsonString = new StringBuilder();  
        Set<String> keySet = map.keySet();  
        boolean isFirst = true;  
        for (String key : keySet) {  
            if (isFirst) {  
                isFirst = false;  
            } else {  
                jsonString.append(",");  
            }  
            Class<?> cla = map.get(key);  
            jsonString.append(obj2Json(cla, false));  
        }  
        return jsonString.toString();  
    }  
    
  
    /** 
     * 重载objectToJsonStr方法 
     *  
     * @param obj 需要转换的JAVA对象 
     * @param format 是否格式化 
     * @return JSON字符串 
     * @throws MapperException 
     */  
    public static String obj2Json(Object obj, boolean format) throws MapperException {  
        JSONValue jsonValue = JSONMapper.toJSON(obj);  
        String jsonStr = jsonValue.render(format);  
        return jsonStr;  
    }  
  
    /** 
     * JSON字符串转换成JAVA对象 
     *  
     * @param jsonStr JSON字符串 
     * @param cla JAVA对象 
     * @return 转换后的对象 
     */  
    public static Object json2Obj(String jsonStr, Class<?> cla) throws Exception {  
        Object obj = null;  
        try {  
            JSONParser parser = new JSONParser(new StringReader(jsonStr));  
            JSONValue jsonValue = parser.nextValue();  
            if (jsonValue instanceof com.sdicons.json.model.JSONArray) {  
                List<Object> list = new ArrayList<Object>();  
                JSONArray jsonArray = (JSONArray) jsonValue;  
                for (int i = 0; i < jsonArray.size(); i++) {  
                    JSONValue jsonObj = jsonArray.get(i);  
                    Object javaObj = JSONMapper.toJava(jsonObj, cla);  
                    list.add(javaObj);  
                }  
                obj = list;  
            } else if (jsonValue instanceof com.sdicons.json.model.JSONObject) {  
                obj = JSONMapper.toJava(jsonValue, cla);  
            } else {  
                obj = jsonValue;  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return obj;  
    }
}  