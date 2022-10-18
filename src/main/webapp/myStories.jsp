<%@page import="com.mycompany.story.Helper"%>
<%@page import="com.mycompany.entities.Story"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.story.FactoryProvider"%>
<%@page import="dao.StoriesDao"%>
<%@page import="com.mycompany.entities.User"%>
<%
   User user=(User) session.getAttribute("current-user");
   if (user==null) {
           session.setAttribute("message", "You are not logged in !! Login first.");
           response.sendRedirect("login.jsp");
       }
       
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Stories</title>
        <%@include file="component/common_css_js.jsp" %>
        <style> 

</style>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        
        <div class="row mt-3">
             <%
                     HttpSession hs = request.getSession();
                     int userid=(int) hs.getAttribute("userid");
                    StoriesDao storydao= new StoriesDao(FactoryProvider.getFactory());
                    List<Story> list= storydao.getAllStories(userid);
                    %>
            <div class="col-md-1">
                
            </div>
             <div class="col-md-10">
                 <div class="row mt-4">
                     <div class="col-md-12">
                         <div class="card-columns">
                             <%-- <h1> Number of Stories is <%= list.size()%> </h1> --%>
                                <%
                                    for (Story story : list) {
                                    %>
                                    
                                    <div class="card" >
                                        <%-- <img class="card-img-top" src="..." alt="Card image cap"> --%>
                                    <div class="card-body">
                                      <h5 class="card-title"><%= story.getStoryname() %></h5>
                                      <div class="card-text"><%= Helper.getLimitedChar(story.getStory()) %>
                                          <%--   <a href="register.jsp"> Read More ...</a> --%>
                                      </div>
                                     
                                    </div>
                                      <div class="card-footer">
                                          
                                       
                                          <a href="reading.jsp?story=<%= story.getStoryid()%>"> 
                                             
                                           <button class="btn custom-bg text-purple btn-outline-success"> Read</button>
                                             
                                          </a>
                                           <a href="reading.jsp">  
                                           <button class="btn custom-bg text-purple btn-outline-success"> Download</button>
                                           </a>
                                        
                                      </div>
                                  </div>

                                      <%  }
                                    %>
                         </div>
                     </div>
                 </div>
             
              
            </div>
        </div>
        
        
    </body>
</html>
