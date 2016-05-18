package com.front.controller;
import com.front.model.Food;
import com.front.model.FoodType;
import com.front.model.Scope;
import com.front.model.Store;

import java.util.List;

public class FoodController extends BaseController{

    public FoodController() {
        setClazz(FoodController.class);
    }
    private static final String FOOD_SALEITEM = "select f.id,f.foodName,f.image,f.price,f.foodTypeId,sum(quantity) as amount from food f LEFT JOIN saleorderitem si on  f.id = si.foodId  GROUP BY f.id ORDER BY f.foodTypeId";

    public void index() {
		String storeId = getPara("id");
        if (storeId != null) {
            Store store = getModel(Store.class).findById(storeId);
            setAttr("store", store);
        }

		List<Food> foodList = getModel(Food.class).find(FOOD_SALEITEM);
        List<FoodType> foodTypeList = getModel(FoodType.class).find("select * from foodtype");
        List<Scope> scopeList = getModel(Scope.class).find("select * from scope where storeId = ?", storeId);
        setAttr("scopeList", scopeList);
        setAttr("foodList", foodList);
        setAttr("foodTypeList", foodTypeList);
		renderJsp("menu.jsp");
	}

    public void getMenuInfo() {
        renderJsp("menuInfoSave.jsp");
    }

    public void getAllUserMenu() {
        renderJson();
    }
}
