package com.hiveview.service;

import com.hiveview.entity.Member;

import java.util.List;

public interface IMemberService {

	/**
	 * 获得会员信息
	 * @param member
	 * @return
	 */
	public Member getMemberInfo(Member member);

	Integer updateMember(Member member);

	Integer saveMember(Member member);

	/**
	 * 获得推荐顾问
	 * @return
	 */
	List<Member> getRecommendCounselorList();

	/**
	 * 更新会员信息
	 * @param member
	 * @return
	 */
	int updateInfo(Member member);

	List<Member> getOpendMemberPage(Member member);

    Member getMemberDetail(long memberId);

    Member getMemberById(Long memberId);
}

