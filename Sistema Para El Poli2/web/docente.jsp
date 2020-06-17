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
            int cambio = Con.Cambio_clave(Identificaion_docente);
        %>
        <title>Docente: <%=Con.Nombre_docente(Identificaion_docente)%></title>
    </head>
    <body>

        <div class="container section">

            <a href="#" class="sidenav-trigger btn-floating pulse green" data-target="menu-side">
                <i class="material-icons">menu</i><a class=" pulse green" style="color: white;background-color: transparent;">  Menu</a>
            </a>

            <ul class="sidenav" id="menu-side">
                <li>
                    <div class="user-view">
                        <div class="background">
                            <img src="imagenes/refresh.gif" alt="" style="height:100%;width: 100%" >
                        </div>
                        <a href="">
                            <span class="name white-text"><%=Con.Nombre_docente(Identificaion_docente)%></span>
                        </a>
                        <a href="">
                            <span class="email white-text"><%=MensajesErrores.getDocente()%></span>
                        </a>
                    </div>
                </li>
                <li>
                    <a href="?id=#" onclick="muestra_oculta('horario')">
                        <i class="material-icons">visibility</i>
                        Ver mis horarios
                    </a>
                </li>
                <li>
                    <div class="divider"></div>
                </li>
                <li>
                    <a href="#" onclick="muestra_oculta('cambio')">
                        <i class="material-icons">build</i>
                        Configuracion
                        <% if (cambio == 1) {//Si no ha cambiado mostramos un objeto a la configuracion para que la cambie%>
                        <span class="new badge">1</span>
                        <%
                            }
                        %>

                    </a>
                    <a href="#" onclick="Cerrar()">Cerrar sesion</a>
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
                                <img src="imagenes/deportes.png" alt="" style="height:100%">
                                <div class="caption right-align">
                                    <h3>NO TE PREGUNTES QUE PUEDEN HACER TUS COMPAÑEROS POR TI</h3>
                                    <h5 class="light">REGÚNTATE QUE PUEDES HACER TÚ POR ELLOS</h5>
                                </div>
                            </li>


                            <li>
                            <center><img src="imagenes/poli-desde-el-cielo.jpg" alt="" style="height:400px"></center>
                            <div class="caption left-align">
                                <h3>ENTRENA Y COMPITE CONTRA TI MISMO,</h3>
                                <h5 class="light">TU ERES TU MÁXIMO RIVAL. LOS DEMÁS SON COMPAÑEROS DE LOS QUE SE PUEDE APRENDER MUCHO</h5>
                            </div>
                            </li>

                        </ul>
                    </div>

                </div>
            </div>
            <!-- Ver sus estudiante -->
            <%
                if (!request.getParameter("id").isEmpty()) {
                    int id = Con.Ver_estudiante(request.getParameter("id"));
            %>
            <div>
                <center>
                    <a href="javascript:history.back()"><img src="imagenes/regreso.png" alt="Atras"></a>
                </center>
            </div>
            <%
                        switch (id) {
                            case 0://cuando es un codigo de relacion (tabla con deporte-horario-codigo)%>
            <center>
                <div id="estudiantes">
                    <center>
                        <h1>Estudiantes</h1>
                        <div class="derecha" id="buscar">Buscar <input type="search" class="light-table-filter" data-table="order-table" placeholder="Filtro"></div>


                        <div class="datagrid">
                            <table class="order-table table" id="verestudiante">
                                <thead>
                                    <tr class="titulo"> 
                                        <th>    Identificacion  </th>
                                        <th>    Nombre  </th>
                                        <th>    Apellido </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        Con.setCodigo_relacion(request.getParameter("id"));
                                        String estudiantes[][] = Con.Clase_estudiante(request.getParameter("id"));
                                        for (int i = 0; i < Con.Cuantos_en_la_clase(request.getParameter("id")); i++) {
                                    %>
                                    <tr>    
                                        <td align="center"><a><%= estudiantes[0][i]%></a></td>
                                        <td align="center"><a><%= estudiantes[1][i]%></a></td>
                                        <td align="center"><a><%= estudiantes[2][i]%></a></td>
                                        <td align="center"> 
                                            <img style="" src="imagenes/ojo.png" width="30" height="30" onclick="getestudiante(this)">
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
            </center>
            <%
                    break;
                case 1:
                    String Datos_estudiante[][] = Con.Datos_estudiante(request.getParameter("id"));
            %>

            <%-- Formulario registro --%>
            <center>
                <div class="card blue-grey darken-1" id="row" style="display: none">
                    <center>
                        <form class="col s12" action="seguimiento?Codigo=<%=Con.getCodigo_relacion()%>&Estudiante=<%=request.getParameter("id")%>" method="post">
                            <center>
                                <div class="row">
                                    <div class="input-field col s6">
                                        <i class="material-icons prefix">mode_edit</i>
                                        <textarea id="icon_prefix2" class="materialize-textarea" name="Cumplimiento" required="" maxlength="80"></textarea>
                                        <label for="icon_prefix2">Cumplimientos</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <i class="material-icons prefix">mode_edit</i>
                                        <textarea id="icon_prefix2" class="materialize-textarea" name="Cumplimiento" required="" maxlength="120"></textarea>
                                        <label for="icon_prefix2">Seguimiento</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <i class="material-icons prefix">mode_edit</i>
                                        <input type="text" id="icon_prefix2" class="materialize-textarea" name="Nota" required pattern="[0.0-5.0]{1,5}"></input>
                                        <label for="icon_prefix2">Nota</label>
                                    </div>
                                    <button class="btn waves-effect waves-light" type="submit" name="action">Enviar
                                        <i class="material-icons right">send</i>
                                    </button
                                </div>
                            </center>
                        </form>
                    </center>
                </div>
            </center>

            <div class="col s12 m8 offset-m2 l6 offset-l3">
                <div class="card-panel grey lighten-5 z-depth-1">
                    <div class="row valign-wrapper">
                        <div class="col s2">
                            <img src="imagenes/usuario.png" alt="" class="circle responsive-img"> <!-- notice the "circle" class -->
                        </div>
                        <div class="col s10">
                            <span class="black-text">
                                <section> 
                                    <center>
                                        <br>
                                        <span class="black-text">
                                            <b>Identificacion:</b>
                                            <br>
                                            <%= Datos_estudiante[0][0]%>
                                            <br>
                                            <br>
                                            <b>Nombre:</b>
                                            <br>
                                            <%= Datos_estudiante[1][0]%>
                                            <br>
                                            <br>
                                            <b>Apellido:</b>
                                            <br>
                                            <%= Datos_estudiante[2][0]%>
                                        </span>
                                    </center>
                                </section>
                            </span>
                        </div>
                    </div>
                </div>
            </div>


            <% int n = Con.Numero_tutores(request.getParameter("id"));
                int j = 0;
                for (int i = 0; i < n; i++) {
            %>

            <di>
                <div class="col s12 m8 offset-m2 l6 offset-l3">
                    <div class="card-panel grey lighten-5 z-depth-1">
                        <div class="row valign-wrapper">
                            <div class="col s2">
                                <img src="imagenes/usuario.png" alt="" class="circle responsive-img"> <!-- notice the "circle" class -->
                            </div>
                            <div class="col s10">
                                <span class="black-text">
                                    <section style="column-count: 2;"> 
                                        <center>
                                            <br>
                                            <span class="black-text">
                                                <center>
                                                    Tutor <%=i + 1%>
                                                    <br>
                                                    <br>
                                                    <b>Identificacion:  </b>
                                                    <%= Datos_estudiante[4][j]%>
                                                    <br>
                                                    <br>
                                                    <b>Nombre:  </b>
                                                    <%= Datos_estudiante[5][j]%>
                                                    <br>
                                                    <br>
                                                    <b>Apellido:  </b>
                                                    <%= Datos_estudiante[6][j]%>
                                                    <br>
                                                    <br>
                                                    <b>telefono:  </b>
                                                    <%= Datos_estudiante[7][j]%>
                                                    <br>
                                                    <br>
                                                    <b>Celular:  </b>
                                                    <%= Datos_estudiante[8][j]%>
                                                    <br>
                                                    <br>
                                                    <b>Direccion:  </b>
                                                    <%= Datos_estudiante[9][j]%>
                                                    <br>
                                                    <br>
                                                    <b>Parentesco:  </b>
                                                    <%= Datos_estudiante[10][j]%>
                                                </center>
                                            </span>
                                        </center>
                                    </section>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </di>

            <%
                    j++;
                }
            %>

            <div class="fixed-action-btn">
                <a class="btn-floating btn-large red">
                    <i class="large material-icons">add</i>
                </a>
                <ul>
                    <li><a class="btn-floating green"><i class="material-icons" onclick="muestra_oculta('row')">create</i></a></li>
                </ul>
            </div>

            <%
                        break;
                }
            %>

            <%
            } else {//Vista para ver el horario%>
            <!-- Ver horario -->

            <div id="horario" style="display: none;">
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
                                    String horario[][] = Con.Horarios_docente(Identificaion_docente);
                                    for (int i = 0; i < Con.Cuantos_horarios_docente(Identificaion_docente); i++) {
                                %>
                                <tr>    
                                    <td align="center"><a><%= horario[0][i]%></a></td>
                                    <td align="center"><a><%= horario[1][i]%></a></td>
                                    <td align="center"><a><%= horario[2][i]%></a></td>
                                    <td align="center"><a><%= horario[3][i]%></a></td>
                                    <td align="center"> 
                                        <img style="" src="imagenes/ojo.png" width="30" height="30" onclick="getId(this)">
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
            <%
                }
            %>

            <center>
                <div id="cambio" style="display: none">
                    <div class="card blue-grey darken-1">
                        <center>
                            <form action="cambiocontra?id=<%= Identificaion_docente%>" method="post">
                                <center>
                                    <label>Nueva Contraseña</label>
                                    <center>
                                        <div class="input-field col s12">
                                            <input id="password" type="password" class="validate" name="C1" maxlength="30">
                                            <label for="password">Password</label>
                                        </div>
                                    </center>    
                                </center> 
                                <label>Repita la contraseña</label>
                                <div class="input-field col s12">
                                    <input id="password" type="password" class="validate" name="C2" maxlength="30">
                                    <label for="password">Password</label>
                                </div>
                                <button class="btn waves-effect waves-light" type="submit" name="action">Cambiar
                                    <i class="material-icons right">send</i>
                                </button
                            </form>
                        </center>
                    </div>
                </div>
            </center>

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

                document.addEventListener('DOMContentLoaded', function () {
                    var elems = document.querySelectorAll('.fixed-action-btn');
                    var instances = M.FloatingActionButton.init(elems, {
                        direction: 'up'
                    });
                });

                document.addEventListener('DOMContentLoaded', function () {
                    var elems = document.querySelectorAll('.modal');
                    var instances = M.Modal.init(elems);
                });

                function muestra_oculta(id) {

                    if (document.getElementById) { //se obtiene el id
                        var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
                        el.style.display = (el.style.display == 'none') ? 'block' : 'none'; //damos un atributo display:none que oculta el div
                    }

                    if (id == "horario") {
                        oculta('cambio');
                    } else {
                        oculta('horario')
                    }
                }

                function cargar() {
                    oculta('horario');
                    oculta('row');
                    oculta('cambio');
                }
                function oculta(id) {//Si le da al radio que no oculta 
                    if (document.getElementById) { //se obtiene el id
                        var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
                        el.style.display = (el.style.display == 'none') ? 'none' : 'none'; //damos un atributo display:none que oculta el div
                    }
                }

                function  getId(element, direccionweb) {
                    /*alert("row" + element.parentNode.parentNode.rowIndex +
                     " - column" + element.parentNode.cellIndex);*/
                    var x = document.getElementById("customers").rows[element.parentNode.parentNode.rowIndex].cells[0].innerText;
                    location.href = 'docente.jsp?id=' + x;
                }
                function  getestudiante(element) {
                    /*alert("row" + element.parentNode.parentNode.rowIndex +
                     " - column" + element.parentNode.cellIndex);*/
                    var x = document.getElementById("verestudiante").rows[element.parentNode.parentNode.rowIndex].cells[0].innerText;
                    location.href = 'docente.jsp?id=' + x;
                }

                function Cerrar() {
                    window.location.replace('index.jsp');
                }
            </script>

            <script type="text/javascript">
                (function (document) {
                    'use strict';
                    var LightTableFilter = (function (Arr) {

                        var _input;
                        function _onInputEvent(e) {
                            _input = e.target;
                            var tables = document.getElementsByClassName(_input.getAttribute('data-table'));
                            Arr.forEach.call(tables, function (table) {
                                Arr.forEach.call(table.tBodies, function (tbody) {
                                    Arr.forEach.call(tbody.rows, _filter);
                                });
                            });
                        }

                        function _filter(row) {
                            var text = row.textContent.toLowerCase(), val = _input.value.toLowerCase();
                            row.style.display = text.indexOf(val) === -1 ? 'none' : 'table-row';
                        }

                        return {
                            init: function () {
                                var inputs = document.getElementsByClassName('light-table-filter');
                                Arr.forEach.call(inputs, function (input) {
                                    input.oninput = _onInputEvent;
                                });
                            }
                        };
                    })(Array.prototype);
                    document.addEventListener('readystatechange', function () {
                        if (document.readyState === 'complete') {
                            LightTableFilter.init();
                        }
                    });
                })(document);</script>
    </body>
</html>
