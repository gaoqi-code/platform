package com.hiveview.entity;

import java.util.Date;


public class Member {

//	`sys_user_id` bigint(64) NOT NULL AUTO_INCREMENT,
    private Long id;
    
//	`user_name` varchar(45) DEFAULT NULL COMMENT '用户名',
    private String name;
    
//	`user_pwd` varchar(65) DEFAULT NULL COMMENT '密码',
    private String password;
    
//	`created_time` datetime DEFAULT NULL COMMENT '创建时间',
    private Date addTime;
    
//	`updated_time` datetime DEFAULT NULL COMMENT '更新时间',
    private Date updateTime;
    
	private String headPortrait;

	private String nation;//民族

	private String sex;

	private Integer level;

	private Date workTime;

	private String description;

	private String mobile;

	private String qq;

	private String email;

	private Integer checkStatus;

	private Integer status;

	private Integer realNameAuthentication;

	private Long companyId;

	private String companyName;

	private Integer type;

	private String personalProfile;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public String getHeadPortrait() {
		return headPortrait;
	}

	public void setHeadPortrait(String headPortrait) {
		this.headPortrait = headPortrait;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Date getWorkTime() {
		return workTime;
	}

	public void setWorkTime(Date workTime) {
		this.workTime = workTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public Integer getCheckStatus() {
		return checkStatus;
	}

	public void setCheckStatus(Integer checkStatus) {
		this.checkStatus = checkStatus;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getRealNameAuthentication() {
		return realNameAuthentication;
	}

	public void setRealNameAuthentication(Integer realNameAuthentication) {
		this.realNameAuthentication = realNameAuthentication;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getPersonalProfile() {
		return personalProfile;
	}

	public void setPersonalProfile(String personalProfile) {
		this.personalProfile = personalProfile;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
}
