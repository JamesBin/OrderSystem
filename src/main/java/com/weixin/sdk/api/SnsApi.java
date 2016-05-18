/**
 * Copyright (c) 2011-2015, Unas 小强哥 (unas@qq.com).
 * <p/>
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

package com.weixin.sdk.api;

import com.weixin.sdk.kit.ParaMap;
import com.weixin.sdk.utils.HttpUtils;

/**
 * 网页授权获取 access_token API
 */
public class SnsApi
{
    private static String getUserInfo = "https://api.weixin.qq.com/sns/userinfo";
    
    /**
     * 获取用户个人信
     * @param accessToken 调用凭证access_token
     * @param openId 普通用户的标识，对当前开发者帐号唯一
     * @return ApiResult
     */
    public static ApiResult getUserInfo(String accessToken, String openId)
    {
        ParaMap pm = ParaMap.create("access_token", accessToken).put("openid", openId).put("lang", "zh_CN");
        return new ApiResult(HttpUtils.get(getUserInfo, pm.getData()));
    }
    
    /**
     * 一步获取用户信息，注意此处会可能会返回null
     * @param code
     * @return
     */
    public static ApiResult getUserInfo(String code) {
        ApiConfig ac = ApiConfigKit.getApiConfig();
        String appId = ac.getAppId();
        String appSecret = ac.getAppSecret();
        
        SnsAccessToken token = SnsAccessTokenApi.getSnsAccessToken(appId, appSecret, code);
        if (null == token) {
            return null;
        }
        String openId = token.getOpenid();
        String accessToken =token.getAccessToken();
        return getUserInfo(accessToken, openId);
    }
    
}
