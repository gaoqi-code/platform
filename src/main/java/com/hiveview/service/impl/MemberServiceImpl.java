package com.hiveview.service.impl;

import com.hiveview.dao.IMemberDao;
import com.hiveview.entity.Member;
import com.hiveview.service.IMemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

/**
 * Created by hxq on 2017/3/2.
 */


@Service
public  class MemberServiceImpl implements IMemberService{

    @Autowired
    private IMemberDao memberDao;

    /**
     * 登录
     * @param member
     * @return
     */
    @Override
    public Member getMemberInfo(Member member){
        try {
            member.setPassword(DigestUtils.md5DigestAsHex(member.getPassword().getBytes()));
            return memberDao.get(member);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Integer updateMember(Member member) {
        return memberDao.updateByPrimaryKeySelective(member);
    }

    @Override
    public Integer saveMember(Member member) {
        return memberDao.insert(member);
    }

}
