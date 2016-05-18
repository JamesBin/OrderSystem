package com.weixin.sdk.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import com.jfinal.plugin.activerecord.CPI;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Record;

/**
 * Json转换
 * 默认使用jackson
 * 再次fastJson
 * 再次jfire-codejson
 * 最后使用jsonKit
 * 
 * 参考Spring4中的base64工具类
 *
 * @author L.cm
 * email: 596392912@qq.com
 * site:http://www.dreamlu.net
 * date 2015年5月13日下午4:58:33
 */
public final class JsonUtils {
	
	private JsonUtils() {}
	
	/**
	 * 将model转为json字符串
	 * @param model
	 * @return JsonString
	 */
	public static String toJson(Model<? extends Model<?>> model) {
		return toJson(CPI.getAttrs(model));
	}
	
	/**
	 * 将Collection<Model>转换为json字符串
	 * @param models
	 * @return JsonString
	 */
	public static String toJson(Collection<Model<? extends Model<?>>> models) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for (Model<? extends Model<?>> model : models) {
			list.add(CPI.getAttrs(model));
		}
		return toJson(list);
	}
	
	/**
	 * 将 record 转为json字符串
	 * @param record
	 * @return JsonString
	 */
	public static String toJson(Record record) {
		return toJson(record.getColumns());
	}
	
	/**
	 * 将List<Record>转换为json字符串
	 * @param models
	 * @return JsonString
	 */
	public static String toJson(List<Record> records) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		for (Record record : records) {
			list.add(record.getColumns());
		}
		return toJson(list);
	}
	
	// Json处理代理对象
	private static final JsonDelegate delegate;
	
	static {
		JsonDelegate delegateToUse = null;
		// com.fasterxml.jackson.databind.ObjectMapper?
		if (ClassUtils.isPresent("com.fasterxml.jackson.databind.ObjectMapper", JsonUtils.class.getClassLoader())) {
			delegateToUse = new JacksonDelegate();
		}
		// com.alibaba.fastjson.JSONObject?
		else if (ClassUtils.isPresent("com.alibaba.fastjson.JSONObject", JsonUtils.class.getClassLoader())) {
			delegateToUse = new FastJsonDelegate();
		}
		//link.jfire.codejson.JsonTool
		else if (ClassUtils.isPresent("link.jfire.codejson.JsonTool", JsonUtils.class.getClassLoader())) {
			delegateToUse = new JfireJsonDelegate();
		}
		// com.jfinal.kit.JsonKit
		else if (ClassUtils.isPresent("com.jfinal.kit.JsonKit", JsonUtils.class.getClassLoader())) {
			delegateToUse = new JsonKitDelegate();
		}
		delegate = delegateToUse;
	}
	
	/**
	 * Json 委托，默认使用
	 * 默认使用jackson
	 * 再次fastJson
	 * 最后使用jsonKit
	 */
	private interface JsonDelegate {
		// 对象转json
		String toJson(Object object);
		// json转对象
		<T> T decode(String jsonString, Class<T> valueType);
	}
	
	/**
	 * jackson委托
	 */
	private static class JacksonDelegate implements JsonDelegate {
		private com.fasterxml.jackson.databind.ObjectMapper objectMapper = new com.fasterxml.jackson.databind.ObjectMapper();
		
		@Override
		public String toJson(Object object) {
			try {
				return objectMapper.writeValueAsString(object);
			} catch (com.fasterxml.jackson.core.JsonProcessingException e) {
				throw new RuntimeException(e);
			}
		}

		@Override
		public <T> T decode(String jsonString, Class<T> valueType) {
			try {
				return objectMapper.readValue(jsonString, valueType);
			} catch (IOException e) {
				throw new RuntimeException(e);
			}
		}
	}
	
	/**
	 * fastJson委托
	 */
	private static class FastJsonDelegate implements JsonDelegate {
		
		@Override
		public String toJson(Object object) {
			return com.alibaba.fastjson.JSONObject.toJSONString(object);
		}
		
		@Override
		public <T> T decode(String jsonString, Class<T> valueType) {
			return com.alibaba.fastjson.JSON.parseObject(jsonString, valueType);
		} 
	}
	
	/**
	 * JsonKit委托
	 */
	private static class JsonKitDelegate implements JsonDelegate {
		
		@Override
		public String toJson(Object object) {
			return com.jfinal.kit.JsonKit.toJson(object);
		}
		
		@Override
		public <T> T decode(String jsonString, Class<T> valueType) {
			throw new RuntimeException("Jackson or Fastjson or jfire-codejson are not supported~");
		}
	}
	
	/**
	 * JfireJson代理对象
	 */
	private static class JfireJsonDelegate implements JsonDelegate {
		
		@Override
		public String toJson(Object object) {
			return link.jfire.codejson.JsonTool.toString(object);
		}
		
		@SuppressWarnings("unchecked")
		@Override
		public <T> T decode(String jsonString, Class<T> valueType) {
			if (List.class.isAssignableFrom(valueType)) {
				return (T) link.jfire.codejson.JsonTool.fromString(jsonString);
			}
			if (Map.class.isAssignableFrom(valueType)) {
				return (T) link.jfire.codejson.JsonTool.fromString(jsonString);
			}
			return link.jfire.codejson.JsonTool.read(valueType, jsonString);
		}
		
	}
	
	/**
	 * 将 Object 转为json字符串
	 * @param record
	 * @return JsonString
	 */
	public static String toJson(Object object) {
		if (delegate == null) {
			throw new RuntimeException("Jackson, Fastjson or jfire-codejson or JsonKit not supported");
		}
		return delegate.toJson(object);
	}
	
	/**
	 * 将 json字符串 转为Object
	 * @param jsonString
	 * @param valueType
	 * @return T
	 */
	public static <T> T decode(String jsonString, Class<T> valueType) {
		if (delegate == null) {
			throw new RuntimeException("Jackson, Fastjson or jfire-codejson or JsonKit not supported");
		}
		return delegate.decode(jsonString, valueType);
	}
	
}
