package com.hiveview.util;

/**
 * Created by hxq on 2017/3/15.
 */
public enum StatusUtil {
    VALID(1),//有效
    INVALID(2),//无效（删除）
    CHECKING(3),//审核中
    CHECK_SUCCESS(4),//审核成功
    CHECK_FAILED(5),//审核失败
    UN_SHELVE(6),//下架
    CLOSE(7),//关闭
    FREE_OF_CHARGE(8),//免费
    COLLECT_FEE(9);//收费

    private int val;
    StatusUtil(int p) {
        this.val=p;
    }

    public int getVal() {
        return val;
    }
}
