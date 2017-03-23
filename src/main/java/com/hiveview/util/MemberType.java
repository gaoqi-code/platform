package com.hiveview.util;

/**
 * Created by hxq on 2017/3/23.
 */
public enum  MemberType {
    GENERAL(0),//普通会员
    ADVISER(1);//顾问

    private int val;

    MemberType(int p) {
        this.val = p;
    }

    public int getVal() {
        return val;
    }
}
