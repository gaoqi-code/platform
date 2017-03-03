package com.hiveview.entity;

import java.io.Serializable;

public class UserDo implements Serializable,Cloneable {

    private int id ;
    private String username ;
    private String password ;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public Object clone() {
        UserDo stu = null;
        try{
            stu = (UserDo)super.clone();
        }catch(CloneNotSupportedException e) {
            e.printStackTrace();
        }
        return stu;
    }
}