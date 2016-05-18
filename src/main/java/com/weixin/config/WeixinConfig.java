package com.weixin.config;

import com.back.controller.BackgroundController;
import com.front.controller.*;
import com.front.model.*;
import com.jfinal.config.*;
import com.jfinal.core.JFinal;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.weixin.controller.WeixinApiController;
import com.weixin.controller.WeixinMsgController;
import com.weixin.sdk.api.ApiConfigKit;

public class WeixinConfig extends JFinalConfig {
    
    /**
     * 如果生产环境配置文件存在，则优先加载该配置，否则加载开发环境配置文件
     * @param pro 生产环境配置文件
     * @param dev 开发环境配置文件
     */
    public void loadProp(String pro, String dev) {
        try {
            PropKit.use(pro);
        }
        catch (Exception e) {
            PropKit.use(dev);
        }
    }
    
    public void configConstant(Constants me) {
        loadProp("a_little_config.txt", "a_little_config.txt");
        me.setDevMode(PropKit.getBoolean("devMode", false));
        me.setUploadedFileSaveDirectory(PropKit.get("imagePath"));

        // ApiConfigKit 设为开发模式可以在开发阶段输出请求交互的 xml 与 json 数据
        ApiConfigKit.setDevMode(me.getDevMode());
    }
    
    public void configRoute(Routes me) {
        /*前端路由*/
        me.add("/msg", WeixinMsgController.class);
        me.add("/pay",PaymentController.class, "/WEB-INF/_front/pay");
        me.add("/api", WeixinApiController.class, "/api");
        me.add("/store", StoreController.class, "/WEB-INF/_front/store");
        me.add("/menu", FoodController.class, "/WEB-INF/_front/menu");
        me.add("/user", UserController.class, "/WEB-INF/_front/user");
        me.add("/order", OrderController.class, "/WEB-INF/_front/order");
        me.add("/payment", PaymentController.class, "/WEB-INF/_front");

        /*后台路由*/
        me.add("/back", BackgroundController.class, "/WEB-INF/_back");
    }
    
    
    /**
	 * 配置插件
	 */
    public void configPlugin(Plugins me) {
    	// 配置C3p0数据库连接池插件
    			C3p0Plugin c3p0Plugin = new C3p0Plugin(PropKit.get("jdbcUrl"), PropKit.get("user"), PropKit.get("password").trim());
    			me.add(c3p0Plugin);

    			// 配置ActiveRecord插件
    			ActiveRecordPlugin arp = new ActiveRecordPlugin(c3p0Plugin);
    			me.add(arp);
    			arp.addMapping("user", User.class);	                  // 映射user  表到 User 模型
    			arp.addMapping("store", Store.class);	              // 映射store 表到 Store模型
    			arp.addMapping("food", Food.class);	                  // 映射food  表到 Food 模型
    			arp.addMapping("foodType", FoodType.class);	          // 映射foodType  表到 FoodType模型
                arp.addMapping("saleOrder", SaleOrder.class);         // 映射order 表到 Order模型
                arp.addMapping("saleOrderItem", SaleOrderItem.class); // 映射saleOrderItem 表到 SaleOrderItem模型
                arp.addMapping("payment", Payment.class);             // 映射payment 表到 SaleOrderItem模型
                arp.addMapping("scope", Scope.class);                 // 映射scope 表到 Scope模型
                arp.addMapping("oauth", Oauth.class);                 // 映射oauth 表到 Oauth模型
                arp.addMapping("location", Location.class);           // 映射location 表到 Location模型
                arp.addMapping("comment", Comment.class);             // 映射comment 表到 Comment
    }
    
    public void configInterceptor(Interceptors me) {
        
    }
    
    public void configHandler(Handlers me) {
        
    }
    
    public static void main(String[] args) {
        JFinal.start("webapp", 80, "/", 5);
    }
}