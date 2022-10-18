
package dao;

import com.mycompany.entities.Liked;
import com.mycompany.entities.Story;
import com.mycompany.story.FactoryProvider;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class LikedDao {
    
      private SessionFactory factory;
    
    public LikedDao(SessionFactory factory) {
        this.factory= factory;
    }

   
    
      public  List<Liked> getAllLikes(int userid) {
        List<Liked> likedList = new ArrayList<>();
      Session session=factory.openSession();
      String query = "from Liked where userid =:u";
       Query qu =session.createQuery(query);
            qu.setParameter("u", userid);
          likedList=  qu.list();
        session.close();
          for (Liked liked : likedList) {
               System.out.println("Liked in LinkedDao :- "+liked.toString());
          }
           
        
        return likedList;
    }
    
   
  
}
