package com.front.controller;
import  com.jfinal.core.Controller;
import  com.jfinal.plugin.activerecord.Db;
import  com.jfinal.plugin.activerecord.Model;
import  com.jfinal.plugin.activerecord.Page;
import  com.jfinal.plugin.activerecord.Record;

/**
 * Created by zwb on 2016/2/3.
 */
public class BaseController extends Controller{
    private Class<?> clazz;                     // 对应的实体

    public Class<?> getClazz() {
        return clazz;
    }

    public void setClazz(Class<?> clazz) {
        this.clazz = clazz;
    }

    /**
     * 通用分页查找
     */
    public void getByPage() {
        Page<Record> list = Db.paginate(getParaToInt("pageNumber"),
                getParaToInt("pageSize"), "select *", "from " + getClazz().getSimpleName() + " order by id desc");
        renderJson(list);
    }

    /**
     * 通用查找全部
     */
    public void getAll() {
        renderJson(Db.find("select * from " + getClazz().getSimpleName() + ";"));
    }

    /**
     * 通用根据id查找
     */
    public void getById() {
        renderJson(Db.find("select * from " + getClazz().getSimpleName()
                + " where id = " + getParaToInt("id") + ";"));
    }

    /**
     * 通用新增
     *
     * @throws Exception
     */
    public void save() throws Exception {
        renderText(getModel(
                ((Model<?>) Class.forName(clazz.getName()).newInstance()).getClass()).save() + "");
    }

    /**
     * 通用修改
     *
     * @throws Exception
     */
    public void update() throws Exception {
        renderText(getModel(
                ((Model<?>) Class.forName(clazz.getName()).newInstance()).getClass()).update() + "");
    }

    /**
     * 通用删除
     *
     * @throws Exception
     */
    public void delete() throws Exception {
        renderText(getModel(
                ((Model<?>) Class.forName(clazz.getName()).newInstance()).getClass()).delete() + "");
    }
}
