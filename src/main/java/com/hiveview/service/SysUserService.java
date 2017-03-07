package com.hiveview.service;

import com.hiveview.dao.IMemberDao;
import com.hiveview.entity.AjaxPage;
import com.hiveview.entity.ScriptPage;
import com.hiveview.entity.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class SysUserService {
	@Autowired
	private IMemberDao sysUserDao;

	/**
	 * 获取用户信息
	 * @param userId
	 * @return
	 */
	public Member getSysUserById(int userId){
		return sysUserDao.getSysUserById(userId);
	}
	
	/**
	 * 登录
	 * @param member
	 * @return
	 */
	public Member getLoginInfo(Member member){
		try {
			member.setUserPwd(DigestUtils.md5DigestAsHex(member.getUserPwd().getBytes()));
			return sysUserDao.getLoginInfo(member);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * 获取所有系统用户
	 * @param isEffective
	 * @return
	 */
	public ScriptPage getSysUserByAll(AjaxPage ajaxPage){
		ScriptPage scriptPage = new ScriptPage();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageIndex", ajaxPage.getSkipNo());
		map.put("pageSize", ajaxPage.getPageSize());
		List<Member> rows = sysUserDao.getUserList(map);
		scriptPage.setRows(rows);
		Member member = new Member();
		int total = sysUserDao.getCount(member);
		scriptPage.setTotal(total);
		return scriptPage;
	}
	
	/**
	 * 修改用户
	 * @param user
	 * @return
	 */
	public int updateSysUser(Member user){
		if(null!=user.getUserPwd())
			user.setUserPwd(DigestUtils.md5DigestAsHex(user.getUserPwd().getBytes()));
		Member u = new Member();
		if(user.getUserMail()==null){
			return sysUserDao.updateSysUser(user);
		}else{
			u.setUserMail(user.getUserMail());
			if(sysUserDao.getCount(u)==0){
				user.setUpdatedTime(new Date());
				return sysUserDao.updateSysUser(user);
			}else{
				return -1;
			}
		}
	}
	/**
	 * 修改用户
	 * @param user
	 * @return
	 */
	public int updateSysUserPwd(String pwd,Member user){
		//判断输入的旧密码是否正确
		Member memberOld =new Member();
		memberOld.setUserMail(user.getUserMail());
		memberOld.setUserPwd(DigestUtils.md5DigestAsHex(pwd.getBytes()));
		memberOld =sysUserDao.getLoginInfo(memberOld);
		if(null== memberOld)
			return -100;
		if(null!=user.getUserPwd())
			user.setUserPwd(DigestUtils.md5DigestAsHex(user.getUserPwd().getBytes()));
		else
			return -1;
		return sysUserDao.updateSysUser(user);
	}
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	public int addSysUser(Member user){
		Member u = new Member();
		u.setUserMail(user.getUserMail());
		if(sysUserDao.getCount(u)==0){
			user.setCreatedTime(new Date());
			user.setUpdatedTime(new Date());
			user.setUserPwd(DigestUtils.md5DigestAsHex(user.getUserPwd().getBytes()));
			return sysUserDao.addSysUser(user);
		}else{
			return -1;
		}
	}
	
	public Integer deleteSysUser(Integer sysUserId){
		try {
			return sysUserDao.deleteSysUserById(sysUserId);
		} catch (Exception e) {
			e.printStackTrace();
			return -1000;
		}
	}
	
	public int getCount(Member user){
		return sysUserDao.getCount(user);
	}
}

