package com.hiveview.service.impl;

import com.hiveview.dao.ICompanyDao;
import com.hiveview.entity.Company;
import com.hiveview.service.ITestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by hxq on 2017/3/13.
 */
@Service("testService")
public class TestServiceImpl implements ITestService {

    @Autowired
    private ICompanyDao companyDao;

    @Override
    public String getCompanyNameById(Long id) {
        Company company = companyDao.selectByPrimaryKey(id);
        return company.getCompanyName();
    }
}
