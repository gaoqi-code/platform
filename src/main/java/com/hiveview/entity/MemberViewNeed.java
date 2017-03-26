package com.hiveview.entity;

import java.util.Date;

public class MemberViewNeed {
    private Long id;

    private Long memberId;

    private Long needId;

    private Byte stauts;

    private Date addTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getMemberId() {
        return memberId;
    }

    public void setMemberId(Long memberId) {
        this.memberId = memberId;
    }

    public Long getNeedId() {
        return needId;
    }

    public void setNeedId(Long needId) {
        this.needId = needId;
    }

    public Byte getStauts() {
        return stauts;
    }

    public void setStauts(Byte stauts) {
        this.stauts = stauts;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }
}