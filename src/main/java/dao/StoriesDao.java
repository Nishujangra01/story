/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import com.mycompany.entities.Liked;
import com.mycompany.entities.Story;
import com.mycompany.entities.User;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

/**
 *
 * @author a
 */
public class StoriesDao {
      private SessionFactory factory;
    
    public StoriesDao(SessionFactory factory) {
        this.factory= factory;
    }
    
    public  List<Story> getAllStories(int userid) {
        List<Story> storyList = new ArrayList<>();
      Session session=factory.openSession();
      String query = "from Story where userid =:u";
       Query qu =session.createQuery(query);
            qu.setParameter("u", userid);
          storyList=  qu.list();
        session.close();
        for (Story story : storyList) {
            System.out.println("Stories ID :- "+story.getStoryid());
        }
        return storyList;
    }
    
    public Story getStory(int storyid , int userid) {
        Story story=null;
        try {
            System.out.println(" In getStory() :- storyid : "+storyid+" userid : "+userid);
            Session session=factory.openSession();
         String query = "from Story where  storyid =:s and userid =:u";
          Query qu =session.createQuery(query);
            qu.setParameter("u", userid);
            qu.setParameter("s", storyid);
            story = (Story) qu.uniqueResult();
          
        } catch (Exception e) {
            e.printStackTrace();
        }
        // System.out.println("While reading story obj :- "+story.toString());
        
        return story;
    }
}
