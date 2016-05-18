package com.Interceptor;


import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import com.jfinal.kit.PropKit;
import com.weixin.sdk.api.SnsAccessToken;
import com.weixin.sdk.api.SnsAccessTokenApi;
import org.apache.commons.lang3.StringUtils;

/**
 * Created by 詹武槟 on 2016/3/9.
 * @Desc 实现登录AOP拦截
 */
public class OauthInterceptor implements Interceptor {

    @Override
    public void intercept(Invocation inv) {
        Controller controller = inv.getController();
        String code = controller.getPara("code");

        if (StringUtils.isEmpty(code)) {
            controller.setAttr("errorMsg", "获取微信用户认证Code出错了");
            controller.renderJsp("/WEB-INF/common/error.jsp");
            return;
        }

        SnsAccessToken snsAccessToken = SnsAccessTokenApi.getSnsAccessToken(PropKit.get("appId"), PropKit.get("appSecret"), code);
        if (snsAccessToken == null) {
            controller.setAttr("errorMsg", "调用snsAccessToken接口出错了");
            controller.renderJsp("/WEB-INF/common/error.jsp");
            return;
        }

        inv.invoke();
    }
}
