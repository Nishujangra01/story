/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author a
 */
@Entity
public class User {
    
     @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int userid;
    @Column(length = 100, name="username")
    private String username;
     @Column(length = 100, name="password")
    private String password;
      @Column(length = 100, name="emailid")
     private String emailid;
    @OneToMany 
    private List<Story> stories = new ArrayList<>();
   
    public User() {
    }

    public String getEmailid() {
        return emailid;
    }

    public User(String username, String password, String emailid) {
        this.username = username;
        this.password = password;
        this.emailid = emailid;
    }


    public User(int userid, String username, String password, String emailid) {
        this.userid = userid;
        this.username = username;
        this.password = password;
        this.emailid = emailid;
    }

    public void setEmailid(String emailid) {
        this.emailid = emailid;
    }

    public List<Story> getStories() {
        return stories;
    }

    public void setStories(List<Story> stories) {
        this.stories = stories;
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(int userid, String username, String password) {
        this.userid = userid;
        this.username = username;
        this.password = password;
    }

     public User(int userid, String username, String password , List<Story>stories) {
        this.userid = userid;
        this.username = username;
        this.password = password;
        this.stories=stories;
    }
    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
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

    
}
