/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;


import com.mycompany.entities.Liked;
import com.mycompany.entities.Story;
import com.mycompany.entities.User;
import com.mycompany.story.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author a
 */
public class WriteServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
             String storyname= request.getParameter("storyname");
             System.out.println("Storyname :- "+ storyname);
              String text= request.getParameter("description");
            System.out.println("*************************************");
            System.out.println(text);
           
               HttpSession hs = request.getSession();
             if (storyname.isEmpty() || text.isEmpty()) {
                 if (storyname.isEmpty()) {
                      out.println(" Story Name is blank!!!!!!");
                hs.setAttribute("message", "Story Name is empty. Please create a name !!!");
                 }
                 else{
                      out.println("Text Story is blank!!!!!!");
                hs.setAttribute("message", "Story is empty. Please create a new !!!");
                 }  
                 //System.out.println("-----------"+hs.getAttribute("userid"));
                 response.sendRedirect("write.jsp");
                return;
            }
             else{
                 // text=text.replaceAll("</p>", "");
                   //text=text.replaceAll("<p>", "");
                 int userid=(int) hs.getAttribute("userid");
                 Story story=  new Story(userid, 0, storyname, text, 0);
               
                 System.out.println(story);
            Session hibSession= FactoryProvider.getFactory().openSession();
            Transaction transaction = hibSession.beginTransaction();
            int storyid = (int) hibSession.save(story);
             System.out.println(" WriteServlet :- story table :- story id ========== " + storyid);
                 Liked likedObj  = new Liked(storyid, userid, "Like");
                 int likeid = (int) hibSession.save(likedObj);
            //insert likes column like table 
            
      System.out.println(" WriteServlet :- like table :- story id ========== " + likeid);
            transaction.commit();
            hibSession.close();
            
            out.println("Successfully Saved !!!!!!!!!");
            out.println("<br> User id is "+userid);
         
            hs.setAttribute("message", "Story Saved Successfully... ");
            response.sendRedirect("write.jsp");
            return;
            
             }
           
            
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
