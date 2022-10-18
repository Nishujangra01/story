<%-- 
    Document   : register
    Created on : Oct 12, 2022, 2:18:14 PM
    Author     : a
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
         <%@include file="component/common_css_js.jsp" %>
    </head>
    <body>
       <%@include file="component/navbar.jsp" %>
       
       <div class="container-fluid">
            <div class="row mt-5">
           <div class="col-md-4 offset-md-4">
               <div class="card">
                     <%@include file="component/message.jsp" %>
                   <div class="card-body">
                        <h1 class="text-center my-3"> Sign up Here !!!</h1>
                        <form action="RegisterServlet" method="post">
                   
                   <div class="form-group">
                         <label for="username">User Name</label>
                         <input name="username" type="text" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Enter user name">
                    </div>
                   <div class="form-group">
                         <label for="emailid">User Email</label>
                         <input name="emailid" type="email" class="form-control" id="emailid" aria-describedby="emailHelp" placeholder="Enter email">
                    </div>
                    <div class="form-group">
                         <label for="password">Password</label>
                         <input name="password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter password">
                    </div>
                   <div class="container text-center">
                       <button type="submit" class="btn btn-outline-success"> Register</button>
                       <button type="reset" class="btn btn-outline-warning"> Reset</button>
                   </div>
               </form>
               
                       
                   </div>
               </div>
           </div>
           
       </div>
           
       </div>
       
    </body>
</html>
