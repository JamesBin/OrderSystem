package com.weixin.sdk.api;

import com.jfinal.plugin.redis.RedisPlugin;
import com.weixin.sdk.api.AccessToken;
import com.weixin.sdk.api.AccessTokenApi;
import com.weixin.sdk.api.ApiConfig;
import com.weixin.sdk.api.ApiConfigKit;
import com.weixin.sdk.cache.RedisAccessTokenCache;

import java.io.IOException;

/**
 * AccessTokenApi 测试
 */
public class AccessTokenApiTest {

	public static String AppID = "wxa9c3511f266e9592";
	public static String AppSecret = "d4624c36b6795d1d99dcf0547af5443d";
	
	public static void init(){
		ApiConfig ac = new ApiConfig();
		ac.setAppId(AppID);
		ac.setAppSecret(AppSecret);
		ApiConfigKit.setThreadLocalApiConfig(ac);
	}

	public static void main(String[] args) throws IOException {
		init();
		useRedis();
		test();
	}

	public static void useRedis() {
		new RedisPlugin("main", "127.0.0.1").start();
		ApiConfigKit.setAccessTokenCache(new RedisAccessTokenCache());
	}

	public static void test() {
		AccessToken at = AccessTokenApi.getAccessToken();
		if (at.isAvailable())
			System.out.println("access_token : " + at.getAccessToken());
		else
			System.out.println(at.getErrorCode() + " : " + at.getErrorMsg());
		
		at = AccessTokenApi.getAccessToken();
		if (at.isAvailable())
			System.out.println("access_token : " + at.getAccessToken());
		else
			System.out.println(at.getErrorCode() + " : " + at.getErrorMsg());
		
		at = AccessTokenApi.getAccessToken();
		if (at.isAvailable())
			System.out.println("access_token : " + at.getAccessToken());
		else
			System.out.println(at.getErrorCode() + " : " + at.getErrorMsg());
	}

}
