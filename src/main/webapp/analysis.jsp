
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

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Story - Analysis</title>
         <%@include file="component/common_css_js.jsp" %>
         <script  src="js/script.js"></script>
        <style>
* {
  box-sizing: border-box;
}
.tablecontainer{
      width: 70%;
     margin-top: 10px;
      padding: 20px;
      margin-right:auto;
  margin-left: auto; 
  background-color: snow;
  
  height: 80%;

}
.starttable{
    width: 100%;
    
    
}

#myInput {
 
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 100%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
 
}

#myTable {
  border-collapse: collapse;
  width: 100%;
 
  border: 1px solid #ddd;
  font-size: 18px;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: #ff9800;
}
</style>
         
<style>
  .table-scroll{
  /*width:100%; */
  display: block;
  empty-cells: show;
  
  /* Decoration */
  border-spacing: 0;
  border: 2px solid;
}

.table-scroll thead{
  background-color: cornflowerblue;  
  position:relative;
  display: block;
 

}

.table-scroll tbody{
  /* Position */
  display: block; 
  
  width:100%;
  overflow-y:scroll;  /* Scroller y axis veritacally */  
  /* Decoration */
  border-top: 2px solid #f44336;
}

.table-scroll tr{
  display:flex;
   
}

.table-scroll td,.table-scroll th{
  flex-basis:100%;
  
}

.table-scroll tbody tr:nth-child(2n){
  background-color: #04AA6D;/* green color of alternatice rows*/
}

.body-half-screen{
  max-height: 50vh;
}



</style>  
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        <div class="tablecontainer">
        
             <div class="starttable"> 
             
             <%
                    HttpSession hs = request.getSession();
                    int userid=(int) hs.getAttribute("userid");
                    StoriesDao storydao= new StoriesDao(FactoryProvider.getFactory());
                    List<Story> list= storydao.getAllStories(userid);
                    %>
                    
             
                                    
                                             
 <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search Story names ..." title="Type in a name">

 <table id="myTable"class="table-scroll small-first-col">
     <thead>
  <tr >
   <th style="width:60%;">Story Name</th>
    <th style="width:40%;">Downloads</th>
     <th style="width:40%;">Views</th>
  </tr><thead>
  
  
                                    
                                    <tbody class="body-half-screen">
                                         <%
                                    for (Story story : list) {
                                    %>
         <tr>
      
    <td><h6>   <span id="spanid" class="label warning"><%= story.getStoryname() %></span></h6></td>
    <td><%= story.getDownload() %></td>
     <td><%= story.getViews() %></td>
  </tr>
  <%}%>
                                    </tbody>
</table>
             </div></div>
<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>                                  
                                    
</body>
</html>
