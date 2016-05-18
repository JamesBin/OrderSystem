package com.weixin.sdk.api;

import com.weixin.sdk.api.ApiResult;
import com.weixin.sdk.api.UserApi;

import java.io.IOException;

public class UserApiTest {

	public static void main(String[] args) throws IOException {
		AccessTokenApiTest.main(args);
		
		ApiResult ar = UserApi.getFollows();
		System.out.println(ar.getJson());
	}
}
