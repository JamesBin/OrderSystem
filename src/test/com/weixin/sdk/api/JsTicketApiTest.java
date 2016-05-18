package com.weixin.sdk.api;

import com.weixin.sdk.api.JsTicketApi;
import com.weixin.sdk.api.JsTicketApi.JsApiType;

import java.io.IOException;


public class JsTicketApiTest {

	public static void testJsApi() {
		System.out.println(JsTicketApi.getTicket(JsApiType.jsapi));
	}

	public static void testWxCard() {
		System.out.println(JsTicketApi.getTicket(JsApiType.wx_card));
	}

	public static void main(String[] args) throws IOException {
		AccessTokenApiTest.main(args);

		testJsApi();
		testWxCard();

		testJsApi();
		testWxCard();

		testJsApi();
		testWxCard();
	}

}
