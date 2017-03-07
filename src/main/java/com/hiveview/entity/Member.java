package com.hiveview.entity;

import java.util.Date;


public class Member {

//	`sys_user_id` bigint(64) NOT NULL AUTO_INCREMENT,
    private Long userId;
    
//	`user_name` varchar(45) DEFAULT NULL COMMENT '用户名',
    private String userName;
    
//	`user_pwd` varchar(65) DEFAULT NULL COMMENT '密码',
    private String userPwd;
    
//	`user_mail` varchar(45) DEFAULT NULL COMMENT '账号（邮箱）',
    private String userMail;
    
//	`role_id` bigint(64) DEFAULT NULL COMMENT '角色id',
    private Integer roleId;
    
//	`created_time` datetime DEFAULT NULL COMMENT '创建时间',
    private Date createdTime;
    
//	`created_by` bigint(64) DEFAULT '0' COMMENT '创建人id',
    private Integer createdBy;
    
//	`updated_time` datetime DEFAULT NULL COMMENT '更新时间',
    private Date updatedTime;
    
//	`updated_by` bigint(64) DEFAULT '0' COMMENT '更新人id',
    private Integer updatedBy;
    
//	`is_effective` bigint(1) DEFAULT '1' COMMENT '0:无效    1：有效',
    private Integer isEffective;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public Integer getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Integer createdBy) {
		this.createdBy = createdBy;
	}

	public Date getUpdatedTime() {
		return updatedTime;
	}

	public void setUpdatedTime(Date updatedTime) {
		this.updatedTime = updatedTime;
	}

	public Integer getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(Integer updatedBy) {
		this.updatedBy = updatedBy;
	}

	public Integer getIsEffective() {
		return isEffective;
	}

	public void setIsEffective(Integer isEffective) {
		this.isEffective = isEffective;
	}
    
}
