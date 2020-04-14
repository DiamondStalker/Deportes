<%@page import="javax.swing.JOptionPane"%>
<%@page import="Metodos.Fechas"%>
<%@page import="conexion.conectar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrador</title>
        <link rel="icon"    href="imagenes/escudo.jpg">
        <link rel="stylesheet" type="text/css" media="screen" href="css/styleadminestudiantes.css">
        <script src="js/jquery.easing.1.3.js"></script>
        <script  src = "http://code.jquery.com/jquery-1.11.0.min.js"></script> 

        <%-- Scrip para hacer menu desplejable--%>
        <script>
            //Script para desplegar los dos submenus de matricular estudiante
            $(function () {
                $('#ingresare').click(function () {
                    $(this).next('#estudiante-content').slideToggle();
                    $(this).toggleClass('active');
                });
            });
            // Menu para ingresar al segundo acudiente

            $(function () {
                $('#Si').click(function () {
                    $(this).next('#Acudiente-contend').slideToggle();
                    $(this).toggleClass('active');
                });
            });

            //Profesor
            $(function () {
                $('#ingresarp').click(function () {
                    $(this).next('#profesor-content').slideToggle();
                    $(this).toggleClass('active');
                });
            });
            //Menu desplegable de ver
            $(function () {
                $('#Ver').click(function () {
                    $(this).next('#ver-content').slideToggle();
                    $(this).toggleClass('active');
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
                window.onload = function () {/*hace que se cargue la función lo que predetermina que div estará oculto hasta llamar a la función nuevamente*/
            muestra_oculta('contenido');/* "contenido_a_mostrar" es el nombre que le dimos al DIV */
            }

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
            <%--Ingresar Estudiante --%>
            <li>
                <a id="ingresare" href="#">Ingresar Estudiante</a>
                <div id="estudiante-content">

                    <%-- Ingresar Usuario Con Archivo--%>
                    <form id="estudiante" action="UploadServlet" method="post" enctype="multipart/form-data" target="_blank">
                        <input type="file" name="ArchivoExcell" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, .xlsx, .xlsm, .xls">
                        <input type="submit" value="Enviar datos">
                    </form>


                    <%-- Ingresar Usuario Manualmente--%>
                    
                        <label>Identificacion: </label><input id="ides" type="text" name="ides" onclick="valueOf('')" required="" onkeypress="return SoloN(event)" maxlength="11">   
                        <br>
                        <br>
                        <label id="Textonombre">Nombre del estudiante: </label><input id="NEstudiante" type="text" name="NombreEstudiante" onclick="valueOf('')" required="">   
                        <br>
                        <br>
                        <label>Apellido del estudiante: </label><input id="AEstudiante" type="text" name="ApellidoEstudiante" onclick="valueOf('')" required="">   
                        <br>
                        <br>
                        <label>Fecha de nacimiento: </label> <input id="Fechan" type="date" name="Fechan" onclick="valueOf('')" required="">   
                        <br>
                        <br>
                        Deporte:
                        <select id="Sdeporte" name="Sdeporte">
                            <option>Seleccione un deporte</option>
                            <option value="Futbol">Futbol</option>
                            <option>Baloncesto</option>
                            <option>Natacion</option>
                            <option>Tenis</option>
                            <option>Gimnasia</option>
                            <option>Patinaje</option>
                            <option>Artes marciales</option>
                            <option>Beisbol</option>

                        </select>
                        
                        <select>
                            <%conectar con = new conectar();  
                        String DD[] = con.Deportes();%>
                        
                        <% for(int i=0;i<4;i++){%>
                        <option> <%=DD[i]%></option>
                        <% }%>
                        
                            
                        </select>
                        
                        
                        
                        <br>
                        <br>
                         Horario:
                        <select id="Horario" name="horario">
                            <option>Seleccione un horario</option>
                            <option> Sabados 6-8</option>
                        </select>
                        <br>
                        <br>
                        <label>Identificacion acudiente: </label><input id="idacu1" type="text" name="idacu1" onclick="valueOf('')" required="" onkeypress="return SoloN(event)" maxlength=11>   
                        <br>
                        <br>
                        <label>Nombre acudiente: </label><input id="NAcudiente" type="text" name="NAcudiente" onclick="valueOf('')" required="">   
                        <br>
                        <br>
                        <label>Apellido acudiente: </label><input id="AAcudiente" type="text" name="aAcudiente" onclick="valueOf('')" required="">   
                        <br>
                        <br>
                        <label>Telefono: </label><input id="Telefono" type="text" name="Telefono" onclick="valueOf('')"  onkeypress="return SoloN(event)" maxlength="7">   
                        <br>
                        <br>
                        <label>Celular: </label><input id="celular" type="text" name="celular" onclick="valueOf('')" required="" maxlength="10"  onkeypress="return SoloN(event)">   
                        <br>
                        <br>
                        <label>Direccion: </label><input id="Direccion" type="text" name="Direccion" onclick="valueOf('')" required="" maxlength="10"  onkeypress="return SoloN(event)">   
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
                            <label>Identificacion acudiente: </label><input id="idacu1" type="text" name="idacu12" onclick="valueOf('')" onkeypress="return SoloN(event)" maxlength=11>   
                            <br>
                            <br>
                            <label>Nombre acudiente: </label><input id="NAcudiente" type="text" name="NAcudiente2" onclick="valueOf('')" >   
                            <br>
                            <br>
                            <label>Apellido acudiente: </label><input id="AAcudiente" type="text" name="aAcudiente2" onclick="valueOf('')" >   
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
                            <label>Telefono: </label><input id="Telefono" type="text" name="Telefono2" onclick="valueOf('')"  onkeypress="return SoloN(event)" maxlength="7">   
                            <br>
                            <br>
                            <label>Celular: </label><input id="celular" type="text" name="celular2" onclick="valueOf('')"  maxlength="10"  onkeypress="return SoloN(event)">   
                            <br>
                            <br>
                            <label>Direccion: </label><input id="Direccion" type="text" name="Direccion2" onclick="valueOf('')"  maxlength="10"  onkeypress="return SoloN(event)">   
                            <br>
                            <br>
                        </div>

                        <br>
                        <br>
                        <input type="submit" id="submit" value="Login">
                    

                </div>    
            </li>
            <%--Ingresar Profesor--%>
            <li>
                <a id="ingresarp" href="#">Ingresar Profesor</a>
                <div id="profesor-content">
                    <form id="estudiante">
                        <label>Identificacion: </label><input id="ides" type="text" name="ides" onclick="valueOf('')">   
                        <br>
                        <br>
                        <label id="Textonombre">Nombre del estudiante: </label><input id="NEstudiante" type="text" name="NombreEstudiante" onclick="valueOf('')">   
                        <br>
                        <br>
                        <label>Apellido del estudiante: </label><input id="AEstudiante" type="text" name="AombreEstudiante" onclick="valueOf('')">   
                        <br>
                        <br>
                        <label>Fecha de nacimiento: </label> <input id="Fechan" type="date" name="Fechan" onclick="valueOf('')">   
                        <br>
                        <br>
                    </form>
                </div>

            </li>

            <%-- Menu que desea ver--%>
            <li>
                <a id="Ver" href="#">Administrar</a>
                <div id="ver-content">
                    <a id="VerEstudiantes" href="VerEstudiantes">Ver Estudiantes</a>
                    <br>
                    <br>
                    <a id="VerProfesores" href="VerProfesores">Ver Profesores</a>
                    <br>
                    <br>
                </div>

            </li>
        </ul>
    </nav>

</body>
</html>
