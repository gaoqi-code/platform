package com.hiveview.service.impl;

import com.hiveview.dao.INeedDao;
import com.hiveview.entity.Need;
import com.hiveview.service.INeedService;
import org.apache.commons.collections.CollectionUtils;
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
    public List<Need> getNeedPage(Need need) {
        return needDao.getNeed(need);
    }

    @Override
    public int updateNeed(Need need) {
        return needDao.updateByPrimaryKeySelective(need);
    }

    @Override
    public Need getNeedByIdAndMId(Long needId, Long memberId) {
        return needDao.selectByPrimaryKey(needId,memberId);
    }

    @Override
    public List<Need> getOpendNeedPage(Need need) {
        return needDao.getOpenNeed(need);
    }

    @Override
    public Need getNeedDetail(long needId) {
        Need need = new Need();
        need.setId(needId);
        List<Need> result = needDao.getOpenNeed(need);
        if (CollectionUtils.isNotEmpty(result)) {
            need = result.get(0);
        }
        return need;
    }
}
