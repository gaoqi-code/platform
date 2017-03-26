package com.hiveview.dao;

import com.hiveview.entity.MemberViewNeed;

public interface IMemberViewNeedDao extends IBaseDao<MemberViewNeed>{
    int deleteByPrimaryKey(Long id);

    int insert(MemberViewNeed record);

    int insertSelective(MemberViewNeed record);

    MemberViewNeed selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(MemberViewNeed record);

    int updateByPrimaryKey(MemberViewNeed record);
}