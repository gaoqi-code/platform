package com.hiveview.util;

/**
 * Created by hxq on 2017/3/15.
 */
public enum StatusUtil {
    CHECKING(0),//有效（审核成功）
    VALID(1),//有效（审核成功）
    INVALID(2);//审核失败

    private int val;
    StatusUtil(int p) {
        this.val=p;
    }

    public int getVal() {
        return val;
    }
}
