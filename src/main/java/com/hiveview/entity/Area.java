package com.hiveview.entity;

import java.util.Date;

public class Area {
    private Long id;

    private String name;

    private String fullName;

    private Integer status;

    private Integer level;

    private Date addTime;

    private String code;

    private Date updateTime;

    private Long parentId;

    private Long oneLevel;

    private Long twoLevel;

    private Long threeLevel;

    public Long getOneLevel() {
        return oneLevel;
    }

    public void setOneLevel(Long oneLevel) {
        this.oneLevel = oneLevel;
    }

    public Long getTwoLevel() {
        return twoLevel;
    }

    public void setTwoLevel(Long twoLevel) {
        this.twoLevel = twoLevel;
    }

    public Long getThreeLevel() {
        return threeLevel;
    }

    public void setThreeLevel(Long threeLevel) {
        this.threeLevel = threeLevel;
    }

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

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }
}