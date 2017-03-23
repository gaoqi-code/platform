package com.hiveview.service.impl;

import com.hiveview.dao.ICategoryDao;
import com.hiveview.dao.IClassAttributeDao;
import com.hiveview.entity.Attribute;
import com.hiveview.entity.Category;
import com.hiveview.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by hxq on 2017/3/13.
 */
@Service
public class CategoryServiceImpl implements ICategoryService {

    @Autowired
    private ICategoryDao categoryDao;
    @Autowired
    private IClassAttributeDao classAttributeDao;


    @Override
    public List<Category> getCategory(Category category) {
        return categoryDao.getList(category);
    }

    @Override
    public List<Category> getSonCategory(long parentId) {
        return categoryDao.getSonCategory(parentId);
    }

    @Override
    public Category getCategoryById(Long classId) {
        return categoryDao.selectByPrimaryKey(classId);
    }

    @Override
    public List<Attribute> getCategoryAttribute(long categoryId) {
        Attribute attribute = new Attribute();
        attribute.setClassId(categoryId);
        return classAttributeDao.getList(attribute);
    }
}
