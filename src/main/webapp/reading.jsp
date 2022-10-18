<%@page import="dao.NoOfDownlaods"%>
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
         
            String stroy=request.getParameter("story");
            int ssid = Integer.parseInt(stroy);
            //System.out.println("Story ID in reading.jsp page :- "+ssid);
            StoriesDao storiesDao = new StoriesDao(FactoryProvider.getFactory());
            
           Story storyObj= storiesDao.getStory(ssid, user.getUserid());
           String storyname= storyObj.getStoryname();
           String storycontent=storyObj.getStory();
              int storytestid=storyObj.getStoryid() ;
          // System.out.println("Storyr On Reading ......."+storycontent);
           session.setAttribute("myStory", storyObj);
        %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta charset="utf-8">
  <title>Reading...</title>
   <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
    </script>
    <script src = "https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js">
    </script>
            <%@include file="component/common_css_js.jsp" %>
              <script type="text/javascript">
                                            
                                            function myDownload(storytest,storyname) {
                                           // alert(storyname);
                                            var filename =storyname+".txt";
               
                                            var element = document.createElement('a');
                                            element.setAttribute('href' , 'data:text/plain;charset=utf-8,'+encodeURIComponent(storytest));
                                            element.setAttribute('download',filename);
                                            element.style.display="none";
                                            document.body.appendChild(element);
                                           
                                            element.click();
                                            document.body.removeChild(element);
                                             // Most important line to change the url and get paramter from url in java class
                                            //by request.getParameter............
                                            window.location.replace("home.jsp?std="+storyid);
                                            //code to update downlaoding in database ...
                                            <%
                                               
                                           String stdid=request.getParameter("std");
                                           System.out.println("Home page after clicking downlaod story id :- "+stdid);
                                           if(stdid !=null){
                                           NoOfDownlaods noOfDownlaods = new NoOfDownlaods();
                                           noOfDownlaods.increaseDownloads(stdid);
                                                }
                                            %>
                                            
                                     
                                           
                        }    </script>
                 <style>
                   body {

} 
               
.btn-group button {
  background-color: #04AA6D; /* Green background */
  border: 1px solid green; /* Green border */
  color: white; /* White text */
  padding: 10px ; /* Some padding */
  cursor: pointer; /* Pointer/hand icon */
  float: left; /* Float the buttons side by side */
 font-weight: bold;

 
}
.btn-group:after {
  content: "";
  clear: both;
  display: table;
  
  
   
}
.btn-group button:hover {
  background-color: #3e8e41;
}


.header {
  position: fixed;
   width: 80%;
 background-color: #f1f1f1;
  overflow: auto;

}

.header h2 {
  text-align: center;
  
   
}

.progress-container {
   
  width: 100%;
  height: 10px;
  background: #ccc;
  
}

.progress-bar {
   
  height: 8px;
  background: #04AA6D;
  width: 0%;

}
.content {
    
  padding: 100px 3;
  margin: 25px auto 0 auto;
 
   width: 85%;
  height: 350px;
}
.btn {
  background-color: DodgerBlue;
  border: none;
  color: white;
  padding: 12px 30px;
  cursor: pointer;
  font-size: 20px;
  position: fixed;
}

/* Darker background on mouse-over */
.btn:hover {
  background-color: RoyalBlue;
}
.mydiv {
  background-color: lightgrey;
  width: 500px;
  border: 15px solid green;
  padding: 50px;
  margin: 20px;
 
visibility: hidden;
  
}
    
</style> 

    </head>
    <body>
      <%@include file="component/navbar.jsp" %>
        
        <div class="container">
                  <div class="row mt-4">
                 <div class="header">
                     <div class="btn-group" style="width:100%">
                    <button style="width:50%">Story Name :- <%= storyname%></button>
                     <button style="width:50%">Created By :- <%= user.getUsername() %></button>
                   </div>
                        
                         <div class="progress-container">
                           <div class="progress-bar" id="myBar"></div>
                         </div> 
                   <div class="content" id="scontent">
                       <h4  id="storycont"> <%= storycontent %></h4>
                    
                    </div>
                     
                      
                      <div >
                           <%
                                           String storytest= storyname;
                                           String storytestname=storycontent ;
                                           
                                           storytestname=storytestname.replaceAll("'", "\\\\\'");
                                           System.out.println("Reading Story :- "+storytest);
                                          System.out.println("Reading Story name :- "+storytestname);
                                           %>
                          <button  onclick="myDownload('<%=storytestname%>','<%=storytest%>','<%=storytestid%>')" class="btn" style="width:80%"> Download</button>
                      </div>
                     </div>          
                      
                           
                         
                                            <script>
                    // When the user scrolls the page, execute myFunction 
                    window.onscroll = function() {myFunction()};

                    function myFunction() {
                      var winScroll = document.body.scrollTop || document.documentElement.scrollTop;
                      var height = document.documentElement.scrollHeight - document.documentElement.clientHeight;
                      var scrolled = (winScroll / height) * 100;
                      document.getElementById("myBar").style.width = scrolled + "%";
                    }
                    </script>
                     
                   
                  </div> </div>
    </body>
</html>
