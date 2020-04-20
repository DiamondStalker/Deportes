<%@page import="conexion.Conectar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon"    href="imagenes/escudo.jpg">
        <% String Identificaion = request.getParameter("id");
            Conectar Con = new Conectar();
            String Nombre_estudiante = Con.Nombre_estudiante(Identificaion);
            String Datos_estudiante[][] = Con.Datos_estudiante(Identificaion);
        %>
        <title> <%= Nombre_estudiante%></title>
        <link rel="stylesheet" type="text/css" media="screen" href="css/verestudiantes.css">
    </head>
    <body>
    <center>
        <a onclick="javascript:window.location.reload();"> <img src="imagenes/refresh.gif" alt="">
            <div> </div>
        </a>
    </center>
    
    <div>
        <center>
            <a href="javascript:history.back()"><img src="imagenes/regreso.png" alt="Atras"></a>
        </center>
    </div>

    <center>

        <section id="sectio-student"> 
            <center>
                <img src="imagenes/usuario.png">
                <br>
                <h1> Identificacion:</h1>
                <h2> <%= Datos_estudiante[0][0]%></h2>
                <br>
                <h1>  Nombre: </h1>
                <h2><%= Datos_estudiante[1][0]%></h2>
                <br>
                <h1> Apellido: </h1> 
                <h2> <%= Datos_estudiante[2][0]%></h2>
                <br>
                <h1> Fecha de nacimiento: </h1>
                <h2> <%= Datos_estudiante[3][0]%></h2>
            </center>
        </section>
    </center>

    <% int n = Con.Numero_tutores(Identificaion);
        int j = 0;
        for (int i = 0; i < n; i++) {
    %>
    <div id="tutor">
        <section id="sectio-tutor"> 
            <center>
                <img src="imagenes/usuario.png">
                <h1>Tutor <%=i%></h1>
                <br>
                <h1> Identificacion:</h1>
                <h2> <%= Datos_estudiante[4][j]%></h2>
                <br>
                <h1>  Nombre: </h1>
                <h2><%= Datos_estudiante[5][j]%></h2>
                <br>
                <h1> Apellido: </h1> 
                <h2> <%= Datos_estudiante[6][j]%></h2>
                <br>
                <h1> telefono: </h1>
                <h2> <%= Datos_estudiante[7][j]%></h2>
                <br>
                <h1> Celular: </h1>
                <h2> <%= Datos_estudiante[8][j]%></h2>
                <br>
                <h1> Direccion: </h1>
                <h2> <%= Datos_estudiante[9][j]%></h2>
                <br>
                <h1> Parentesco: </h1>
                <h2> <%= Datos_estudiante[10][j]%></h2>
            </center>
        </section>
    </div>
    <%
            j++;
        }
    %>
    <div id="matricula">
        <%
            int count = Con.Numero_matriculas(Identificaion);
            for(int i=0;i<count;i++){
        %>
            <br>
                <h1> Identificacion:</h1>
                <h2> <%= Datos_estudiante[4][j]%></h2>
                <br>
                <h1>  Nombre: </h1>
                <h2><%= Datos_estudiante[5][j]%></h2>
                <br>
                <h1> Apellido: </h1> 
                <h2> <%= Datos_estudiante[6][j]%></h2>
                <br>
                <h1> telefono: </h1>
                <h2> <%= Datos_estudiante[7][j]%></h2>
                <br>
                <h1> Celular: </h1>
                <h2> <%= Datos_estudiante[8][j]%></h2>
                <br>
                <h1> Direccion: </h1>
                <h2> <%= Datos_estudiante[9][j]%></h2>
                <br>
                <h1> Parentesco: </h1>
                <h2> <%= Datos_estudiante[10][j]%></h2>
        <%
            }
        %>
            
    </div>

</body>
</html>
