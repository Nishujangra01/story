/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

import com.mycompany.entities.Story;
import com.mycompany.story.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author a
 */
public class Delete extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
           // System.out.println("Delete Servlet *****************************");
             HttpSession hs = request.getSession();
             Session hibSession= FactoryProvider.getFactory().openSession();
              Transaction transaction = hibSession.beginTransaction();
               int strid  = Integer.parseInt(request.getParameter("hidid"));
             System.out.println("Delete Story :- "+strid);
             String strquery ="delete from Story where  storyid =:s";
             Query qu =hibSession.createQuery(strquery);
            qu.setParameter("s", strid);
            int row=qu.executeUpdate();
            if (row==0) {
                System.out.println("Doesnt deleted any story!!!!");
            }
            else{
                System.out.println("Deleted story successfully!!!");
            }
            
            hibSession.getTransaction().commit();;
            hibSession.close();
            
             hs.setAttribute("message", "Story deleted Successfully... ");
            response.sendRedirect("home.jsp");
            
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
