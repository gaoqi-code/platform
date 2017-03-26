package com.hiveview.dao;

import com.hiveview.entity.Area;

public interface IAreaDao extends IBaseDao<Area>{
    int deleteByPrimaryKey(Long id);

    int insert(Area record);

    int insertSelective(Area record);

    Area selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Area record);

    int updateByPrimaryKey(Area record);
}