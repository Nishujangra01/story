
package dao;

import com.mycompany.entities.Liked;
import com.mycompany.story.FactoryProvider;
import org.hibernate.Session;
import org.hibernate.query.Query;

public class SetLikes {
    
     public void setLiked(Liked likedObj ,String likestoryid) {
       System.out.println(" SetLikes - setLiked() Java class :-  "+likedObj);
          int storyid = Integer.parseInt(likestoryid);
          try {
              Session hibSession= FactoryProvider.getFactory().openSession();
              hibSession.beginTransaction();
              System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++");
         String query = "UPDATE Liked SET likes =: l WHERE storyid =:s and user=:u";
         Query qu =hibSession.createQuery(query);
            qu.setParameter("u", likedObj.getUserid());
            qu.setParameter("l", likedObj.getLikes());
            qu.setParameter("s", storyid);
            int row=qu.executeUpdate();
   
              //System.out.println("story is downlaod null");
                 
               hibSession.getTransaction().commit();;
            hibSession.close();
          } catch (Exception e) {
              e.printStackTrace();
          }
          
    }
    
    
}
