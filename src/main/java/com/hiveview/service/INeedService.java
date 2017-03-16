package com.hiveview.service;

import com.hiveview.entity.Need;

import java.util.List;

/**
 * Created by hxq on 2017/3/13.
 */
public interface INeedService {

    int saveNeed(Need need);

    /**
     * 获得需求页
     * @param need
     * @return
     */
    List<Need> getNeedPage(Need need);

    int updateNeed(Need need);

    Need getNeedByIdAndMId(Long needId, Long memberId);
}
