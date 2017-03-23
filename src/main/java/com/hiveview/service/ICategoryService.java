package com.hiveview.service;

import com.hiveview.entity.Attribute;
import com.hiveview.entity.Category;

import java.util.List;

/**
 * Created by hxq on 2017/3/13.
 */
public interface ICategoryService {

    /**
     * 获得所有的一级类目
     * @return
     */
    List<Category> getCategory(Category category);

    /**
     * 获得子类目
     * @param parentId
     * @return
     */
    List<Category> getSonCategory(long parentId);

    Category getCategoryById(Long classId);

    /**
     * 获得类目属性
     * @param l
     * @return
     */
    List<Attribute> getCategoryAttribute(long categoryId);
}
