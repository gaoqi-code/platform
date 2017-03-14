package com.hiveview.dao;

import com.hiveview.entity.Company;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ICompanyDao extends IBaseDao<Company>{
    int deleteByPrimaryKey(Long id);

    int insert(Company record);

    int insertSelective(Company record);

    Company selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Company record);

    int updateByPrimaryKey(Company record);

    /**
     * 公司查询分页
     * @param company
     * @param start
     * @param count
     * @return
     */
    List<Company> getCompanyPage(@Param("company") Company company, @Param("start") int start, @Param("count") int count);
}