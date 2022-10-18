/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.entities;

import javax.annotation.processing.Generated;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import org.hibernate.annotations.DynamicUpdate;

/**
 *
 * @author a
 */
@Entity
public class Story {
    
   
 
   private int userid;
   private int download;
    private String storyname;
   private String story;
   private int views;
   @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
   private int storyid;
  

    public Story() {
    }

    public Story(int userid, int download, String story, int views, int storyid) {
        this.userid = userid;
        this.download = download;
        this.story = story;
        this.views = views;
        this.storyid = storyid;
    }

    public Story(int userid, int download, String storyname, String story, int views) {
        this.userid = userid;
        this.download = download;
        this.storyname = storyname;
        this.story = story;
        this.views = views;
    }

    public String getStoryname() {
        return storyname;
    }

    public Story(int download, String storyname, String story, int views, int storyid) {
        this.download = download;
        this.storyname = storyname;
        this.story = story;
        this.views = views;
        this.storyid = storyid;
    }

    public void setStoryname(String storyname) {
        this.storyname = storyname;
    }

    public int getStoryid() {
        return storyid;
    }

    public void setStoryid(int storyid) {
        this.storyid = storyid;
    }

   

    public int getDownload() {
        return download;
    }

    public void setDownload(int download) {
        this.download = download;
    }

    public String getStory() {
        return story;
    }

    public void setStory(String story) {
        this.story = story;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

    public Story(int download, String story, int userid, int views) {
        this.download = download;
        this.story = story;
        this.userid = userid;
        this.views = views;
    }
  
   
   
   
   
   
    
   
}
