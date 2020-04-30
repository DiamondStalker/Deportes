<%@page import="conexion.Conectar"%>
<%@page import="Metodos.MensajesErrores"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon"    href="imagenes/escudo.jpg">
        <link rel="stylesheet" type="text/css" media="screen" href="css/styleadmin.css">

        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/css/materialize.min.css">

        <%
            Conectar Con = new Conectar();
            String Identificaion_docente = Con.Identificacion_usuario(MensajesErrores.getDocente());
        %>
        <title>Docente: <%=Con.Nombre_docente(Identificaion_docente)%></title>
    </head>
    <body>

        <div class="container section">

            <a href="#" class="sidenav-trigger btn-floating pulse green" data-target="menu-side">
                <i class="material-icons">menu</i>
            </a>

            <ul class="sidenav" id="menu-side">
                <li>
                    <div class="user-view">
                        <div class="background">
                            <img src="imagenes/refresh.gif" alt="" style="height:100%;width: 100%" >
                        </div>
                        <a href="#">
                            <img src="imagenes/usuario.png" alt="" class="circle">
                        </a>
                        <a href="">
                            <span class="name white-text"><%=Con.Nombre_docente(Identificaion_docente)%></span>
                        </a>
                        <a href="">
                            <span class="email white-text"><%=MensajesErrores.getDocente()%></span>
                        </a>
                    </div>
                </li>
                <li>
                    <a href="#" onclick="muestra_oculta('horario')">
                        <i class="material-icons">visibility</i>
                        Ver mis horarios
                    </a>
                </li>
                <li>
                    <a href="">
                        <i class="material-icons">cloud</i>
                        Segundo Elemento
                    </a>
                </li>
                <li>
                    <div class="divider"></div>
                </li>
                <li>
                    <a href="">
                        <i class="material-icons">build</i>
                        Configuracion
                    </a>
                </li>
            </ul>

        </div>

        <div class="container section">
            <div class="row">


                <div class="col s12">

                    <div class="slider">
                        <ul class="slides">

                            <li>
                                <img src="imagenes/Balon_de_futbol.jpg" alt="" style="width: 100%">
                                <div class="caption center-align">
                                    <h3>Soy un pensador muy positivo</h3>
                                    <h5 class="light">y creo que es lo que me ha ayudado en los momentos más difíciles.</h5>
                                </div>
                            </li>

                            <li>
                                <img src="imagenes/usuario.png" alt="" style="width:auto">
                                <div class="caption right-align">
                                    <h3>Lorem, ipsum dolor.</h3>
                                    <h5 class="light">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ipsa, praesentium.</h5>
                                </div>
                            </li>


                            <li>
                            <center><img src="imagenes/escudo.jpg" alt="" ></center>
                            <div class="caption left-align">
                                <h3>Lorem, ipsum dolor.</h3>
                                <h5 class="light">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Ipsa, praesentium.</h5>
                            </div>
                            </li>

                        </ul>
                    </div>

                </div>

                <div class="col s6">
                    <div class="section">

                        <img src="s3.jpg" alt="" class="materialboxed responsive-img">

                    </div>
                </div>

                <div class="col s6">
                    <div class="section">

                        <img src="s3.jpg" alt="" class="materialboxed responsive-img" data-caption="Esta es una imagen de una persona haciendo SURF">

                    </div>
                </div>


            </div>
        </div>


        <!-- Ver horario -->

        <div id="horario" style="display: none;">
            <center>
                <h1>Estudiantes</h1>
                <div class="derecha" id="buscar">Buscar <input type="search" class="light-table-filter" data-table="order-table" placeholder="Filtro"></div>


                <div class="datagrid">
                    <table class="order-table table" id="customers">
                        <thead>
                            <tr class="titulo"> 
                                <th>    Identificaion  </th>
                                <th>    Nombre  </th>
                                <th>    Codigo de matricula </th>
                                <th>    Deporte </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String horario[][] = Con.Horarios_docente(Identificaion_docente);
                                for (int i = 0; i < Con.Cuantos_horarios_docente(Identificaion_docente); i++) {
                            %>
                            <tr>    
                                <td align="center"><a><%= horario[0][i]%></a></td>
                                <td align="center"><a><%= horario[1][i]%></a></td>
                                <td align="center"><a><%= horario[2][i]%></a></td>
                                <td align="center"><a><%= horario[3][i]%></a></td>
                                <td align="center"> 
                                    <img style="" src="imagenes/ojo.png" width="30" height="30" onclick="getId(this, 'ver')">
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </center>
        </div>


        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-rc.2/js/materialize.min.js">
        </script>

        <script>

            document.addEventListener('DOMContentLoaded', function () {
                var elems = document.querySelectorAll('.slider');
                var instances = M.Slider.init(elems, {
                });

                var elems = document.querySelectorAll('.materialboxed');
                var instances = M.Materialbox.init(elems);

                var elems = document.querySelectorAll('.sidenav');
                var instances = M.Sidenav.init(elems);

            });

            function muestra_oculta(id) {

                if (document.getElementById) { //se obtiene el id
                    var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
                    el.style.display = (el.style.display == 'none') ? 'block' : 'none'; //damos un atributo display:none que oculta el div
                }
            }

            function cargar() {
                oculta('horario');
            }

        </script>
    </body>
</html>
