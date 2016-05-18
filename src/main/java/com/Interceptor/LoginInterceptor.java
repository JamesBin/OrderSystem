package com.Interceptor;


import com.front.model.User;
import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;

/**
 * Created by 詹武槟 on 2016/3/9.
 * @Desc 实现登录AOP拦截
 */
public class LoginInterceptor implements Interceptor {

    @Override
    public void intercept(Invocation inv) {
        Controller controller = inv.getController();
        User user = controller.getModel(User.class);
        if (user.getStr("username") == null || user.getStr("password") == null) {
            controller.redirect("/back");
            return;
        }

        inv.invoke();

    }
}
