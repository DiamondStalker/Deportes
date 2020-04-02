<%-- 
    Document   : inicioadministrador
    Created on : 25-mar-2020, 18:25:02
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador</title>
        <link rel="icon"    href="imagenes/escudo.jpg">
        <link rel="stylesheet" type="text/css" media="screen" href="css/styleadmin.css">
        <script src="js/jquery.easing.1.3.js"></script>
        <script  src = "http://code.jquery.com/jquery-1.11.0.min.js"></script> 
        <script>
            $(function () {
                $('#ingresare').click(function () {
                    $(this).next('#estudiante-content').slideToggle();
                    $(this).toggleClass('active');
                });
            });
            $(function () {
                $('#ingresare').click(function () {
                    $(this).next('#estudianteexcell-content').slideToggle();
                    $(this).toggleClass('active');
                });
            });
        </script>
    </head>
    <body>

    <center>
        <img src="imagenes/refresh.JPG" alt="">
    </center> 

    <br>
    <br>

    <nav class="acceder">
        <ul>

            <li>
                <a id="ingresare" href="#">Ingresar Estudiante</a>
                <div id="estudiante-content"><%-- Ingresar Usuario Con Archivo--%>
                    <form id="estudiante" action="SubirArchivo" method="post" enctype="multipart/form-data" target="_blank">
                        <input type="file" name="imagensubida" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, .xlsx, .xlsm, .xls">
                        <input type="submit" value="Enviar datos">
                    </form>
                    <%-- Ingresar Usuario Manualmente--%>
                    <form id="estudiante">
                        <label>Nombre del estudiante: </label><input id="NEstudiante" type="text" name="NombreEstudiante" onclick="valueOf('')" required="">   
                        <br>
                        <br>
                        <label>Nombre del padre: </label><input id="NMadre" type="text" name="NombreMadre" onclick="valueOf('')" required>   
                        <br>
                        <br>
                        <label>Nombre de la madre: </label><input id="NPadre" type="text" name="NombrePadre"onclick="valueOf('')" required>   
                        <br>
                        <br>
                        <label>Edad del estudiante: </label> <input id="EdadEs" type="number" name="Edad" onclick="valueOf('')" required>   
                        <br>
                        <br>
                        <input type="submit" id="submit" value="Login">
                    </form>

                </div>                     
            </li>
        </ul>
    </nav>

    <h1>Hello World!</h1>
</body>
</html>
