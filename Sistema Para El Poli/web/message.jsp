<%-- 
    Document   : message
    Created on : 08-abr-2020, 19:01:59
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Upload</title>
    </head>
    <body onload="myFunction()">
    </body>
     <script>
            function myFunction() {
                alert("${requestScope.message});
                window.close();
            }
        </script>
</html>
