package com.hiveview.dao;

import com.hiveview.entity.Attribute;

import java.util.List;

public interface INeedAttributeDao extends IBaseDao<Attribute>{
    int deleteByPrimaryKey(Long id);

    int insert(Attribute record);

    int insertSelective(Attribute record);

    Attribute selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Attribute record);

    int updateByPrimaryKey(Attribute record);

    /**
     * 批量保存属性
     * @param attributes
     * @return
     */
    int batchSaveAttr(List<Attribute> attributes);

    /**
     * 获得需求的属性
     * @param needId
     * @return
     */
    List<Attribute> getNeedAttr(Attribute attr);
}