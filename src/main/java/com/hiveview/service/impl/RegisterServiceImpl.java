package com.hiveview.service.impl;

import com.hiveview.dao.IMemberDao;
import com.hiveview.entity.Member;
import com.hiveview.service.IRegisterService;
import com.hiveview.util.log.LogMgr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by hxq on 2017/3/2.
 */


@Service
public  class RegisterServiceImpl implements IRegisterService{

    @Autowired
    private IMemberDao memberDao;

    @Override
    public boolean checkPhoneRegister(String phone) {
        int count = 0;
        try {
            count = memberDao.verifyPhoneRegister(phone);
        } catch (Exception e) {
            LogMgr.writeErrorLog("查询手机号出错", e);
        }
        return count == 0 ?true:false;
    }

    @Override
    public boolean verifyPW(long memberId, String oldPW) {
        boolean flag= true;
        Member member = new Member();
        member.setUserId(memberId);


//        int count= memberDao.get(memberId, oldPW);

        return flag;
    }

}
