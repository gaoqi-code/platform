package com.hiveview.dao;

import com.hiveview.entity.Member;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface IMemberDao extends IBaseDao<Member> {


	/**
	 * 登录
	 * @param member
	 * @return
	 */
	public Member getLoginInfo(Member member);
	
	/**
	 * 验证手机号是否存在
	 * @param phone
	 * @return
	 */
	public int verifyPhoneRegister(String phone);


	int deleteByPrimaryKey(Long id);

	int insert(Member record);

	int insertSelective(Member record);

	Member selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(Member record);

	int updateByPrimaryKeyWithBLOBs(Member record);

	int updateByPrimaryKey(Member record);

    List<Member> getOpendMember(Member member);

    Map<String,Object> getViewNeedCount(@Param("memberId") Long memberId, @Param("needId") long needId);
}
