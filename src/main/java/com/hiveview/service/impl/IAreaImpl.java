package com.hiveview.service.impl;

import com.hiveview.dao.IAreaDao;
import com.hiveview.dao.INeedDao;
import com.hiveview.entity.Area;
import com.hiveview.service.IAreaService;
import com.hiveview.util.LevelUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by hxq on 2017/3/13.
 */
@Service
public class IAreaImpl implements IAreaService {

    @Autowired
    private IAreaDao areaDao;

    @Override
    public List<Area> getSonAreas(long parentId) {
        Area area = new Area();
        area.setParentId(parentId);
        return areaDao.getList(area);
    }

    @Override
    public List<Area> getAllOneLevel() {
        Area area = new Area();
        area.setLevel(LevelUtil.ONE_LEVEL.getVal());
        return areaDao.getList(area);
    }

}
