/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import com.mycompany.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class UserDao {
    private SessionFactory factory;
    
    public UserDao(SessionFactory factory) {
        this.factory= factory;
    }
    public  User getUserAndPassword(String userna , String pass) {
        User user = null;
        try {
            String query ="from User where username =: e and password =: p";
            Session session= this.factory.openSession();
            Query qu =session.createQuery(query);
            qu.setParameter("e", userna);
            qu.setParameter("p", pass);
            user = (User) qu.uniqueResult();
            //System.out.println("********************" + user.toString());
            
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return user;
    }
}
