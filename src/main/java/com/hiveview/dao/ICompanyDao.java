package com.hiveview.dao;

import com.hiveview.entity.Company;

public interface ICompanyDao extends IBaseDao{
    int deleteByPrimaryKey(Long id);

    int insert(Company record);

    int insertSelective(Company record);

    Company selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Company record);

    int updateByPrimaryKey(Company record);
}