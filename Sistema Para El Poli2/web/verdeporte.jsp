<%@page import="conexion.Conectar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon"    href="imagenes/escudo.jpg">
        <link rel="stylesheet" type="text/css" media="screen" href="css/Tabla_usuarios.css">

        <%
            String Deporte = request.getParameter("deporte");
            Conectar Con = new Conectar();
            String Codigo_deporte = Con.Codigo_deporte(Deporte);
            
            
            String Categorias_deporte[][] = Con.Categorias_deporte(Codigo_deporte);
         %>
         <title><%=Deporte%></title>
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
        <div id="tabla-categorias">
            <center>
                <h1>Categorias de <%=Deporte %></h1>
                <div class="derecha" id="buscar">Buscar <input type="search" class="light-table-filter" data-table="order-table" placeholder="Filtro"></div>


                <div class="datagrid">
                    <table class="order-table table" id="customers">
                        <thead>
                            <tr class="titulo"> 
                                <th>    Categoria  </th>
                                <th>    Horario  </th>
                            </tr>
                        </thead>
                        
                        <tbody>
                            <%
                                for (int i = 0; i < Con.Deporte_categoria_count(Con.Codigo_deporte(Deporte)); i++) {
                            %>
                            <tr>    
                                <td align="center"><a><%=Con.Descripcion_categoria(Categorias_deporte[0][i])%></a></td> 
                                <td align="center"><a><%= Con.Descripcion_horario(Categorias_deporte[1][i])%></a></td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </center>
        </div>
    </center>

    <script>
                
                function  getIdDeportes(element, direccionweb) {
                /*alert("row" + element.parentNode.parentNode.rowIndex +
                 " - column" + element.parentNode.cellIndex);*/
                var x = document.getElementById("customers").rows[element.parentNode.parentNode.rowIndex].cells[0].innerText;
                        location.href = direccionweb + 'categoria.jsp?deporte=' + x;
                }

    </script>
    </body>
</html>
