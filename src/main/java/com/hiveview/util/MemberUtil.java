package com.hiveview.util;

/**
 * Created by hxq on 2017/3/13.
 */
public enum MemberUtil {

    STATUS(1, 2);//会员状态1正常，2禁用

    private int normal;

    private int disable;


    MemberUtil(int i, int i1) {
        this.normal = i;
        this.disable = i1;
    }

    public int getNormal() {
        return normal;
    }

    public int getDisable() {
        return disable;
    }
}
