<%@page contentType="text/html;charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="com.mycompany.story.Helper"%>
<%@page import="java.util.List"%>

<%@page import="com.mycompany.story.FactoryProvider"%>
<%@page import="dao.StoriesDao"%>
<%@page import="com.mycompany.entities.Story"%>
<%@page import="com.mycompany.entities.User"%>

<%
   User user=(User) session.getAttribute("current-user");
   if (user==null) {
           session.setAttribute("message", "You are not logged in !! Login first.");
           response.sendRedirect("login.jsp");
       }
       else{
        String str= request.getParameter("hidid");
        System.out.println("Delete stroy :-"+str);
           
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>delete</title>
        
         <%@include file="component/common_css_js.jsp" %>
         <script  src="js/script.js"></script>
    </head>

  
    <body>
         <%@include file="component/navbar.jsp" %>
         
         
    </body>
</html>
