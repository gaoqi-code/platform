package com.hiveview.service.impl;

import com.hiveview.dao.INeedDao;
import com.hiveview.entity.Need;
import com.hiveview.service.INeedService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by hxq on 2017/3/13.
 */
@Service
public class NeedServiceImpl implements INeedService {

    @Autowired
    private INeedDao needDao;


    @Override
    public int saveNeed(Need need) {
        return needDao.insert(need);
    }

    @Override
    public List<Need> getNeedPage(Need need, int skipNo, int pageSize) {
        return needDao.getNeedPage(need,skipNo,pageSize);
    }

    @Override
    public int updateNeed(Need need) {
        return needDao.updateByPrimaryKeySelective(need);
    }

    @Override
    public Need getNeedByIdAndMId(Long needId, Long memberId) {
        return needDao.selectByPrimaryKey(needId,memberId);
    }
}
