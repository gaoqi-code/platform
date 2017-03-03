package com.hiveview.service.impl;

import com.hiveview.dao.AppDeveloperDao;
import com.hiveview.entity.AppDeveloper;
import com.hiveview.service.IDeveloperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by hxq on 2017/3/2.
 */
@Service
public class DeveloperServiceImpl implements IDeveloperService{

    @Autowired
    private AppDeveloperDao appDeveloperDao;

    @Override
    public List<AppDeveloper> queryMeg() {

//        return appDeveloperDao.queryMsg(1);
        AppDeveloper a = new AppDeveloper(  );
        a.setId(1);
        return appDeveloperDao.getList(a);
    }
}
