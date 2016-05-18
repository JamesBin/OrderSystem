package com.front.controller;
import com.front.model.Comment;
import com.front.model.Oauth;
import com.front.model.User;
import com.jfinal.kit.PropKit;
import com.util.DateUtil;
import com.weixin.sdk.api.*;
import com.weixin.sdk.jfinal.ApiController;
import org.apache.commons.lang.StringUtils;
public class UserController extends ApiController {


    public ApiConfig getApiConfig() {
        ApiConfig ac = new ApiConfig();

        // 配置微信 API 相关常量
        ac.setToken(PropKit.get("token"));
        ac.setAppId(PropKit.get("appId"));
        ac.setAppSecret(PropKit.get("appSecret"));

        /**
         *  是否对消息进行加密，对应于微信平台的消息加解密方式：
         *  1：true进行加密且必须配置 encodingAesKey
         *  2：false采用明文模式，同时也支持混合模式
         */
        ac.setEncryptMessage(PropKit.getBoolean("encryptMessage", false));
        ac.setEncodingAesKey(PropKit.get("encodingAesKey", "setting it in config file"));
        return ac;
    }

    public void index() {
        renderJsp("login.jsp");
    }

    public void oauth() {
        String code = getPara("code");
        if (StringUtils.isEmpty(code)) {
            setAttr("errorMsg", "获取微信用户认证Code出错了");
            renderJsp("/WEB-INF/common/error.jsp");
            return;
        }

        SnsAccessToken snsAccessToken = SnsAccessTokenApi.getSnsAccessToken(PropKit.get("appId"), PropKit.get("appSecret"), code);
        String openid = snsAccessToken.getOpenid();

        if (StringUtils.isEmpty(openid)) {
            setAttr("errorMsg", "获取微信用户OpenId出错了");
            renderJsp("/WEB-INF/common/error.jsp");
            return;
        }

        Oauth oauth = getModel(Oauth.class).findFirst("select * from oauth where openid = ?", openid);
        if (oauth == null) {
            renderJsp("oauth.jsp");
            return;
        }

        setSessionAttr("headimgurl", UserApi.getUserInfo(openid).getStr("headimgurl"));
        setSessionAttr("openid", openid);
        redirect("/store");
    }

    public void confirm() {
        String code = getPara("code");
        if (StringUtils.isEmpty(code)) {
            setAttr("errorMsg", "获取微信用户认证Code出错了");
            renderJsp("/WEB-INF/common/error.jsp");
            return;
        }

        SnsAccessToken snsAccessToken = SnsAccessTokenApi.getSnsAccessToken(PropKit.get("appId"), PropKit.get("appSecret"), code);
        String openid = snsAccessToken.getOpenid();
        if (StringUtils.isEmpty(openid)) {
            setAttr("errorMsg", "获取微信用户OpenId出错了");
            renderJsp("/WEB-INF/common/error.jsp");
            return;
        }

        String accessToken = snsAccessToken.getAccessToken();
        String refreshToken = snsAccessToken.getRefresh_token();
        Integer expiresIn = snsAccessToken.getExpiresIn();
        String unionid = snsAccessToken.getUnionid();
        String scope = snsAccessToken.getScope();


        getModel(Oauth.class)
                .set("openid", openid)
                .set("access_token", accessToken)
                .set("refresh_token", refreshToken)
                .set("expires_in", expiresIn)
                .set("unionid", unionid)
                .set("scope", scope)
                .save();

        ApiResult userResult = UserApi.getUserInfo(openid);
        setSessionAttr("headimgurl", userResult.getStr("headimgurl"));
        setSessionAttr("openid", openid);
        redirect("/store");
    }

    public void addUser() {
        String username = getModel(User.class).getStr("username");
        if (getModel(User.class).save()) {
            setAttr("username", username).renderJsp("menu.jsp");
        } else {
            renderJsp("register.jsp");
        }
    }

    public void editUser() {
        getModel(User.class).findById(getParaToInt());
        renderJsp("update.html");
    }

    public void updateUser() {
        getModel(User.class).update();
        renderJsp("main.html");
    }

    public void deleteUser() {
        getModel(User.class).deleteById(getParaToInt());
    }

    public void login() {
        String username = getModel(User.class).getStr("username");
        String password = getModel(User.class).getStr("password");
        getModel(User.class)
                .find("select * from User where username = '" + username + "' and password = '" + password + "'");
        setAttr("username", username);
        renderJsp("orderSuccess.jsp");
    }

    public void register() {
        renderJsp("register.jsp");
    }

    public void saveComment() {
        Comment comment = getModel(Comment.class, "comment");
        comment.set("createDate", DateUtil.nowDayTime());
        comment.set("status", 1).update();
        renderJson();
    }

}
