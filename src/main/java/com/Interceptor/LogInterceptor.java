package com.Interceptor;


import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;

/**
 * Created by 詹武槟 on 2016/3/9.
 * @Desc 实现日志AOP拦截
 */
public class LogInterceptor implements Interceptor {

    @Override
    public void intercept(Invocation inv) {
        System.out.println("before");
        inv.invoke();
        System.out.println("after");
    }
}
