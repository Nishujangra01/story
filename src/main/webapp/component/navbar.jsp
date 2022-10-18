<%@page import="com.mycompany.entities.User"%>
<% 
User user1=(User)session.getAttribute("current-user");

%>
 
<nav class="navbar navbar-expand-lg sticky-top navbar-dark bg-primary">
    <style>
        .container a{
             color: black;
             overflow: hidden;
        } 
        .container a:hover {
  background-color: black;
  color: black;
}
        
    </style>
    <div class="container">
              
          <% 
if (user1==null) {
        %>
        
         <a class="navbar-brand " href="index.jsp"><h5>Stories</h5></a>
         <%
              }
          
          %>   
         
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>


  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
  </ul>
     
          
         <% 
if (user1==null) {
        %>
        
          <ul class="navbar-nav ml-auto">
         <li class="nav-item active">
        <a class="nav-link" href="login.jsp"><h5>Login</h5> </a>
      </li>
       <li class="nav-item active">
        <a class="nav-link" href="register.jsp"><h5>Register</h5> </a>
      </li>
     
       </ul>
      <%
    }else{
             %>
               <ul class="navbar-nav mr-auto">
           <li class="nav-item active">
               <a class="nav-link" href="home.jsp"> <h5>Welcome <%= user1.getUsername() %> </h5></a>
      </li>
       </ul>
        <ul class="navbar-nav ml-auto">
         <li class="nav-item active">
        <a class="nav-link" href="home.jsp"><h5>My Stories</h5></a>
      </li>
       <li class="nav-item active">
        <a class="nav-link" href="write.jsp"><h5>Write</h5></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="analysis.jsp"><h5>Analysis</h5></a>
      </li>
         
          <li class="nav-item active">
        <a class="nav-link" href="LogoutServlet"><h5>Logout </h5> </a>
      </li>
       </ul>
          <%
              }
          
          %>   
     
  </div> 
    </div>
</nav>