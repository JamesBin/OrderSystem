package com.back.controller;

import com.Interceptor.CheckLoginInterceptor;
import com.Interceptor.LoginInterceptor;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.front.controller.BaseController;
import com.front.model.*;
import com.jfinal.aop.Before;
import com.jfinal.aop.Clear;
import com.jfinal.ext.render.excel.PoiRender;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;
import com.util.MD5;
import com.util.NumFormatUtil;
import org.apache.commons.lang3.StringUtils;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 詹武槟 on 2016/1/21.
 */
@Before(CheckLoginInterceptor.class)
public class BackgroundController extends BaseController {
    private final static String SQL_ORDER_STORE = "select so.id as orderId ,st.id as storeId,so.arriveTime,so.createDate,so.orderNo,so.total,so.userId,so.`status`,st.storeName";
    private final static String SQL_ORDERITEM_FOOD = "from saleorderitem si LEFT JOIN food f on si.foodId = f.id where si.orderId = ";

    public BackgroundController() {
        setClazz(BackgroundController.class);
    }

    @Clear
    public void index() {
        getSession().invalidate();
        renderJsp("loginPage.jsp");
    }

    @Clear
    @Before(LoginInterceptor.class)
    public void adminLogin() {
        String username = getModel(User.class).getStr("username");
        String password = MD5.encryption(getModel(User.class).getStr("password"));
        User user = getModel(User.class).findFirst("select * from user where username = '" + username + "' and password = '" + password + "' and roleId = 1");
        if(user == null) {
            redirect("/back");
            return;
        }
        setSessionAttr("adminName", username);
        renderJsp("home.jsp");
    }

    public void mainPage() {
        renderJsp("home.jsp");
    }

    public void adminInfo() {
        User admin = getModel(User.class).findFirst("select * from user where roleId = 1");
        setAttr("admin", admin);
        renderJsp("adminInfo.jsp");
    }

    public void editAdminInfo() {
        getModel(User.class, "admin").update();
        renderJson();
    }

    public void commentManage() {
        Integer pageNumber = getParaToInt("pageNo") == null ? 1 : getParaToInt("pageNo");
        Integer pageSize = getParaToInt("pageSize") == null ? 5 : getParaToInt("pageSize");
        Page<Comment> pageList = getModel(Comment.class).paginate(pageNumber, pageSize, "select * from", "comment");
        setAttr("pageList", pageList);
        renderJsp("systemManage/commentManage.jsp");
    }

    public void menuManage() {
        Integer pageNumber = getParaToInt("pageNo") == null ? 1 : getParaToInt("pageNo");
        Integer pageSize = getParaToInt("pageSize") == null ? 5 : getParaToInt("pageSize");
        String searchName = getPara("searchName");
        String typeId = getPara("typeId");
        StringBuffer sb = new StringBuffer("from food where 1=1");
        if (StringUtils.isNotEmpty(typeId) && !typeId.equals("-1")) {
            sb.append(" and foodTypeId =" + typeId);
        }
        if (StringUtils.isNotEmpty(searchName)) {
            sb.append(" and foodName like '%"+searchName+"%'");
        }
        sb.append(" order by foodTypeId");

        Page<Food> pageList = getModel(Food.class)
                .paginate(pageNumber, pageSize, "select *", sb.toString());

        List<FoodType> foodTypeList = getModel(FoodType.class).find("select * from foodtype");
        setAttr("pageList", pageList);
        setAttr("foodTypeList", foodTypeList);
        setAttr("searchName", searchName);
        setAttr("typeId", typeId);
        renderJsp("systemManage/menuManage.jsp");
    }

    public void thirdPartyOrderManage() {
        Integer pageNumber = getParaToInt("pageNo") == null ? 1 : getParaToInt("pageNo");
        Integer pageSize = getParaToInt("pageSize") == null ? 5 : getParaToInt("pageSize");
        String search_orderNo = getPara("search_orderNo");
        String start_createTime = getPara("start_createTime");
        String end_createTime = getPara("end_createTime");
        String dateSelect = getPara("dateSelect") == null ? "choose" : getPara("dateSelect");

        StringBuffer sb = new StringBuffer("from SaleOrder so left join store st on so.storeId = st.id where source = 2");
        if (StringUtils.isNotEmpty(search_orderNo)) {
            sb.append(" and orderNo like '%"+search_orderNo+"%'");
        }
        if (StringUtils.isNotEmpty(start_createTime)) {
            sb.append(" and createDate >='" + start_createTime + "'");
        }

        if (StringUtils.isNotEmpty(end_createTime)) {
            sb.append(" and createDate <='" + end_createTime + "'");
        }
        sb.append(" order by createDate desc");
        Page<SaleOrder> pageList = getModel(SaleOrder.class).paginate(pageNumber, pageSize, SQL_ORDER_STORE, sb.toString());
        setAttr("pageList", pageList);
        setAttr("start_dataTime_value", start_createTime);
        setAttr("end_dataTime_value", end_createTime);
        setAttr("dateSelect", dateSelect);
        setAttr("search_orderNo", search_orderNo);
        renderJsp("orderManage/thirdPartyOrderManage.jsp");
    }

    public void phoneOrderManage() {
        Integer pageNumber = getParaToInt("pageNo") == null ? 1 : getParaToInt("pageNo");
        Integer pageSize = getParaToInt("pageSize") == null ? 5 : getParaToInt("pageSize");
        String search_orderNo = getPara("search_orderNo");
        String start_createTime = getPara("start_createTime");
        String end_createTime = getPara("end_createTime");
        String dateSelect = getPara("dateSelect") == null ? "choose" : getPara("dateSelect");

        StringBuffer sb = new StringBuffer("from SaleOrder so left join store st on so.storeId = st.id where source = 1");
        if (StringUtils.isNotEmpty(search_orderNo)) {
            sb.append(" and orderNo like '%"+search_orderNo+"%'");
        }
        if (StringUtils.isNotEmpty(start_createTime)) {
            sb.append(" and createDate >='" + start_createTime + "'");
        }

        if (StringUtils.isNotEmpty(end_createTime)) {
            sb.append(" and createDate <='" + end_createTime + "'");
        }
        sb.append(" order by createDate desc");
        Page<SaleOrder> pageList = getModel(SaleOrder.class).paginate(pageNumber, pageSize, SQL_ORDER_STORE, sb.toString());
        setAttr("pageList", pageList);
        setAttr("start_dataTime_value", start_createTime);
        setAttr("end_dataTime_value", end_createTime);
        setAttr("dateSelect", dateSelect);
        setAttr("search_orderNo", search_orderNo);
        renderJsp("orderManage/phoneOrderManage.jsp");
    }

    public void weiXinOrderManage() {
        Integer pageNumber = getParaToInt("pageNo") == null ? 1 : getParaToInt("pageNo");
        Integer pageSize = getParaToInt("pageSize") == null ? 5 : getParaToInt("pageSize");
        String search_orderNo = getPara("search_orderNo");
        String start_createTime = getPara("start_createTime");
        String end_createTime = getPara("end_createTime");
        String dateSelect = getPara("dateSelect") == null ? "choose" : getPara("dateSelect");

        StringBuffer sb = new StringBuffer("from SaleOrder so left join store st on so.storeId = st.id where source = 0");
        if (StringUtils.isNotEmpty(search_orderNo)) {
            sb.append(" and orderNo like '%"+search_orderNo+"%'");
        }
        if (StringUtils.isNotEmpty(start_createTime)) {
            sb.append(" and createDate >='" + start_createTime + "'");
        }

        if (StringUtils.isNotEmpty(end_createTime)) {
            sb.append(" and createDate <='" + end_createTime + "'");
        }
        sb.append(" order by createDate desc");
        Page<SaleOrder> pageList = getModel(SaleOrder.class).paginate(pageNumber, pageSize, SQL_ORDER_STORE, sb.toString());
        setAttr("pageList", pageList);
        setAttr("start_dataTime_value", start_createTime);
        setAttr("end_dataTime_value", end_createTime);
        setAttr("dateSelect", dateSelect);
        setAttr("search_orderNo", search_orderNo);
        renderJsp("orderManage/weiXinOrderManage.jsp");
    }

    public void weiXinOrderManageDetail() {
        Integer orderId = getParaToInt("orderId");
        Integer pageNumber = getParaToInt("pageNo") == null ? 1 : getParaToInt("pageNo");
        Integer pageSize = getParaToInt("pageSize") == null ? 5 : getParaToInt("pageSize");
        Page<SaleOrderItem> pageList = getModel(SaleOrderItem.class).paginate(pageNumber, pageSize, "select *", SQL_ORDERITEM_FOOD + orderId);
        setAttr("pageList", pageList);
        renderJsp("orderManage/weiXinOrderManageDetail.jsp");
    }

    public void logManage() {
        renderJsp("systemManage/logManage.jsp");
    }

    public void userManage() {
        Integer pageNumber = getParaToInt("pageNo") == null ? 1 : getParaToInt("pageNo");
        Integer pageSize = getParaToInt("pageSize") == null ? 5 : getParaToInt("pageSize");
        String searchName = getPara("searchName");
        String searchNum = getPara("searchNum");
        StringBuffer sb = new StringBuffer("from user where roleId = 2");
        if (searchName != null && searchName != "") {
            sb.append(" and username like '%"+searchName+"%'");
        }
        if (searchNum != null && searchNum != "") {
            sb.append(" and mobile like '%"+searchNum+"%'");
        }
        sb.append(" order by id");
        Page<User> pageList = getModel(User.class).paginate(pageNumber, pageSize, "select *", sb.toString());
        setAttr("pageList", pageList);
        setAttr("searchName", searchName);
        setAttr("searchNum", searchNum);
        renderJsp("systemManage/userManage.jsp");
    }

    public void saveFood() {
        UploadFile file =  getFile("image");
        String fileName = "resources/upload/" + file.getFileName();
        Food food = getModel(Food.class, "food").set("image", fileName);
        food.save();
        redirect("/back/menuManage");
    }

    public void saveUser() {
        User user = getModel(User.class, "user");
        user.set("password", MD5.encryption(user.getStr("password")));
        user.save();
        redirect("/back/userManage");
    }

    public void editFood() {
        UploadFile file =  getFile("editImage");
        Food food = getModel(Food.class, "food");
        if (file != null) {
            food.set("image", "resources/upload/" + file.getFileName());
        }
        food.update();
        redirect("/back/menuManage");
    }

    public void editUser() {
        getModel(User.class, "user").update();
        redirect("/back/userManage");
    }

    public void editOrder() {
        getModel(SaleOrder.class, "order").update();
        redirect("/back/weiXinOrderManage");
    }

    public void resetUserPwd() {
        getModel(User.class, "user").set("password", MD5.encryption("123456")).update();
        renderJson();
    }

    public void deleteFood() {
        String foodId = getPara("foodId");
        Db.deleteById("food", foodId);
        renderJson();
    }

    public void getFoodInfoById() {
        Integer id = getParaToInt("id");
        Food food = getModel(Food.class).findById(id);
        setAttr("food", food);
        renderJson();
    }

    public void getUserInfoById() {
        Integer id = getParaToInt("id");
        User user = getModel(User.class).findById(id);
        setAttr("user", user);
        renderJson();
    }

    public void getOrderInfoById() {
        Integer id = getParaToInt("id");
        SaleOrder saleOrder = getModel(SaleOrder.class).findById(id);
        List<Store> storeList = getModel(Store.class).find("select * from store");
        setAttr("saleOrder", saleOrder);
        setAttr("storeList", storeList);
        renderJson();
    }

    public void saveFoodType() {
        getModel(FoodType.class, "type").save();
        redirect("/back/menuManage");
    }

    public void deleteBySelectId() {
        String ids = getPara("ids");
        Db.update("delete from food where id in (" + ids + ")");
        renderJson();
    }

    @Clear
    public void logout () {
        HttpSession session = getSession();
        session.invalidate();
        redirect("/back");
    }

    public void deleteUserBySelectId() {
        String ids = getPara("ids");
        Db.update("delete from user where id in (" + ids + ")");
        renderJson();
    }

    public void deleteOrderBySelectId() {
        String ids = getPara("ids");
        Db.update("delete from order where id in (" + ids + ")");
        renderJson();
    }

    public void deleteUser() {
        String userId = getPara("userId");
        Db.deleteById("user", userId);
        renderJson();
    }

    public void monthSaleReport() {
        renderJsp("reportManage/monthSaleReport.jsp");
    }

    public void yearSaleReport() {
        renderJsp("reportManage/yearSaleReport.jsp");
    }

    public void productHeatReport() {
        renderJsp("reportManage/productHeatReport.jsp");
    }

    public void customHeatReport() {
        renderJsp("reportManage/customHeatReport.jsp");
    }

    public void userToExcel() {
        Integer pageNumber = getParaToInt("pageNo") == null ? 1 : getParaToInt("pageNo");
        Integer pageSize = getParaToInt("pageSize") == null ? 5 : getParaToInt("pageSize");
        String searchName = getPara("searchName");
        String searchNum = getPara("searchNum");
        StringBuffer sb = new StringBuffer();
        sb.append("from user where 1=1");
        if (searchName != null && searchName != "") {
            sb.append(" and username like '%"+searchName+"%'");
        }
        if (searchNum != null && searchNum != "") {
            sb.append(" and mobile like '%"+searchNum+"%'");
        }
        sb.append(" order by id");
        Page<User> pageList = getModel(User.class).paginate(pageNumber, pageSize, "select *", sb.toString());

        String[] heades = {"ID","用户名","备注","地址","密码","手机号码"};
        try {
            PoiRender excel = new PoiRender(pageList.getList());
            render(excel.fileName("user.xls").sheetName("客户信息列表").headers(heades).cellWidth(4000));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void menuToExcel() {
        Integer pageNumber = getParaToInt("pageNo") == null ? 1 : getParaToInt("pageNo");
        Integer pageSize = getParaToInt("pageSize") == null ? 5 : getParaToInt("pageSize");
        String searchName = getPara("searchName");
        String typeId = getPara("typeId");
        StringBuffer sb = new StringBuffer();
        sb.append("from food where 1=1");
        if (StringUtils.isNotEmpty(typeId) && !typeId.equals("-1")) {
            sb.append(" and foodTypeId =" + typeId);
        }
        if (StringUtils.isNotEmpty(searchName)) {
            sb.append(" and foodName like '%"+searchName+"%'");
        }
        sb.append(" order by foodTypeId");
        Page<Food> pageList = getModel(Food.class).paginate(pageNumber, pageSize, "select *", sb.toString());

        String[] heades = {"ID","商品类型ID","价钱","描述","图片路径","商品名"};
        try {
            PoiRender excel = new PoiRender(pageList.getList());
            render(excel.fileName("menu.xls").sheetName("商品信息列表").headers(heades).cellWidth(4000));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void orderToExcel() {
        Integer pageNumber = getParaToInt("pageNo") == null ? 1 : getParaToInt("pageNo");
        Integer pageSize = getParaToInt("pageSize") == null ? 5 : getParaToInt("pageSize");
        String search_orderNo = getPara("search_orderNo");
        String start_createTime = getPara("start_createTime");
        String end_createTime = getPara("end_createTime");
        String dateSelect = getPara("dateSelect");

        StringBuffer sb = new StringBuffer();
        sb.append(" from SaleOrder so left join store st on so.storeId = st.id where 1=1");
        if (StringUtils.isNotEmpty(search_orderNo)) {
            sb.append(" and orderNo like '%"+search_orderNo+"%'");
        }
        if (StringUtils.isNotEmpty(start_createTime)) {
            sb.append(" and createDate >='" + start_createTime + "'");
        }

        if (StringUtils.isNotEmpty(end_createTime)) {
            sb.append(" and createDate <='" + end_createTime + "'");
        }
        sb.append(" order by createDate desc");
        Page<SaleOrder> pageList = getModel(SaleOrder.class).paginate(pageNumber, pageSize, SQL_ORDER_STORE, sb.toString());
        String[] heades = {"订单总额（元）","门店名","订单号","订单状态（0：未支付，1：支付）","配送时间段","用户ID", "创建日期", "门店ID", "订单ID"};
        try {
            PoiRender excel = new PoiRender(pageList.getList());
            render(excel.fileName("order.xls").sheetName("订单信息列表").headers(heades).cellWidth(5000));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void ajaxMonthSaleData() {
        List<Store> storeList = getModel(Store.class).find("select * from store");
        JSONArray jsonArray = new JSONArray();

        for (Store s : storeList) {
            List<SaleOrder> saleOrderList = getModel(SaleOrder.class).find("select sum(total) as total,DATE_FORMAT(createDate,'%m') as mon from saleorder s where s.storeId = '"+s.getInt("id")+"' GROUP BY DATE_FORMAT(createDate,'%m')");
            JSONObject jsonObject = new JSONObject();
            Double[] array = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,};

            for (SaleOrder so : saleOrderList) {
                String month = so.getStr("mon");
                Double total = so.getDouble("total");
                array[NumFormatUtil.strToInt(month) - 1] = total;
            }

            jsonObject.put("name", s.getStr("storeName"));
            jsonObject.put("data", array);
            jsonArray.add(jsonObject);
        }

        setAttr("data", jsonArray.toJSONString());
        renderJson();
    }

    public void ajaxYearSaleData () {
        List<Store> storeList = getModel(Store.class).find("select * from store");
        List<SaleOrder> yearList = getModel(SaleOrder.class).find("select DATE_FORMAT(createDate,'%Y') as year from saleorder s  GROUP BY DATE_FORMAT(createDate,'%Y')");
        JSONArray dataArray = new JSONArray();
        JSONArray yearArray = new JSONArray();

        for (SaleOrder so : yearList) {
            yearArray.add(so.getStr("year"));
        }

        for (Store s : storeList) {
            List<SaleOrder> saleOrderList = getModel(SaleOrder.class).find("select sum(total) as total,DATE_FORMAT(createDate,'%Y') as year from saleorder s  where storeId = '"+s.getInt("id")+"' GROUP BY DATE_FORMAT(createDate,'%Y')");
            JSONObject jsonObject = new JSONObject();
            JSONArray jsonArray = new JSONArray();

            int []years = new int[yearList.size()];
            Double []nums = new Double[yearList.size()];
            for (int i = 0 ; i < years.length; i++) {
                years[i] = Integer.parseInt(yearArray.get(i).toString());
                nums[i] = 0.0;
            }

            for (int i = 0 ; i < years.length; i++) {
                for (SaleOrder saleOrder : saleOrderList) {
                    Integer year = Integer.parseInt(saleOrder.getStr("year"));
                    if (years[i] == year) {
                        nums[i] = saleOrder.getDouble("total");
                    }
                }
            }

            jsonObject.put("name", s.getStr("storeName"));
            jsonObject.put("data", nums);
            dataArray.add(jsonObject);
        }

        setAttr("data", dataArray.toJSONString());
        System.out.println(dataArray.toJSONString());
        setAttr("year", yearArray.toJSONString());
        renderJson();
    }

    public void ajaxProductHeatData () {
        List<SaleOrderItem> saleOrderItemList = getModel(SaleOrderItem.class).find("select sum(s.quantity) num,f.foodName name from saleorderitem s LEFT JOIN food f on s.foodId=f.id  GROUP BY foodId");
        List<SaleOrderItem> totalList = getModel(SaleOrderItem.class).find("select sum(quantity) total from saleorderitem;");
        Double total = totalList.get(0).getBigDecimal("total").doubleValue();
        JSONArray jsonArray = new JSONArray();

        JSONArray nameJson = new JSONArray();
        JSONArray dataJson = new JSONArray();

        for (SaleOrderItem s : saleOrderItemList) {
            Integer num = s.getBigDecimal("num").intValue();
            String name = s.getStr("name");
            nameJson.add(name);
            dataJson.add(num);

            Double proportion = num / total;
            JSONArray pieArray = new JSONArray();
            pieArray.add(name);
            pieArray.add(proportion);
            jsonArray.add(pieArray);
        }

        setAttr("num", dataJson.toJSONString());
        setAttr("name", nameJson.toJSONString());
        setAttr("data", jsonArray.toJSONString());
        renderJson();
    }

    public void ajaxCustomHeatData () {
        List<User> userList = getModel(User.class).find("select count(mobile) num, u.mobile from saleorder s  LEFT JOIN user u on s.userId = u.id where s.status=1 GROUP BY u.mobile");
        List<User> totalList = getModel(User.class).find("select count(mobile) as total from saleorder s  LEFT JOIN user u on s.userId = u.id ");
        Double total = totalList.get(0).getLong("total").doubleValue();
        JSONArray jsonArray = new JSONArray();
        JSONArray mobileJson = new JSONArray();
        JSONArray numJson = new JSONArray();
        for (User u : userList) {
            Integer num = u.getLong("num").intValue();
            String mobile = u.getStr("mobile");
            mobileJson.add(mobile);
            numJson.add(num);

            Double proportion = num / total;
            JSONArray pieArray = new JSONArray();
            pieArray.add(mobile);
            pieArray.add(proportion);
            jsonArray.add(pieArray);
        }

        setAttr("mobile", mobileJson.toJSONString());
        setAttr("num", numJson.toJSONString());
        setAttr("data", jsonArray.toJSONString());
        renderJson();
    }
}
