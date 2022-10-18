
<%@page import="dao.NoOfDownlaods"%>
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
       session.setAttribute("userid", user.getUserid());
      
    }
%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
         <%@include file="component/common_css_js.jsp" %>
         <script  src="js/script.js"></script>
         
         
         <link rel="stylesheet" href="js/delete.js">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
         
          <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
    </script>
    <script src = "https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js">
    </script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
                                          <script type="text/javascript">   
                                            function myFunction(storytest,storyname,storyid) {
                                            //alert(storyname);
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
                                            
                                           
                        }   
                                            function delFunction(storynamedel ,storyiddel ){
                                              
                                              document.getElementById('id01').style.display='block';
                                              $("#modal_body").html("Delete Story-"+storynamedel);
                                              
                                              var  ele =document.getElementById("hidid");
                                               ele.setAttribute('value',storyiddel);
                                             
                                              //console.log(storyiddel);
                                               //console.log(storynamedel);
                                          }   
                                          
                                          </script>
                                          
                   
    
    <style>
        .label {
  color: white;
  
  font-family: Arial;
  padding: 10px;
  border: 1px solid gray;
  background-color:#B4886B;
  border-radius: 5px;
  font: inherit;
  width: 30%;
   display:inline-block
}

.warning {background-color: #ff9800;} /* Orange */

.btn {
  background-color: DodgerBlue;
  border: none;
  color: white;
  padding: 8px 30px;
  cursor: pointer;
  font-size: 13px;
}

/* Darker background on mouse-over */
.btn:hover {
  background-color: orange;
  color: black;
}
    </style>
    <style>
       
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

button:hover {
  opacity:1;
}

/* Float cancel and delete buttons and add an equal width */
.cancelbtn, .deletebtn {
  float: left;
  width: 50%;
   background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

/* Add a color to the cancel button */
.cancelbtn {
  background-color: #ccc;
  color: black;
}

/* Add a color to the delete button */
.deletebtn {
  background-color: #f44336;
}

/* Add padding and center-align text to the container */
.containermdal {
  padding: 16px;
  text-align: center;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
    position: fixed;/* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0%;
  
  top: 10%;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: #474e5d;
  padding-top: 50px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 50%; /* Could be more or less, depending on screen size */
}

/* Style the horizontal ruler */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
 
/* The Modal Close Button (x) */
.close {
  position: absolute;
  right: 35px;
  top: 15px;
  font-size: 40px;
  font-weight: bold;
  color: #f1f1f1;
}

.close:hover,
.close:focus {
  color: #f44336;
  cursor: pointer;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and delete button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .deletebtn {
     width: 100%;
  }
}
</style>
<style>
    .cardheadertop{
  
        overflow: hidden;
          display: flex;
        justify-content: space-between;
   
    }
     .like-content {
      
    font-size: 15px;
    text-align: center;
}
.like-content span {
	color: #04AA6D;
	font-family: monospace;
}
.like-content .btn-secondary {
	  display: block;
    text-align: center;
    background: #ed2553;
    border-radius: 3px;
    box-shadow: 0 10px 20px -8px rgb(240, 75, 113);
    padding: 10px 17px;
    font-size: 18px;
    cursor: pointer;
    border: none;
    outline: none;
    color: #ffffff;
    text-decoration: none;
    -webkit-transition: 0.3s ease;
    transition: 0.3s ease;
}
.like-content .btn-secondary:hover {
	  transform: translateY(-3px);
}
.like-content .btn-secondary .fa {
	  margin-right: 5px;
}
.animate-like {
	animation-name: likeAnimation;
	animation-iteration-count: 1;
	animation-fill-mode: forwards;
	animation-duration: 0.65s;
}
@keyframes likeAnimation {
  0%   { transform: scale(30); }
  100% { transform: scale(1); }
}
   
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
                 <div> <%@include file="component/message.jsp" %></div>
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
                                        
                                        <div class="cardheadertop ">
                                           <span id="spanid" class="label warning "><%= story.getStoryname() %></span>
                                             <div class="like-content">
                                            <button class="btn-secondary like-review">
                                            <i class="fa fa-heart" aria-hidden="true"></i> Like
                                          </button></div>
                                       </div>
                                        <script>
                                             $(function(){
	$(document).one('click', '.like-review', function(e) {
		$(this).html('<i class="fa fa-heart" aria-hidden="true"></i> You liked this');
		$(this).children('.fa-heart').addClass('animate-like');
	});
});
                                        </script>
                                         
                                      <h5 class="card-title"></h5>
                                      <div class="card-text" id="textarea">
                                          <text>
                                          <%= Helper.getLimitedChar(story.getStory()) %></text>
                                          <%--   <a href="register.jsp"> Read More ...</a> --%>
                                      </div>
                                      
                                    </div>
                                      <div class="card-footer btn-group">
                                          <div >
                                         
                                          <a href="reading.jsp?story=<%= story.getStoryid()%>"> 
                                             
                                              <button class="btn btn-primary" style="width: auto">Read</button>
                                             
                                          </a>
                                       <%
                                           String storytest= story.getStory()	;
                                           String storytestname=story.getStoryname() ;
                                            int storytestid=story.getStoryid() ;
                                           storytest=storytest.replaceAll("'", "\\\\\'");
                                         //  System.out.println("Home Story :- "+storytest);
                                          //System.out.println("Home Story name :- "+storytestname);
                                            session.setAttribute("currentStoryHome", story); 
                                           %>
                                           
                                          <button class="btn btn-primary" download="image.png" onclick="myFunction('<%=storytest%>','<%=storytestname%>','<%=storytestid%>')"  >Download</button>
                                            
                                                  <button data-toggle="modal" data-target="id01" onclick="delFunction('<%=storytestname%>','<%=story.getStoryid()%>')"  name="delbutton" type="button"  class="btn btn-primary" style="width: auto"> Delete</button>
                                        
                                      </div></div>
                                          <div id="id01" class="modal" >
                                  
                                    
                                                         
                                          
                                    
  <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal"></span>
  <div id="delform" class="modal-content" >
      <form class="containermdal" action="Delete" method="post">
        <h1 id="modal_body"></h1>
        <noscript id="storyid"  name="storyid"></noscript>
        <input id="hidid" name="hidid" type="hidden" value=""></input>
      
      <p>Are you sure you want to delete your story?</p>
     
      <div class="clearfix">
         
        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>   
        <button type="submit"  class="deletebtn">Delete</button>
        
      
      </div>
    </form>
  </div>
</div>   
                                           
                                  </div>
                                      
                                          
                                          
                                      <%  }
                                    %>
                         </div>
                     </div>
                 </div>
             
              
            </div>
        </div>
                                    
 <script>
// Get the modal

var modal = document.getElementById('id01');
   
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
        
    </body>
</html>
