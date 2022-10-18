]

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Test</title>
         <script src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
    </script>
    <script src = "https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js">
    </script>
          <script type="text/javascript">
       $(document).ready(function () {
           
             var divele= document.createElement('div');
        divele.setAttribute('class' ,'divimage');
         divele.setAttribute('id' ,'divimageid');
         divele.setAttribute('style' ,'word-wrap: break-word ;background-color: lightgrey; width: 500px; border: 15px solid green;padding: 50px;margin: 20px;');
        var innerdivh3= document.createElement('h3');
              innerdivh3.setAttribute('class' ,'h3image');
               innerdivh3.setAttribute('style' ,'width: 470px; padding: 3px;margin: 20px;');
               innerdivh3.innerHTML="sadvadsvfadvfda";
              divele.appendChild(innerdivh3);
              document.body.appendChild(divele);
          
            var element = $("#div"); // global variable
            var getCanvas; //global variable
             // element.style.display="show";
            html2canvas(element, {
                onrendered: function (canvas) {
                    getCanvas = canvas;
                }
            });
 
            $("#btn-Convert-Html2Image").on('click', function () {
           
                var imgageData = getCanvas.toDataURL("image/png");
                 //Now browser starts downloading it instead of just showing it
                var newData = imgageData.replace(/^data:image\/png/, "data:application/octet-stream");
               
                $("#btn-Convert-Html2Image").attr("download", "your_image.png").attr("href", newData);
            });
        });                 
                           </script>
    </head>
    <body>
        <h1>Test.........................</h1>
        <%String te="asdvsssssssvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv";%>
        
        <%--   <div class="testdiv" id="divtest" style=" display:none ; word-wrap: break-word  ;background-color: lightgrey; width: 500px; border: 15px solid green;padding: 50px;margin: 20px;">
            <h3 style=" width: 470px; padding: 3px;margin: 20px;"><%=te%></h3>
           
        </div>
     
<a id="btn-Convert-Html2Image" href="#">convertto image</a>--%>
      
    </body>
</html>
