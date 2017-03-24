package com.hiveview.dao;

import com.hiveview.entity.Need;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface INeedDao extends IBaseDao<Need>{
    int deleteByPrimaryKey(Long id);

    int insert(Need record);

    int insertSelective(Need record);

    Need selectByPrimaryKey(@Param("needId")Long needId,@Param("memberId") Long memberId);

    int updateByPrimaryKeySelective(Need record);

    int updateByPrimaryKey(Need record);

    List<Need> getNeed(Need need);

    List<Need> getOpenNeed(Need need);

    Need getNeedDetail(Need need);
}