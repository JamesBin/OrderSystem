package com.weixin.sdk.utils;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.weixin.sdk.api.shakearound.bean.DeviceIdentifier;

public class JsonTest {

	static ObjectMapper objectMapper = new ObjectMapper();
	
	public static void main(String[] args) throws Exception {
		List<DeviceIdentifier> deviceIdentifierList = new ArrayList<DeviceIdentifier>();
		DeviceIdentifier dd = new DeviceIdentifier();
		dd.setDevice_id(10100);
		dd.setUuid("FDA50693-A4E2-4FB1-AFCF-C6EB07647825");
		dd.setMajor(10001);
		dd.setMinor(10002);
		deviceIdentifierList.add(dd);
		deviceIdentifierList.add(dd);
		
		System.out.println(objectMapper.writeValueAsString(deviceIdentifierList));
	}
}
