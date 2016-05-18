package com.front.controller;

import com.front.model.Location;
import com.front.model.Store;
import com.front.model.User;
import com.weixin.sdk.api.ApiResult;
import com.weixin.sdk.utils.HttpUtils;
import org.apache.commons.lang.StringUtils;

import java.util.List;
import java.util.Map;

public class StoreController extends BaseController {
    private static String getLocation = "http://api.map.baidu.com/geocoder/v2/";
    private static String coordsConvert = "http://api.map.baidu.com/geoconv/v1/";

    public StoreController() {
        setClazz(StoreController.class);
    }

    public void index() {
        String openid = getSessionAttr("openid");
        if (StringUtils.isEmpty(openid)) {
            setAttr("errorMsg", "获取微信用户OpenId出错了");
            renderJsp("/WEB-INF/common/error.jsp");
            return;
        }

        List<Store> storeList = getModel(Store.class).find("select * from store");
        Location location = getModel(Location.class).findFirst("select * from location where fromUserName = ?", openid);
        User user = getModel(User.class).findFirst("select * from user where openId = ?", openid);

        if (user == null) {
            User u = getModel(User.class);
            u.set("openId", openid);
            u.set("roleId", 2);
            u.save();
            setSessionAttr("user", u);
        } else {
            setSessionAttr("user", user);
        }

        if (location == null) {
            setAttr("currentLocation", "获取地理位置中...");
            renderJsp("store.jsp");
            return;
        }

        String scope = location.getStr("longitude") + "," + location.getStr("latitude");
        String coord = HttpUtils.post(coordsConvert, "coords=" + scope + "&from=1&to=5&ak=xEuq0k3P5spN9HarIN71hk2r");
        ApiResult coordResult = new ApiResult(coord);
        List<Map<String, Double>> coordsList = coordResult.get("result");
        Map<String, Double> coordsMap = coordsList.get(0);

        Double y = coordsMap.get("y");
        Double x = coordsMap.get("x");
        Double xy = Math.sqrt(x) + Math.sqrt(y);

        Store firstStore = storeList.get(0);
        Double min = xy - (Math.sqrt(firstStore.getDouble("longitude")) + Math.sqrt(firstStore.getDouble("latitude")));
        Integer storeId = firstStore.getInt("id");

        for (Store s : storeList) {
            Double sum = Math.sqrt(s.getDouble("longitude")) + Math.sqrt(s.getDouble("latitude"));
            Double distance = xy - sum;
            if (distance < min) {
                storeId = s.getInt("id");
            }
        }

        String locationInfo = HttpUtils.post(getLocation, "ak=xEuq0k3P5spN9HarIN71hk2r&callback=renderReverse&location=" + y + "," + x + "&output=json&pois=1");
        ApiResult locationResult = new ApiResult(locationInfo);
        Map<String, String> map = locationResult.get("result");
        String currentLocation = map.get("formatted_address");

        setSessionAttr("recommendStore", storeId);
        setAttr("currentLocation", currentLocation);
        setAttr("storeList", storeList);
        renderJsp("store.jsp");
    }
}
