<%@page import="javax.swing.JOptionPane"%>
<%@page import="Metodos.Fechas"%>
<%@page import="conexion.Conectar"%>
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
        <script src="Js/Menu.js"></script>
        <%-- Scrip para hacer menu desplejable--%>
        <script>


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
            }
            /* Establece el tiempo 1 minuto = 60000 milliseconds. */
            window.setInterval("reFresh()", 300000);

        </script>

    </head>
    
    
    <body>

    <center>
        <a onclick="javascript:window.location.reload();"> <img src="imagenes/refresh.gif" alt=""></a>
    </center> 

    <br>
    <br>

    <nav class="acceder">

        <ul>

            <li>Hola
                <ul>
                    <li>fds</li>
                </ul>
            </li>


            <li>2</li>
            <li>3</li>
        </ul>

        <ul>
            <%--Ingresar Estudiante --%>
            <li>
                <a id="ingresare" href="#"onClick="muestra_oculta('OpcionEstudiante')">Estudiantes</a>
                <div id="OpcionEstudiante">
                    <a id="ingresare" href="#"onClick="muestra_oculta('estudiante-content')">Ingresar Estudiante</a>
                    <a id="ingresare" href="#"onClick="muestra_oculta('estudiante-content')">Ingresar Estudiante</a>
                    <a id="ingresare" href="#"onClick="muestra_oculta('estudiante-content')">Ingresar Estudiante</a>
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


            <li>
                <a id="Prueba" href="#" onClick="muestra_oculta('prueba-content')" >Prueba</a>
                <div id="prueba-content">
                    <a id="VerEstudiantes" href="#" onClick="muestra_oculta('contenido')">Ver Estudiantes</a>
                    <br>
                    <br>
                    <a id="VerProfesores" href="VerProfesores">Ver Profesores</a>
                    <br>
                    <br>
                </div>

            </li>

    </nav>




    <%-- Inicio de codigo para insertar estudiante--%>

    <div id="estudiante-content">

        <%-- Ingresar Usuario Con Archivo--%>
        <form id="estudiante" action="UploadServlet" method="post" enctype="multipart/form-data" target="_blank">
            <input type="file" name="ArchivoExcell" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, .xlsx, .xlsm, .xls">
            <input type="submit" value="Enviar datos">
        </form>


        <%-- Ingresar Usuario Manualmente--%>
        <form id="estudiante" action="InsertarUsuario" method="post">
            <label>Identificacion: </label><input id="ides" type="text" name="ides" onclick="valueOf('')" required="" onkeypress="return SoloN(event)" minlength="10" maxlength="11">   
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
            <%-- 
                Valores quemados
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
            --%>
            <select id="Sdeporte" name="Sdeporte">
                <%-- Creamos un objeto conexion para que nos devuelva cuantos deportes hya y cuales son--%>
                <%Conectar con = new Conectar();
                    String DD[] = con.deportes();
                    int cuantos = con.cuantosDeportes();%>

                <% for (int i = 0; i < cuantos; i++) {%>
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
            <label>Identificacion acudiente: </label><input id="idacu1" type="text" name="idacu1" onclick="valueOf('')" required="" onkeypress="return SoloN(event)" minlength="11" maxlength=11>   
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
            <label>Direccion: </label><input id="Direccion" type="text" name="Direccion" onclick="valueOf('')" required="">   
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
                <label>Identificacion acudiente: </label><input id="idacu1" type="text" name="idacu12" onclick="valueOf('')" onkeypress="return SoloN(event)" minlength="11" maxlength=11>   
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
                <label>Direccion: </label><input id="Direccion" type="text" name="Direccion2" onclick="valueOf('')">   
                <br>
                <br>
            </div>

            <br>
            <br>
            <input type="submit" id="submit" value="Matricular">
        </form>

    </div>  

    <%-- Fin de codigo para insertar estudiante--%>

</body>


<%-- Prueba menu--%>
<body>
		<div id="accordian">
			<ul>
				<li class="active">
					<h3><a href="#"><span class="icon-dashboard"></span>Dashboard</a></h3>
					<ul style="display: block;">
						<li><a href="#">Reports</a></li>
						<li><a href="#">Search</a></li>
						<li><a href="#">Graphs</a></li>
						<li><a href="#">Settings</a></li>
					</ul>
				</li>
				<li class="">
					<h3><a href="#"><span class="icon-tasks"></span>Tasks</a></h3>
					<ul style="display: none;">
						<li><a href="#">Today's tasks</a></li>
						<li class="">
							<a href="#">DrillDown</a>
							<ul style="display: none;">
								<li><a href="#">Today's tasks</a></li>
								<li><a href="#">Urgent</a></li>
								<li>
									<a href="#">Overdues</a>
									<ul>
										<li><a href="#">Today's tasks</a></li>
										<li><a href="#">Urgent</a></li>
										<li><a href="#">Overdues</a></li>
										<li><a href="#">Recurring</a></li>
										<li><a href="#">Settings</a></li>
									</ul>
								</li>
								<li><a href="#">Recurring</a></li>
								<li><a href="#">Settings</a></li>
							</ul>
						</li>
						<li>
							<a href="#">Overdues</a>
							<ul>
								<li><a href="#">Today's tasks</a></li>
								<li><a href="#">Urgent</a></li>
								<li><a href="#">Overdues</a></li>
								<li><a href="#">Recurring</a></li>
								<li><a href="#">Settings</a></li>
							</ul>
						</li>
						<li><a href="#">Recurring</a></li>
						<li><a href="#">Settings</a></li>
					</ul>
				</li>
				<li>
					<h3><a href="#"><span class="icon-calendar"></span>Calendar</a></h3>
					<ul>
						<li><a href="#">Current Month</a></li>
						<li><a href="#">Current Week</a></li>
						<li><a href="#">Previous Month</a></li>
						<li><a href="#">Previous Week</a></li>
						<li><a href="#">Next Month</a></li>
						<li><a href="#">Next Week</a></li>
						<li><a href="#">Team Calendar</a></li>
						<li><a href="#">Private Calendar</a></li>
						<li><a href="#">Settings</a></li>
					</ul>
				</li>
				<li>
					<h3><a href="#"><span class="icon-heart"></span>Favourites</a></h3>
					<ul>
						<li><a href="#">Global favs</a></li>
						<li><a href="#">My favs</a></li>
						<li><a href="#">Team favs</a></li>
						<li><a href="#">Settings</a></li>
					</ul>
				</li>
			</ul>
		</div>

		<script src="http://thecodeplayer.com/uploads/js/prefixfree-1.0.7.js" type="text/javascript"></script>
		<script src="http://thecodeplayer.com/uploads/js/jquery-1.7.1.min.js" type="text/javascript"></script>
		<script>
			$(document).ready(function(){
				$("#accordian a").click(function(){
					var link = $(this);
					var closest_ul = link.closest("ul");
					var parallel_active_links = closest_ul.find(".active")
					var closest_li = link.closest("li");
					var link_status = closest_li.hasClass("active");
					var count = 0;

					closest_ul.find("ul").slideUp(function(){
						if(++count == closest_ul.find("ul").length)
							parallel_active_links.removeClass("active");
					});

					if(!link_status)
					{
						closest_li.children("ul").slideDown();
						closest_li.addClass("active");
					}
				})
			})
		</script>
</body>
<%-- Prueba menu--%>



</html>
