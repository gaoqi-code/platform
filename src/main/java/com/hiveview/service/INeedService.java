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
     * @param skipNo
     * @param pageSize
     * @return
     */
    List<Need> getNeedPage(Need need, int skipNo, int pageSize);

    int updateNeed(Need need);

    Need getNeedByIdAndMId(Long needId, Long memberId);
}
