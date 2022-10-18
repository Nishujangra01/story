/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlets;

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
import org.graalvm.compiler.core.common.alloc.Trace;
import org.hibernate.Session;
import org.hibernate.Transaction;
import sun.nio.cs.HKSCSMapping;

/**
 *
 * @author a
 */
public class RegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        try {
           String username= request.getParameter("username");
            String password= request.getParameter("password");
           String emailid= request.getParameter("emailid");
          
        if (username.isEmpty()) {
                out.println("Name is blank!!!!!!");
                return;
            }
            
           User user= new User(username, password, emailid);
            Session hibSession= FactoryProvider.getFactory().openSession();
            Transaction transaction = hibSession.beginTransaction();
            int userid = (int) hibSession.save(user);
            
            transaction.commit();
            hibSession.close();
            
            out.println("Successfully Saved !!!!!!!!!");
            out.println("<br> User id is "+userid);
            HttpSession hs = request.getSession();
            hs.setAttribute("message", "Registration Successfully "+username+" ...");
            response.sendRedirect("register.jsp");
            return;
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
