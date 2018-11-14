<%-- 
    Document   : login
    Created on : 13/11/2018, 09:31:54 PM
    Author     : Sebastian Castro C
--%>

<%@page import="Modelo.UsuarioDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Iniciar Sesión</h1>

        <form action="login.jsp" method="post">
            Usuario: <input type="text" name="txtUsuario">
            Contraseña: <input type="text" name="txtContra">
            <input type="submit" name="btnIngresar" value="Ingresar">

        </form>

        <%
            UsuarioDB udb = new UsuarioDB();
            if (request.getParameter("btnIngresar") != null) {
                String nombre = request.getParameter("txtUsuario");
                String contra = request.getParameter("txtContra");
                HttpSession sesion = request.getSession();
                switch (udb.obtenerUsuario(nombre, contra)) {
                    case 1:
                        sesion.setAttribute("user", nombre);
                        sesion.setAttribute("nivel", "1");
                        response.sendRedirect("index.jsp");
                        break;

                    case 2:

                        sesion.setAttribute("user", nombre);
                        sesion.setAttribute("nivel", "1");
                        response.sendRedirect("indexUser.jsp");
                        break;
                        
                    default:
                        out.write("Usuario no existe, o contraseña inválida");
                        break;

                }
            }
            
            if(request.getParameter("cerrar") != null){
                session.invalidate();
            }
        %>
    </body>
</html>
