package com.hiveview.service.impl;

import com.hiveview.dao.ICompanyDao;
import com.hiveview.entity.Company;
import com.hiveview.service.ICompanyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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

    @Override
    public int saveCompany(Company company) {
        return companyDao.insert(company);
    }

    @Override
    public List<Company> getCompanyPage(Company company) {

        return companyDao.getCompany(company);
    }
}
