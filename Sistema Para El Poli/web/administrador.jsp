<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Random"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="conexion.Conectar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador</title>
        <link rel="icon"    href="imagenes/escudo.jpg">
        <link rel="stylesheet" type="text/css" media="screen" href="css/styleadmin.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/Tabla_usuarios.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/tabladocentes.css">
        <script  src = "http://code.jquery.com/jquery-1.11.0.min.js"></script> 
        <script src="https://kit.fontawesome.com/ed45eaf214.js" crossorigin="anonymous"></script>
        <%-- Scrip para hacer menu desplejable--%>
        <script>
                    function cargar() {
                    oculta('contenido');
                            oculta('tablaestudiantes');
                            oculta('Acudiente');
                            oculta('Deportes-insertar');
                            oculta('tabladeportes');
                            oculta('asignar-hora');
                            oculta('profesor_deporte-contend');
                            oculta('Ver_Docente');
                            oculta('Insertardocente');
                    }


            function muestra_oculta(id) {

            if (document.getElementById) { //se obtiene el id
            var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
                    el.style.display = (el.style.display == 'none') ? 'block' : 'none'; //damos un atributo display:none que oculta el div
            }
            /*
             * Cierrar el conetido al cambiar de submenu
             */
            //Preguntas del menu estudiante
            if (id == "contenido") {
            oculta('tablaestudiantes');
                    oculta('Acudiente');
            }
            if (id == "tablaestudiantes") {
            oculta('contenido');
                    oculta('Acudiente');
            }
            if (id == "Acudiente") {
            oculta('contenido');
                    oculta('tablaestudiantes');
            }

            //Preguntas del menu deporte
            if (id == "tabladeportes") {
            oculta('Deportes-insertar');
                    oculta('asignar-hora');
            }
            if (id == "Deportes-insertar") {
            oculta('asignar-hora');
                    oculta('tabladeportes');
            }
            if (id == "asignar-hora") {
            oculta('Deportes-insertar');
                    oculta('tabladeportes');
            }
            
            //Preguntas para docente
            if (id == "Ver_Docente") {
            oculta('profesor_deporte-contend');
            oculta('Insertardocente');
            }
            if (id == "profesor_deporte-contend") {
            oculta('Ver_Docente');
            oculta('Insertardocente');
            }
            if (id == "Insertardocente") {
            oculta('Ver_Docente');
            oculta('profesor_deporte-contend');
            }


            }

//--- Funcion mejorada de mostar y ocultar ---//
            function muestra(id) { //Si le da al radio que si muestra 
            if (document.getElementById) { //se obtiene el id
            var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
                    el.style.display = (el.style.display == 'block') ? 'block' : 'block'; //damos un atributo display:none que oculta el div
            }
            }


            function oculta(id) {//Si le da al radio que no oculta 
            if (document.getElementById) { //se obtiene el id
            var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
                    el.style.display = (el.style.display == 'none') ? 'none' : 'none'; //damos un atributo display:none que oculta el div
            }
            }


            /*  Script que permite deplegar el menu */
            /*  Si se activa uno los otros se cierran*/

            $(document).ready(function () {
            $("#accordian a").click(function () {

            var link = $(this);
                    var closest_ul = link.closest("ul");
                    var parallel_active_links = closest_ul.find(".active");
                    var closest_li = link.closest("li");
                    var link_status = closest_li.hasClass("active");
                    var count = 0;
                    closest_ul.find("ul").slideUp(function () {
            if (++count === closest_ul.find("ul").length)
                    parallel_active_links.removeClass("active");
                    //Preguntas para el submenu estudiante
                    //Cierrar el contenido mostrado al cambiar de menu
                    if ($('#contenido').is(':visible'))
                    oculta("contenido");
                    if ($('#tablaestudiantes').is(':visible'))
                    oculta("tablaestudiantes");
                    if ($('#Acudiente').is(':visible'))
                    oculta("Acudiente");
                    //Preguntas para el submenu deportes
                    if ($('#Deportes-insertar').is(':visible'))
                    oculta("Deportes-insertar");
                    if ($('#tabladeportes').is(':visible'))
                    oculta("tabladeportes");
                    if ($('#asignar-hora').is(':visible'))
                    oculta("asignar-hora");
                    if ($('#profesor_deporte-contend').is(':visible'))
                    oculta("profesor_deporte-contend");
                    if ($('#Ver_Docente').is(':visible'))
                    oculta("Ver_Docente");
                    if ($('#Insertardocente').is(':visible'))
                    oculta("Insertardocente");
            });
                    if (!link_status)
            {
            closest_li.children("ul").slideDown();
                    closest_li.addClass("active");
            }
            });
            });
                    /*
                     Funcion para que solo acepte numeros
                     Se
                     usa esta funcion porque el de pordefecto de html5 al principio acepta todo y luego valida que solo sean numeros %
                     este es en tiepo real
                     */
                            function SoloN(e) {
                            tecla = (document.all) ? e.keyCode : e.which;
                                    //Tecla de retroceso para borrar, siempre la permite
                                    if (tecla == 8) {
                            return true;
                            }
                            // Patron de entrada, en este caso solo acepta numeros
                            patron = /[0-9]/;
                                    tecla_final = String.fromCharCode(tecla);
                                    return patron.test(tecla_final);
                            }

        </script>

        <script type="text/javascript">
                    function reFresh()
                            location.reload(true)
                            ;
                    }
            /* Establece el tiempo 1 minuto = 60000 milliseconds. */
            window.setInterval("reFresh()", 300000);</script>
    </head>
    <body onload="cargar()">
    <center>
        <a onclick="javascript:window.location.reload();"> <img src="imagenes/refresh.gif" alt=""></a>
    </center> 

    <br>
    <br>
    <div id="accordian">
        <ul>
            <%-- Menu estudiantes --%>
            <li class="active">
                <h3><a href="#"><span class="icon-dashboard"></span>Estudiante</a></h3>
                <ul style="display: block;">
                    <li><a href="#" onClick="muestra_oculta('contenido')">Matricular</a></li>
                    <li><a href="#" onClick="muestra_oculta('tablaestudiantes')">Ver</a></li>
                    <li><a href="#" onclick="muestra_oculta('Acudiente')">Ingresar segundo acudiente</a></li>
                </ul>
            </li>
            <%-- Menu profesores --%>
            <li class="">
                <h3><a href="#"><span class="icon-tasks"></span>Profesor</a></h3>
                <ul style="display: none;">
                    <li><a href="#" onclick="muestra_oculta('Insertardocente')">Registrar profesor</a></li>
                    <li><a href="#" onclick="muestra_oculta('profesor_deporte-contend')">Asignarl deporte</a></li>
                    <li><a href="#" onclick="muestra_oculta('Ver_Docente')">Ver</a></li>
                </ul>
            </li>
            <%-- Menu Deportes --%>
            <li>
                <h3><a href="#"><span class="icon-calendar"></span>Deporte</a></h3>
                <ul>
                    <li><a href="#" onclick="muestra_oculta('Deportes-insertar')">Crear</a></li>
                    <li><a href="#" onclick="muestra_oculta('tabladeportes')">Ver</a></li>
                    <li><a href="#" onclick="muestra_oculta('asignar-hora')">Asignar horario a deporte</a></li>
                </ul>
            </li>
            <%-- Menu Reportes --%>
            <li>
                <h3> <a href="#"> Reportes</a></h3>
                <ul>
                    <li><a href="#">Certificado de matricula</a></li>
                    <li><a href="ListaEstudiantes">Lista estudiantes</a></li>
                    <li><a href="#">Lista por deporte</a></li>
                    <li><a href="#">Lista profesores</a></li>
                    <li><a href="#">Mejores estudiantse</a></li>
                    <li><a href="#">Estudiantes que ganan</a></li>
                    <li><a href="#">Estudiantes que pierden</a></li>
                </ul>
            </li>
            <li>
                <h3><a href="#" onclick="cerrar()"><span>Cerrar sesion</span></a></h3>
            </li>
        </ul>
    </div>

    <%-- Inicio de codigo para insertar estudiante--%>

    <div id="contenido" style="display: none;">
        <%-- Ingresar Usuario Con Archivo--%>
        <form id="estudiante" action="UploadServlet" method="post" enctype="multipart/form-data" target="_blank">
            <h1>Insertar usuario desde archivo excel</h1>
            <input type="file" name="ArchivoExcell" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, .xlsx, .xlsm, .xls">
            <input type="submit" value="Enviar datos">
        </form>


        <%-- Ingresar Usuario Manualmente--%>
        <form id="estudiante" action="InsertarUsuario" method="post">
            <h1>Insertar usuario</h1>
            <label>Identificacion: </label><input id="ides" type="text" name="ides" onclick="valueOf('')" required="" onkeypress="return SoloN(event)" minlength="10" maxlength="11" placeholder="Tarjeta de identidad">   
            <br>
            <br>
            <label id="Textonombre">Nombre del estudiante: </label><input id="NEstudiante" type="text" name="NombreEstudiante" onclick="valueOf('')" placeholder="Escriba sus dos nombres" maxlength="30">   
            <br>
            <br>
            <label>Apellido del estudiante: </label><input id="AEstudiante" type="text" name="ApellidoEstudiante" onclick="valueOf('')"  placeholder="Escriba sus dos apellidos" maxlength="30">   
            <br>
            <br>
            <%-- 
                   Llamamos a LocalDate para capturar el año acual y le restamos 3 y al otro 12, para que nos 
                   devuelva el año de la categoria permitida
                   suponiendo que la categoria minima para practicar es sub 3
                   y la categoria maxima es sub 12
                   el año maximo --> categoria minima
                   el año minimo --> categoira maxima
            --%>
            <label>Fecha de nacimiento: </label> <input id="Fechan" type="date" name="Fechan" required="" value="<%=LocalDate.now().getYear() - 12%>-01-01" max="<%=LocalDate.now().getYear() - 3%>-12-31" min="<%=LocalDate.now().getYear() - 12%>-01-01">   
            <br>
            <br>
            Deporte:
            <select id="Sdeporte" name="Sdeporte" onblur="myFunction(this.value, Fechan.value)">
                <%-- Creamos un objeto conexion para que nos devuelva cuantos deportes hya y cuales son--%>
                <% Conectar con = new Conectar();
                    String DD[] = con.deportes();
                    int cuantos = con.cuantosDeportes(); %>
                <% for (int i = 0; i < cuantos; i++) {%>
                <option> <%=DD[i]%></option>
                <% }%>
            </select>
            <br>
            <br>
            Horario:
            <select id="Horario" name="Horario">
                <option>Primero seleccione un deporte y la fecha de nacimiento</option>
            </select>
            <br>
            <br>
            <label>Identificacion acudiente: </label><input id="idacu1" type="text" name="idacu1" onclick="valueOf('')"  onkeypress="return SoloN(event)" minlength="10" maxlength=11 placeholder="Cc">   
            <br>
            <br>
            <label>Nombre acudiente: </label><input id="NAcudiente" type="text" name="NAcudiente" onclick="valueOf('')" maxlength="30">   
            <br>
            <br>
            <label>Apellido acudiente: </label><input id="AAcudiente" type="text" name="aAcudiente" onclick="valueOf('')"  maxlength="30">   
            <br>
            <br>
            <label>Telefono: </label><input id="Telefono" type="text" name="Telefono" onclick="valueOf('')"  onkeypress="return SoloN(event)" maxlength="10">   
            <br>
            <br>
            <label>Celular: </label><input id="celular" type="text" name="celular" onclick="valueOf('')"  maxlength="11"  onkeypress="return SoloN(event)">   
            <br>
            <br>
            <label>Direccion: </label><input id="Direccion" type="text" name="Direccion" onclick="valueOf('')"  maxlength="30">   
            <br>
            <br>
            Parentesco: 
            <select name="Seleccione_parentesco">
                <option> Seleccione parentesco</option>
                <option> Padre</option>
                <option>Madre</option>
                <option>Tio</option>
                <option>Tia</option>
                <option>Vecina</option>
                <option>Vecino</option>
                <option>Hermano</option>
                <option>Hermana</option>
            </select>
            <br>
            <br>

            <%-- Formulario Ingresar Acudiente 2 --%>

            <label>Ingresar acudiente 2: </label>
            <input   type="radio" name="pregunta" value="Si" onClick="muestra('Acudiente-contend')">Si
            <input   type="radio" name="pregunta" value="No" onClick="oculta('Acudiente-contend')" checked="">No

            <div id="Acudiente-contend" style="display: none;">

                <br>
                <br>
                <label>Identificacion acudiente: </label><input id="idacu1" type="text" name="idacu12" onclick="valueOf('')" onkeypress="return SoloN(event)" minlength="10" maxlength=11 placeholder="Cc">   
                <br>
                <br>
                <label>Nombre acudiente: </label><input id="NAcudiente" type="text" name="NAcudiente2" onclick="valueOf('')" placeholder="Nombres" maxlength="30">   
                <br>
                <br>
                <label>Apellido acudiente: </label><input id="AAcudiente" type="text" name="aAcudiente2" onclick="valueOf('')" placeholder="Apellidos" maxlength="30">   
                <br>
                <br>
                Parentesco: 
                <select name="Seleccione_parentesco2">
                    <option> Seleccione parentesco</option>
                    <option> Padre</option>
                    <option>Madre</option>
                    <option>Tio</option>
                    <option>Tia</option>
                    <option>Vecina</option>
                    <option>Vecino</option>
                    <option>Hermano</option>
                    <option>Hermana</option>
                </select>
                <br>
                <br>
                <label>Telefono: </label><input id="Telefono" type="text" name="Telefono2" onclick="valueOf('')"  onkeypress="return SoloN(event)" maxlength="10">   
                <br>
                <br>
                <label>Celular: </label><input id="celular" type="text" name="celular2" onclick="valueOf('')"  maxlength="11"  onkeypress="return SoloN(event)">   
                <br>
                <br>
                <label>Direccion: </label><input id="Direccion" type="text" name="Direccion2" onclick="valueOf('')" maxlength="30">   
                <br>
                <br>
            </div>

            <br>
            <br>
            <input type="submit" id="submit" value="Matricular">
        </form>
        <br>
        <br>
        <!--==============================Alerta1================================-->
        <div id="Alerta" class="icono fas fa-exclamation">

            <strong id="Informacion">Informacion</strong> <br>
            Si el estudiante ya tiene una matricula<br>
            previa solo se necesita llenar la informacion <br>
            Identificacion, Deporte , la hora y la fecha de nacimiento<br>
        </div>
        <!--==============================Alerta2================================-->
        <div id="Alerta2" class="icono fas fa-exclamation" style="border-radius: 25px;
             background-color: #D9EDF7;
             border:2px solid #77B2D0;
             padding: 20px;
             color: #77B2D0;
             float: right;
             position: absolute; right: 200px; top: 550px;">

            <strong id="Informacion">Informacion</strong> <br>
            Para poder seleccionar un horario<br>
            debe que llenar los campos <br>
            deporte y la fecha de nacimiento.<br>
            En el caso de que no haya una caegoria valida para ese deportes<br>
            no se mostrara ningun horario<br>
        </div>

        <!--==============================Alerta2================================-->

    </div>

    <%-- Fin de codigo para insertar estudiante--%>


    <!--============================Inicio codigo tabla de usuarios================================-->
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
                                row.style.display = text.indexOf(val) === - 1 ? 'none' : 'table-row';
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

    <center>
        <div id="tablaestudiantes" style="display: none;">
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
                                String Estudiante[][] = con.Estudiante();
                                for (int i = 0; i < con.Numero_de_matriculas_totales(); i++) {
                            %>
                            <tr>    
                                <td align="center"><a><%= Estudiante[0][i]%></a></td>
                                <td align="center"><a><%= Estudiante[1][i]%></a></td>
                                <td align="center"><a><%= Estudiante[2][i]%></a></td>
                                <td align="center"><a><%= Estudiante[3][i]%></a></td>
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
    </center>

    <script>
                function  getId(element, direccionweb) {
                /*alert("row" + element.parentNode.parentNode.rowIndex +
                 " - column" + element.parentNode.cellIndex);*/
                var x = document.getElementById("customers").rows[element.parentNode.parentNode.rowIndex].cells[0].innerText;
                        location.href = direccionweb + 'estudiante.jsp?id=' + x;
                }
                
                function  getDocente(element, direccionweb) {
                /*alert("row" + element.parentNode.parentNode.rowIndex +
                 " - column" + element.parentNode.cellIndex);*/
                var x = document.getElementById("docentes").rows[element.parentNode.parentNode.rowIndex].cells[0].innerText;
                        location.href = direccionweb + 'informaciondocente.jsp?id=' + x;
                }

        function  getIdDeportes(element, direccionweb) {
        /*alert("row" + element.parentNode.parentNode.rowIndex +
         " - column" + element.parentNode.cellIndex);*/
        var x = document.getElementById("Deportes").rows[element.parentNode.parentNode.rowIndex].cells[1].innerText;
                location.href = direccionweb + 'deporte.jsp?deporte=' + x;
        }

    </script>

</div>
<!--==============================Fin codigo tabla de usuarios================================-->


<!--==============================Inicio codigo insertar por menu a segundo acudiente================================-->
<div id="Acudiente" style="display: none;">

    <form id="estudiante" action="insertarsegundoacudiente" method="post">
        <center>
            <h1>Ingresar segundo acudiente</h1>
            <br>
            <br>
            <label>Identificacion del estudainte </label> 
            <input id="idacu1" type="text" name="identificacion_estudiante" onclick="valueOf('')" onkeypress="return SoloN(event)" minlength="10" maxlength=11 placeholder="Tarjeta de identidad" required="">  
            <br>
            <br>
            <label>Identificacion acudiente: </label><input id="identificacion_acudiente" type="text" name="identificacion_acudiente" onclick="valueOf('')" onkeypress="return SoloN(event)" minlength="10" maxlength=11 required="" placeholder="Cc">   
            <br>
            <br>
            <label>Nombre acudiente: </label><input id="NAcudiente" type="text" name="NAcudiente" onclick="valueOf('')"  placeholder="Nombres">   
            <br>
            <br>
            <label>Apellido acudiente: </label><input id="AAcudiente" type="text" name="Aacudiente" onclick="valueOf('')" placeholder="Apellidos">   
            <br>
            <br>
            Parentesco: 
            <select name="Seleccione_parentesco">
                <option> Seleccione parentesco</option>
                <option> Padre</option>
                <option>Madre</option>
                <option>Tio</option>
                <option>Tia</option>
                <option>Vecina</option>
                <option>Vecino</option>
                <option>Hermano</option>
                <option>Hermana</option>
            </select>
            <br>
            <br>
            <label>Telefono: </label><input id="Telefono" type="text" name="Telefono" onclick="valueOf('')"  onkeypress="return SoloN(event)" maxlength="7" placeholder="Telefono de la residencia">   
            <br>
            <br>
            <label>Celular: </label><input id="celular" type="text" name="Celular" onclick="valueOf('')"  maxlength="10"  onkeypress="return SoloN(event)" >   
            <br>
            <br>
            <label>Direccion: </label><input id="Direccion" type="text" name="Direccion" onclick="valueOf('')">   
            <br>
            <br>
            <input type="submit" id="submit" value="Registrar">
        </center>
    </form>
</div>
<!--==============================Fin codigo insertar por menu a segundo acudiente================================-->


<!--==============================Inicio codigo insertar un nuevo deporte================================-->
<div id="Deportes-insertar">
    <center>
        <form id="estudiante" action="deporte" method="post">
            <h1>Creacion de nuevo deporte</h1>
            <%
                String codigo = "";
                Random rm = new Random();
                for (int i = 0; i < 5; i++) {
                    codigo += rm.nextInt(10);
                }
            %>

            <label> Codigo del nuevo deporte:</label><br><br>
            <input id="codigo" name="codigo" type="text" value="<%=codigo%>" placeholder="<%=codigo%>" readonly="" style="background: #dddddd;"><br><br>
            <label> Nombre del nuevo deporte:</label><br><br>
            <input id="deporte" name="deporte" type="text" placeholder="Nombre del nuevo deporte" required=""><br><br>
            <input type="submit" id="submit" value="Crear">
        </form>
    </center>
</div>
<!--==============================Fin del codigo insertar un nuevo deporte================================-->

<!--==============================Inicio del codigo ver deportes================================-->
<center>
    <style>


        #Deportes td,#Deportes th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #Deportes tr:nth-child(even){background-color: #f2f2f2;}

        #Deportes tr:hover {background-color: #ddd;}

        #Deportes th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #009231;
            color: white;
        }

        #buscar{
            width: 300px;
            font-size: 22px;
            color: #fff;
            background: #009231 ;
            padding-left: 20px ;
            text-align: center;
            border-radius: 5px;
            padding: 10px;
            margin:10px; 
        }
    </style>
    <div id="tabladeportes" style="display: none;">
        <center>
            <h1>Deportes</h1>
            <div class="derecha" id="buscar">Buscar <input type="search" class="light-table-filter" data-table="order-table" placeholder="Filtro"></div>
            <div class="datagrid">
                <table class="order-table table" id="Deportes">
                    <thead>
                        <tr class="titulo"> 
                            <th>    Codigo deporte  </th>
                            <th>    Nombre  </th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String Deportes[][] = con.Ver_deportes();
                            for (int j = 0; j < cuantos; j++) {
                        %>
                        <tr>    
                            <td align="center"><a><%= Deportes[0][j]%></a></td>
                            <td align="center"><a><%= Deportes[1][j]%></a></td>
                            <td align="center"> 
                                <img style="" src="imagenes/ojo.png" width="30" height="30" onclick="getIdDeportes(this, 'ver')">
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
<!--==============================Fin del codigo ver deportes================================-->

<!--==============================Inicio del codigo para asignar horario================================-->
<div id="asignar-hora" style="display: none;">
    <center>
        <form id="estudiante" action="asignarhorario" method="post">
            <h1>Asignacion de horarios</h1><br><br>
            <label>Seleccione un deporte:</label><br><br>
            <select id="deportes" name="deportes">
                <% for (int i = 0; i < cuantos; i++) {%>
                <option> <%=DD[i]%></option>
                <% }%>
            </select><br><br>
            <label>Seleccione una categoria:</label><br><br>
            <select id="categoria" name="categoria">
                <%
                    String categoria[] = con.Ver_categorias();
                    for (int i = 0; i < categoria.length; i++) {%>
                <option> <%=categoria[i]%></option>
                <% }%>
            </select><br><br>
            <label>Seleccione un horario:</label><br><br>
            <select id="horario" name="horario">
                <% String horario[] = con.Ver_horarios();
                    for (int i = 0; i < horario.length; i++) {%>
                <option> <%=horario[i]%></option>
                <% }%>
            </select><br><br>
            <input type="submit" value="Asignar" id="submit">

        </form>
    </center>
</div>
<!--==============================Inicio del codigo para asignar horario================================-->
</body>


<script>
            /*
             * Con esta funcion capturamos los datos a tiempo real
             * de la fecha de nacimiento y deporte
             * para luego devolver una lista de los horarios asignados
             * segundo el deporte y la ceha de nacimiento (Categoria)
             * si no hay un valor asociado con estos terminos
             * "No devolvera nada"
             */
                    function myFunction(Deporte, Fehca) {
                            var edad = getEdad(Fehca);
                            console.log(edad);
                            fetch('Registros/Deportes/' + Deporte + '/Sub' + edad + '/Informacion.txt')
                            .then(res => res.text())
                            .then(content => {
                            let lines = content.split(/\n/);
                                    let tamaño = content.split(/\n/).length;
                                    console.log(tamaño);
                                    console.log(content.split(/\n/)[0]);
                                    lines.forEach(line => console.log(line));
                                    var campo_dia = document.getElementById('Horario');
                                    for (var j = 0; j < tamaño; j++){
                            campo_dia.options[j] = new Option(content.split(/\n/)[j]); // texto-valor
                            }
                            });
                    }
            /*
             * Con esta funcion calculamos la edad(categoria)
             * recibe la fecha de nacimiento del estudiante
             * y creamos una variable fehca hoy; lo que devuelve la fecha actual
             * y se procede a realizar una resta de fechas
             */
            function getEdad(dateString) {
            var hoy = new Date()
                    var fechaNacimiento = new Date(dateString)
                    var edad = hoy.getFullYear() - fechaNacimiento.getFullYear()
                    var diferenciaMeses = hoy.getMonth() - fechaNacimiento.getMonth()
                    if (
                            diferenciaMeses < 0 ||
                            (diferenciaMeses === 0 && hoy.getDate() < fechaNacimiento.getDate())
                            ) {
            edad--
            }
            return edad+1;
            }

</script>




<!------------------------------- Codigo html para el menu profesor -->

<%--Asignar deporte y horario a un profesor--%>
           
            <div id="profesor_deporte-contend" style="display: none;">
                   
        <form id="estudiante" action="profesordeporte" method="post">
            <center>
            <h1>Asignar deporte a profesor</h1>
            <label>Id Entrenador: </label><input id="entrenador_id" type="text" name="entrenador_id" onclick="valueOf('')" required="" onkeypress="return SoloN(event)" minlength="10" maxlength="11" placeholder="entrenador_id">   
            <br>
            <br>
            <label>Deporte: </label>
            <select id="Sdeporte" name="Sdeporte" onblur="vercategorias(this.value)">
                <%-- Creamos un objeto conexion para que nos devuelva cuantos deportes hya y cuales son--%>
                <% for (int i = 0; i < cuantos; i++) {%>
                <option> <%=DD[i]%></option>
                <% }%>
            </select>
            <br>
            <br>
            
            <label>Categoria</label>
            <select id="Categorias" name="Categorias" onblur="verhorarios(Sdeporte.value,this.value)">
                <option>Primero seleccione un deporte</option>
            </select>
            <br>
            <br>
            
            <label>Categoria</label>
            <select id="hora" name="hora">
                <option>Seleccione primero un deporte y una categoria</option>
            </select>
            <br>
            <br>
            <input type="submit" id="submit" value="Asignar">
        </form>
        
        </center>
        <br>
        <br>
    </div>
            
            <script>
            
                    function vercategorias(Deporte) {
                    alert("Input field lost focus." + Deporte);
                            fetch('Registros/Deportes/' + Deporte + '/categorias.txt')
                            .then(res => res.text())
                            .then(content => {
                            let lines = content.split(/\n/);
                                    let tamaño = content.split(/\n/).length;
                                    console.log(content.split(/\n/)[0]);
                                    lines.forEach(line => console.log(line));
                                    var campo_dia = document.getElementById('Categorias');
                                    for (var j = 0; j < tamaño; j++){
                            campo_dia.options[j] = new Option(content.split(/\n/)[j]); // texto-valor
                            }
                            });
                    }
                    function verhorarios(Deporte,categoria) {
                    alert("Input field lost focus." + Deporte+categoria);
                            fetch('Registros/Deportes/' + Deporte +'/' +categoria+'/Informacion.txt')
                            .then(res => res.text())
                            .then(content => {
                            let lines = content.split(/\n/);
                                    let tamaño = content.split(/\n/).length;
                                    console.log(tamaño);
                                    console.log(content.split(/\n/)[0]);
                                    lines.forEach(line => console.log(line));
                                    var campo_horarios = document.getElementById('hora');
                                    for (var j = 0; j < tamaño; j++){
                            campo_horarios.options[j] = new Option(content.split(/\n/)[j]); // texto-valor
                            }
                            });
                    }
                    
                    function cerrar() {
                    window.location.replace('index.jsp');
                }

</script>
<%-- ver docentes--%>
<center>
        <div id="Ver_Docente" style="display: none;">
            <center>
                <h1>Ver profesor</h1>
                <div class="derecha" id="buscar">Buscar <input type="search" class="light-table-filter" data-table="order-table" placeholder="Filtro"></div>


                <div class="datagrid">
                    <table class="order-table table" id="docentes">
                        <thead>
                            <tr class="titulo"> 
                                <th>    Identificacion  </th>
                                <th>    Nombre </th>
                                <th>    Apellido </th>
                                <th>    Telefono </th>
                                <th>    Celular </th>
                               <!--  <th>    Codigo de matricula </th>
                                <th>    Deporte </th> -->
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                String profesor[][] = con.Profesores();
                                for (int i = 0; i < con.Cuantos_profesores(); i++) {
                            %>
                            <tr>    
                                <td align="center"><a><%= profesor[0][i]%></a></td>
                                <td align="center"><a><%= profesor[1][i]%></a></td>
                                <td align="center"><a><%= profesor[2][i]%></a></td>
                                <td align="center"><a><%= profesor[3][i]%></a></td>
                                <td align="center"><a><%= profesor[4][i]%></a></td>
                             
                                <td align="center"> 
                                    <img style="" src="imagenes/ojo.png" width="30" height="30" onclick="getDocente(this, 'ver')">
                                </td>
                            </tr>
                            <%
                                }
                            %>

                                <br>
                                <br>
                              
                                <br>
                                <br>
                        </tbody>
                    </table>
                </div>
            </center>
        </div>
    </center>
                            
                            
                            <center>
                                <div id="Insertardocente" style="display: none">
                                    <form id="estudiante" action="insertardocente" method="post">
                                        <center>
                                            <h1>Insertar nuevo docente</h1>
                                            <br>
                                            <br>
                                            <label>Identificacion: </label> 
                                            <input id="Id-docente" type="text" name="Id-docente" onclick="valueOf('')" onkeypress="return SoloN(event)" minlength="10" maxlength=11 placeholder="Tarjeta de identidad" required="">  
                                            <br>
                                            <br>
                                            <label>Nombre: </label><input id="Nombre" type="text" name="Nombre" onclick="valueOf('')"  placeholder="Nombres">   
                                            <br>
                                            <br>
                                            <label>Apellido: </label><input id="Apellido" type="text" name="Apellido" onclick="valueOf('')" placeholder="Apellidos">   
                                            <br>
                                            <br>
                                            <label>Telefono: </label><input id="Telefono" type="text" name="Telefono" onclick="valueOf('')"  onkeypress="return SoloN(event)" maxlength="7" placeholder="Telefono de la residencia">   
                                            <br>
                                            <br>
                                            <label>Celular: </label><input id="celular" type="text" name="Celular" onclick="valueOf('')"  maxlength="10"  onkeypress="return SoloN(event)" >   
                                            <br>
                                            <br>
                                            <label>Correro electronico:</label><input id="email" type="email" name="email">
                                            <br>
                                            <br>
                                            <input type="submit" id="submit" value="Registrar">
                                        </center>
                                    </form>
                                </div>
                            </center>
            
<!--  finde codigo para docentes -->

<%-- Comienzo de registros--%>
    <center>
        <!--  Certificados -->
        <div>

        </div>
        
        <!--  Lista de estudiantes -->
        <div>

        </div>
        
        <!--  Lista de estudiantes por deporte -->
        <div>

        </div>
        
        <!--  Certificados -->
        <div>

        </div>
        
        <!--  Certificados -->
        <div>

        </div>
        
        <!--  Certificados -->
        <div>

        </div>
        
        <!--  Certificados -->
        <div>

        </div>
    </center>
<%-- Fin de registros egistros--%>
</html>
