package com.hiveview.service;

import com.hiveview.entity.Area;
import com.hiveview.entity.Category;
import com.hiveview.entity.Company;

import java.util.List;

/**
 * Created by hxq on 2017/3/13.
 */
public interface IAreaService {

    List<Area> getSonAreas(long parentId);

    List<Area> getAllOneLevel();
}
