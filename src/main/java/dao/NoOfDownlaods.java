
package dao;

import com.mycompany.entities.Story;
import com.mycompany.story.FactoryProvider;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class NoOfDownlaods {
    

      public  void increaseDownloads (String stdid) {
           System.out.println(" NoOfDownlaods Java class :- storyid : "+stdid);
           int storyid = Integer.parseInt(stdid);
          try {
             
              Session hibSession= FactoryProvider.getFactory().openSession();
              hibSession.beginTransaction();
              System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++");
         String query = "UPDATE Story SET download =download+1 WHERE storyid =:s";
       Query qu =hibSession.createQuery(query);
            qu.setParameter("s", storyid);
            int row=qu.executeUpdate();
    /*    Story stroyObj = hibSession.load(Story.class, storyid);
        stroyObj.setDownload(10);
        Transaction transaction = hibSession.beginTransaction();
       hibSession.saveOrUpdate(stroyObj);*/
         
    
             /* EntityManager em = Persistence.createEntityManagerFactory("mypersistence").createEntityManager();
              em.getTransaction().begin();
              Story sto= em.find(Story.class, storyid);
              sto.setDownload(10);
              em.getTransaction().commit();
              em.close();*/
             
              System.out.println("story is downlaod null");
                 
               hibSession.getTransaction().commit();;
            hibSession.close();
          } catch (Exception e) {
              e.printStackTrace();
          }
           
      
    }
      public  void increaseViews (int stdid) {
           System.out.println(" NoOfDownlaods - increaseViews() Java class :- storyid : "+stdid);
         
          try {
              Session hibSession= FactoryProvider.getFactory().openSession();
              hibSession.beginTransaction();
              System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++");
         String query = "UPDATE Story SET views =views +1 WHERE storyid =:s";
         Query qu =hibSession.createQuery(query);
            qu.setParameter("s", stdid);
            int row=qu.executeUpdate();
   
              //System.out.println("story is downlaod null");
                 
               hibSession.getTransaction().commit();;
            hibSession.close();
          } catch (Exception e) {
              e.printStackTrace();
          }
           
      
    }
    
    
}
