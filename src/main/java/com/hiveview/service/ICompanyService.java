package com.hiveview.service;

import com.hiveview.entity.Company;

import java.util.List;

/**
 * Created by hxq on 2017/3/13.
 */
public interface ICompanyService {

    /**
     * 获得公司名称
     * @param id
     * @return
     */
    public String getCompanyNameById(Long id);

    /**
     *查询公司页面分页
     * @param company
     * @param start 开始数
     * @param count 查询数
     * @return
     */
    List<Company> getCompanyPage(Company company);

    int saveCompany(Company company);


}
