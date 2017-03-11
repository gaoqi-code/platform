package com.hiveview.service;

import com.hiveview.entity.Member;

public interface IMemberService {

	/**
	 * 获得会员信息
	 * @param member
	 * @return
	 */
	public Member getMemberInfo(Member member);

	Integer updateMember(Member member);

	Integer saveMember(Member member);
}

