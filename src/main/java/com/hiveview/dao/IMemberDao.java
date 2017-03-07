package com.hiveview.dao;

import com.hiveview.entity.Member;

import java.util.List;
import java.util.Map;

public interface IMemberDao extends BaseDao<Member> {

	/**
	 * 通过Id获取系统用户信息
	 * @param sysUser
	 * @return
	 */
	public Member getSysUserById(int userId);

	/**
	 * 获取所有系统用户信息
	 * @param sysUser
	 * @return
	 */
	public List<Member> getSysUserByAll(Map<String, Object> map);

	/**
	 * 登录
	 * @param member
	 * @return
	 */
	public Member getLoginInfo(Member member);
	
	/**
	 * 保存系统用户信息
	 * @param member
	 * @return
	 */
	public int addSysUser(Member member);
	
	
	/**
	 * 更新系统用户信息
	 * @param member
	 * @return
	 */
	public int updateSysUser(Member member);
	
	/**
	 * 分页查询用户信息
	 * @param map
	 * @return
	 */
	public List<Member> getUserList(Map<String, Object> map);
	
	public Integer deleteSysUserById(Integer sysUserById);

	/**
	 * 验证手机号是否存在
	 * @param phone
	 * @return
	 */
	public int verifyPhoneRegister(String phone);
	
}
