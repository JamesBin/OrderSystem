package com.weixin.sdk.utils;

import com.weixin.sdk.utils.JsonUtils;
import com.weixin.sdk.utils.RetryUtils;
import org.junit.Assert;
import org.junit.Test;

import java.util.concurrent.Callable;

public class RetryUtilsTest {

	final String jsonStr1 = "{\"t\":\"xx\", \"tt\":\"xx\"}";
	final String jsonStr2 = "{\"t\":\"xxx\", \"tt\":\"xx\"}";
	
	@Test
	public void test1() {
		TestToken tt = RetryUtils.retryOnException(3, new Callable<TestToken>() {

			@Override
			public TestToken call() throws Exception {
				System.out.println("test1~");
				return JsonUtils.decode(jsonStr1, TestToken.class);
			}
			
		});
		
		Assert.assertEquals(tt.getT(), tt.getTt());
	}
	
	@Test
	public void test2() {
		TestToken tt = RetryUtils.retryOnException(3, new Callable<TestToken>() {

			@Override
			public TestToken call() throws Exception {
				System.out.println("test2~");
				return JsonUtils.decode(jsonStr2, TestToken.class);
			}
			
		});
		
		Assert.assertNotSame(tt.getT(), tt.getTt());
	}
	
}
