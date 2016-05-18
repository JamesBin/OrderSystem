package com.Interceptor;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import org.apache.commons.lang3.StringUtils;

/**
 * Created by 詹武槟 on 2016/3/9.
 * @Desc 实现登录AOP拦截
 */
public class CheckLoginInterceptor implements Interceptor {

    @Override
    public void intercept(Invocation inv) {
        Controller controller = inv.getController();
        String adminName = controller.getSessionAttr("adminName");

        if (StringUtils.isEmpty(adminName)) {
            controller.redirect("/back");
            return;
        }

        inv.invoke();
    }
}
