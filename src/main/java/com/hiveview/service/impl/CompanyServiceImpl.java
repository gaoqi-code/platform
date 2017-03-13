package com.hiveview.service.impl;

import com.hiveview.dao.ICompanyDao;
import com.hiveview.entity.Company;
import com.hiveview.service.ICompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by hxq on 2017/3/13.
 */
@Service
public class CompanyServiceImpl implements ICompanyService {

    @Autowired
    private ICompanyDao companyDao;

    @Override
    public String getCompanyNameById(Long id) {
        Company company = companyDao.selectByPrimaryKey(id);
        return company.getCompanyName();
    }
}
