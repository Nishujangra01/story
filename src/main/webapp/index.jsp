


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stories-Home</title>
      
    <%@include file="component/common_css_js.jsp" %>
    <style>
        
        body {
  background: #4c268f;
  color: #99eeb4;
 
  text-align: center;

  justify-content: center;
  align-items: center;
}

/* We set the position to relative so that we can stack a blurred pseudo element on top of the original text */

span {
  position: relative;
  font-family: "Avenir Next", sans-serif;
  font-weight: 900;
  font-size: 64px;
  text-transform: uppercase;
  font-style: italic;
  letter-spacing: 0.05em;
  display: inline-block;
  padding: 100px;
}



    </style>
    </head>
    <body>
        

       <%@include file="component/navbar.jsp" %> 
       <div>
          <span filter-content="S">Stories - HUB</span>
   

</div>
        
    </body>
</html>
