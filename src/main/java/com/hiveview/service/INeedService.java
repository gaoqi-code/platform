package com.hiveview.service;

import com.hiveview.entity.Attribute;
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

    List<Need> getOpendNeedPage(Need need);

    Need getNeedDetail(long needId);

    /**
     * 删除需求属性
     * @param id
     * @return
     */
    int deleteAttributeByNeedId(Long needId);

    /**
     * 批量存储
     * @param attributes
     * @return
     */
    int batchSaveAttr(List<Attribute> attributes);

    /**
     * List<Attribute> attributes
     * @param needId
     * @return
     */
    List<Attribute> getNeedAttr(Long needId);
}
