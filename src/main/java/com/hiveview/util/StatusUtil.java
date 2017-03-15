package com.hiveview.util;

/**
 * Created by hxq on 2017/3/15.
 */
public enum StatusUtil {
    VALID(1),//有效
    INVALID(2);//无效

    private int val;
    StatusUtil(int p) {
        this.val=p;
    }

    public int getVal() {
        return val;
    }
}
