<%@page import="conexion.Conectar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon"    href="imagenes/escudo.jpg">
        <% String Identificaion = request.getParameter("id");
            Conectar Con = new Conectar();
        %>
        <title> <%= Identificaion%></title>
        <link rel="stylesheet" type="text/css" media="screen" href="css/verestudiantes.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/Tabla_usuarios.css">

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

    <div id="horario">
        <center>
            <h1>Mi horario</h1>
            <div class="derecha" id="buscar">Buscar <input type="search" class="light-table-filter" data-table="order-table" placeholder="Filtro"></div>


            <div class="datagrid">
                <table class="order-table table" id="customers">
                    <thead>
                        <tr class="titulo"> 
                            <th>    Codigo clase  </th>
                            <th>    Deporte  </th>
                            <th>    Categoria </th>
                            <th>    Horario </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String horario[][] = Con.Horarios_docente(Identificaion);
                            for (int i = 0; i < Con.Cuantos_horarios_docente(Identificaion); i++) {
                        %>
                        <tr>    
                            <td align="center"><a><%= horario[0][i]%></a></td>
                            <td align="center"><a><%= horario[1][i]%></a></td>
                            <td align="center"><a><%= horario[2][i]%></a></td>
                            <td align="center"><a><%= horario[3][i]%></a></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </center>
    </div>

</body>
</html>
