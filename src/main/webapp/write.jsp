<%@page import="com.mycompany.entities.User"%>
<%
   User user=(User) session.getAttribute("current-user");
   if (user==null) {
           session.setAttribute("message", "You are not logged in !! Login first.");
           response.sendRedirect("login.jsp");
       }
       else{
    
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editor</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" ></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

    
<%@include file="component/common_css_js.jsp" %>
<style>
   
    .section{
        padding: 30px;
  width: 80%; 
  height: 80%; 
  margin-right:auto;
  margin-left: auto; 
  }
  .row{
   position: absolute;  
 width: 80%; 
  }
    .col1{
       padding: 5px;
    background: pink; 
   height: auto;
     border:   2px solid black;
   }
   .storydiv{
       padding:   5px;
         background: greenyellow;
         
       width: auto;
  
   }
   .storyname{
    width: auto;
       height: auto;
   }
    .col2{
         background: pink; 
         
          border:   2px solid black;
           
    }
    .storytextdiv{
        padding: 10px;
        resize: vertical;
       
       
    }
 
</style>
<style>
    .button {
       
  background-color: blue;
  border: 2px solid black;

  padding: 16px ;
  text-align: center;
  text-decoration: aqua;
  display: inline-block;
  font-size: 25px;

  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
   width: 100%; 
  height: 60%; 
}
.button2:hover {
  background-color: #008CBA;
  color: white;
}

</style>
</head>
<body>
     <%@include file="component/navbar.jsp" %>
     
      <form action="WriteServlet" method="post" >
      <div class="section" > 
     
          
     <div class="row"> 
         <%@include file="component/message.jsp" %>
         <div class="col1" > 
            
             
           <div class="storydiv">
           
            <div class="storynamediv">
                <h5>Enter Story Name : <input name="storyname" style="width: auto ; height: auto" type="text"  id="storyname" placeholder=" story name"/> </h5>
            </div>
          </div>
             
             
            
            
         </div><br><br><br>
         <div class="col2">
             <div class="storytextdiv">
             <div class="story-text">
                 <textarea style="height: 310px ; width: 100%" name="description" id="description"  placeholder="Your Story here ...." ></textarea>
                
           </div>
            </div>
             
         </div><br><br><br>
          <div >
              <button type="submit" class="button button2">Save</button>
                       
         </div>
             </div>
          
       
        
     </div>
      </form>
   </div>   
   
</body>
</html>