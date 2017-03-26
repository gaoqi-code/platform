package com.hiveview.service.impl;

import com.hiveview.dao.IMemberDao;
import com.hiveview.entity.Member;
import com.hiveview.service.IMemberService;
import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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

    @Override
    public List<Member> getRecommendCounselorList() {
        Member member = new Member();
        return memberDao.getList(member);
    }


    @Override
    public List<Member> getOpendMemberPage(Member member) {
        return memberDao.getOpendMember(member);
    }

    @Override
    public Member getMemberDetail(long memberId) {
        Member member = new Member();
        member.setId(memberId);
        List<Member> result = memberDao.getOpendMember(member);
        if (CollectionUtils.isNotEmpty(result)) {
            member = result.get(0);
        }
        return member;
    }

    @Override
    public Member getMemberById(Long memberId) {
        return memberDao.selectByPrimaryKey(memberId);
    }

    @Override
    public Map<String, Object> getViewNeedCount(Long memberId, long needId) {
        return memberDao.getViewNeedCount(memberId,needId);
    }

}
