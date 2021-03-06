package com.weixin.controller;
import com.jfinal.kit.PropKit;
import com.weixin.sdk.api.*;
import com.weixin.sdk.jfinal.ApiController;

public class WeixinApiController extends ApiController {
    
    /**
     * 如果要支持多公众账号，只需要在此返回各个公众号对应的  ApiConfig 对象即可
     * 可以通过在请求 url 中挂参数来动态从数据库中获取 ApiConfig 属性值
     */
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

    /**
     * 获取公众号菜单
     */
    public void getMenu() {
        ApiResult apiResult = MenuApi.getMenu();
        if (apiResult.isSucceed())
            renderText(apiResult.getJson());
        else
            renderText(apiResult.getErrorMsg());
    }

    /**
     * 创建菜单
     */
    public void createMenu()
    {
//    	JSONObject btnOne = new JSONObject();
//    	btnOne.put("name", "我要点餐");
//    	btnOne.put("type", "view");
//    	btnOne.put("url",  "http://zwb163.6655.la/user");
    	
//    	JSONObject btnTwo = new JSONObject();
//    	btnTwo.put("name",  "精湛菜单");
//    	btnTwo.put("type", "click");
//    	btnTwo.put("key", "112");
//    	
//    	JSONObject btnThree = new JSONObject();
//    	btnThree.put("name",  "福利");
//    	btnThree.put("type", "view");
//    	btnThree.put("url", "http://zwb163.6655.la/profit");
//
//    	List<Object> list = new ArrayList<Object>();
//    	list.add(btnOne);
//    	list.add(btnTwo);
//    	list.add(btnThree);
    	
//    	JSONObject btn = new JSONObject();
//    	btn.put("button", list.toString());
//
//    	JSONArray menuAarry = new JSONArray();
//    	menuAarry.add(btn);
    	

    	//JSON格式如下所示：
        String str = "{\n" +
                "    \"button\": [\n" +
                "        {\n" +
                "            \"name\": \"我要点餐\",\n" +
                "            \"url\": \"http://open.weixin.qq.com/connect/oauth2/authorize?appid=wxa9c3511f266e9592&redirect_uri=http://os.carp.mopaasapp.com/user/oauth&response_type=code&scope=snsapi_userinfo&state=wx#wechat_redirect\",\n" +
                "            \"type\": \"view\"\n" +
                "        },\n" +
                "        {\n" +
                "            \"name\": \"优惠活动\",\n" +
                "            \"url\": \"http://open.weixin.qq.com/connect/oauth2/authorize?appid=wxa9c3511f266e9592&redirect_uri=http://os.carp.mopaasapp.com/user/oauth&response_type=code&scope=snsapi_userinfo&state=wx#wechat_redirect\",\n" +
                "\t    \"type\": \"view\"\n" +
                "        },\n" +
                "        {\n" +
                "\t    \"name\": \"联系我们\",\n" +
                "\t    \"url\": \"http://open.weixin.qq.com/connect/oauth2/authorize?appid=wxa9c3511f266e9592&redirect_uri=http://os.carp.mopaasapp.com/user/oauth&response_type=code&scope=snsapi_userinfo&state=wx#wechat_redirect\",\n" +
                "\t    \"type\": \"view\"\n" +
                "        }\n" +
                "    ]\n" +
                "}";
        ApiResult apiResult = MenuApi.createMenu(str);
        if (apiResult.isSucceed())
            renderText(apiResult.getJson());
        else
            renderText(apiResult.getErrorMsg());
    }

    /**
     * 获取公众号关注用户
     */
    public void getFollowers()
    {
        ApiResult apiResult = UserApi.getFollows();
        renderText(apiResult.getJson());
    }

    /**
     * 获取用户信息
     */
    public void getUserInfo()
    {
        ApiResult apiResult = UserApi.getUserInfo("ohbweuNYB_heu_buiBWZtwgi4xzU");
        renderText(apiResult.getJson());
    }

    /**
     * 发送模板消息
     */
    public void sendMsg()
    {
        String str = " {\n" +
                "           \"touser\":\"ohbweuNYB_heu_buiBWZtwgi4xzU\",\n" +
                "           \"template_id\":\"9SIa8ph1403NEM3qk3z9-go-p4kBMeh-HGepQZVdA7w\",\n" +
                "           \"url\":\"http://www.sina.com\",\n" +
                "           \"topcolor\":\"#FF0000\",\n" +
                "           \"data\":{\n" +
                "                   \"first\": {\n" +
                "                       \"value\":\"恭喜你购买成功！\",\n" +
                "                       \"color\":\"#173177\"\n" +
                "                   },\n" +
                "                   \"keyword1\":{\n" +
                "                       \"value\":\"去哪儿网发的酒店红包（1个）\",\n" +
                "                       \"color\":\"#173177\"\n" +
                "                   },\n" +
                "                   \"keyword2\":{\n" +
                "                       \"value\":\"1元\",\n" +
                "                       \"color\":\"#173177\"\n" +
                "                   },\n" +
                "                   \"remark\":{\n" +
                "                       \"value\":\"欢迎再次购买！\",\n" +
                "                       \"color\":\"#173177\"\n" +
                "                   }\n" +
                "           }\n" +
                "       }";
        ApiResult apiResult = TemplateMsgApi.send(str);
        renderText(apiResult.getJson());
    }

    /**
     * 获取参数二维码
     */
    public void getQrcode()
    {
        String str = "{\"expire_seconds\": 604800, \"action_name\": \"QR_SCENE\", \"action_info\": {\"scene\": {\"scene_id\": 123}}}";
        ApiResult apiResult = QrcodeApi.create(str);
        renderText(apiResult.getJson());

//        String str = "{\"action_name\": \"QR_LIMIT_STR_SCENE\", \"action_info\": {\"scene\": {\"scene_str\": \"123\"}}}";
//        ApiResult apiResult = QrcodeApi.create(str);
//        renderText(apiResult.getJson());
    }

    /**
     * 长链接转成短链接
     */
    public void getShorturl()
    {
        String str = "{\"action\":\"long2short\"," +
                "\"long_url\":\"http://wap.koudaitong.com/v2/showcase/goods?alias=128wi9shh&spm=h56083&redirect_count=1\"}";
        ApiResult apiResult = ShorturlApi.getShorturl(str);
        renderText(apiResult.getJson());
    }

    /**
     * 获取客服聊天记录
     */
    public void getRecord()
    {
        String str = "{\n" +
                "    \"endtime\" : 987654321,\n" +
                "    \"pageindex\" : 1,\n" +
                "    \"pagesize\" : 10,\n" +
                "    \"starttime\" : 123456789\n" +
                " }";
        ApiResult apiResult = CustomServiceApi.getRecord(str);
        renderText(apiResult.getJson());
    }

    /**
     * 获取微信服务器IP地址
     */
    public void getCallbackIp()
    {
        ApiResult apiResult = CallbackIpApi.getCallbackIp();
        renderText(apiResult.getJson());
    }
}