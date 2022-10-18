/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.entities;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Liked {
    
    @Id
    private int storyid;
    private int userid;
    private String likes;

    public Liked(int userid, String likes) {
        this.userid = userid;
        this.likes = likes;
    }

    public int getStoryid() {
        return storyid;
    }

    public Liked(int storyid, int userid) {
        this.storyid = storyid;
        this.userid = userid;
    }

    public Liked() {
    }

    public Liked(int storyid, int userid, String likes) {
        this.storyid = storyid;
        this.userid = userid;
        this.likes = likes;
    }

    public void setStoryid(int storyid) {
        this.storyid = storyid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getLikes() {
        return likes;
    }

    public void setLikes(String likes) {
        this.likes = likes;
    }

    @Override
    public String toString() {
        return "Liked{" + "storyid=" + storyid + ", userid=" + userid + ", likes=" + likes + '}';
    }
    
    
    
    
    
}
