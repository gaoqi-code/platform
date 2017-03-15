package com.hiveview.util;

/**
 * Created by hxq on 2017/3/15.
 */
public enum LevelUtil {
    ONE_LEVEL(1),
    TWO_LEVEL(2),
    THREE_LEVEL(3);

    private int val;
    LevelUtil(int p) {
        this.val=p;
    }

    public int getVal() {
        return val;
    }
}
