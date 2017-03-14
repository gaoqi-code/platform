package com.hiveview.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by hxq on 2017/3/14.
 */
@Repository("pagingDao")
public interface IPagingDao{

    public int getTableTotal(@Param("tableName") String tableName);

}
