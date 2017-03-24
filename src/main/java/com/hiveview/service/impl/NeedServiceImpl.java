package com.hiveview.service.impl;

import com.hiveview.dao.INeedAttributeDao;
import com.hiveview.dao.INeedDao;
import com.hiveview.entity.Attribute;
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
    @Autowired
    private INeedAttributeDao needAttributeDao;


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
        need = needDao.getNeedDetail(need);
        return need;
    }

    @Override
    public int deleteAttributeByNeedId(Long needId) {
        Attribute attribute = new Attribute();
        attribute.setNeedId(needId);
        return needAttributeDao.delete(attribute);
    }

    @Override
    public int batchSaveAttr(List<Attribute> attributes) {
        return needAttributeDao.batchSaveAttr(attributes);
    }

    @Override
    public List<Attribute> getNeedAttr(Long needId) {
        Attribute attribute = new Attribute();
        attribute.setNeedId(needId);
        return needAttributeDao.getNeedAttr(attribute);
    }
}
