<%-- 
    Document   : loading
    Created on : May 25, 2023, 10:57:57 AM
    Author     : 84338
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/loading.css"/>
    </head>
    <body>
        <div id="preloader"></div>
        
        <script>
            var loader = document.getElementById("preloader");
            window.addEventListener("load", function(){
                loader.style.display = "none";
            });
        </script>
    </body>
</html>
