package com.weixin.sdk.api;

import com.weixin.sdk.api.ApiResult;
import com.weixin.sdk.api.GroupsApi;

import java.io.IOException;

public class GroupsApiTest {

	public static void main(String[] args) throws IOException {
		AccessTokenApiTest.main(args);
		
		ApiResult ar = GroupsApi.create("testxx");
		System.out.println(ar.getJson());
		
		ApiResult ar1 = GroupsApi.get();
		System.out.println(ar1.getJson());
		
	}
}
