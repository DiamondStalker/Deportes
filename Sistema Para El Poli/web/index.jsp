<%-- 
    Document   : index
    Created on : 17-jul-2019, 18:38:58
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Sing in</title>
        <meta charset="utf-8">
        <link rel="icon"    href="imagenes/escudo.jpg">
        <link rel="stylesheet" type="text/css" media="screen" href="css/style.css">
        <script src="js/jquery.easing.1.3.js"></script>
        
        <!--[if lt IE 9]>
        <script src="js/html5.js"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="css/ie.css">
        <![endif]-->

        <script type="text/javascript">
            function reFresh()
                    location.reload(true)
        }
        /* Establece el tiempo 1 minuto = 60000 milliseconds. */
        window.setInterval("reFresh()", 300000);
// -->
        </script>
    <body>
    </head>
    <section >
        <!--==============================FORM=================================-->
        <center>
            <a onclick="javascript:window.location.reload();"> <img src="imagenes/refresh.gif" alt=""></a>
        </center> 
        <br>
        <br>

        <form action="Loggin" id="loggin" method="post" >
            <h2 id="TituloLoggin">Login</h2>
            <label>User name</label><input id="User"autocomplete="on" placeholder="ejemplo@dominio.com" type="email" name="Correo" onclick="valueOf('')" required="">
            <br>
            <br>
            <label>Password</label><input id="Password" autocomplete="on"  placeholder="********" type="password" name="Contrasena" required="">
            <br>
            <br>
            <br>
            <input type="submit" value="Login" name="ingresar">
        </form>  

        <br><br>                        
        <!--==============================FORM=================================-->
    </section>
    <!--==============================footer=================================-->
    <footer>
        <p>© 2020 DiamondStalker<br>
    </footer>
</body>
</html>
