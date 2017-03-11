package com.hiveview.service;

/**
 * Created by hxq on 2017/3/2.
 */
public  interface IRegisterService {

    /**
     * 验证手机号是否可以进行注册
     * @param phone
     * @return
     */
    public boolean checkPhoneRegister(String phone);

    /**
     * 验证密码是否正确
     * @param memberId
     * @param oldPW
     * @return
     */
    boolean verifyPW(long memberId, String oldPW);
}
