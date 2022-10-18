<%-- 
    Document   : login
    Created on : Oct 12, 2022, 4:45:30 PM
    Author     : a
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
         <%@include file="component/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        
        <div class="containerr">
             <div class="row mt-5">
                  <div class="col-md-6 offset-md-3">
                       <div class="card">
                           
                            <div class="card-header custom-bg text-white bg-primary">
                                <h3>Login here - </h3>
                            </div>
                            <div class="card-body">
                                  <%@include file="component/message.jsp" %>
                                <form action="LoginServlet" method="post">
                                <div class="form-group">
                                  <label for="username">User Name</label>
                                  <input  name="username" type="username" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Enter username">
                                 
                                </div>
                                <div class="form-group">
                                  <label for="password">Password</label>
                                  <input  name="password" type="password" class="form-control" id="password" placeholder="Password">
                                </div>
                                    <a href="register.jsp"> If not register click here!</a>
                                    <div class="container text-center">
                                         <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                               
                              </form>
                            </div>
                          
        </div>
        </div>
        </div>
        </div>
         
    </body>
</html>
