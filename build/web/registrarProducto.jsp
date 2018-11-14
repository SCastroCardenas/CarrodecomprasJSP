<%-- 
    Document   : registrarProducto
    Created on : 12/11/2018, 12:23:14 PM
    Author     : Sebastian Castro C
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    HttpSession sesion = request.getSession();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevos Productos</title>
    </head>
    <body>
        <h3>
            <table border="1" width="1000" align="center">
                <tr bgcolor="skyblue">
                    <th><a href="index.jsp">Catálogo</a></th>
                    <th><a href="registrarProducto.jsp">Registrar Productos</a></th>
                    <th><a href="">Ventas realizadas</a></th>
                    <th><a href="login.jsp?cerrar=true">Cerrar Sesión</a></th>
                    <th width="200"><%= sesion.getAttribute("user").toString()%></th>
                </tr>
            </table>
        </h3>
        <h1 align="center">Nuevos Productos</h1>
        <form action="ServletControlador">
            <table border="0" width="400" align="center">
                <tr>
                    <td>Nombre:</td>
                    <td><input type="text" name="txtNom"></td>
                </tr>
                <tr>
                    <td>Precio:</td>
                    <td><input type="text" name="txtPre"></td>
                </tr>
                <tr>
                    <td>Imagen:</td>
                    <td><input type="text" name="txtImg"></td>
                </tr>
                <tr>
                    <th colspan="2">
                        <input type="submit"  value="Registrar Producto" name="btn1">
                    </th>
                </tr>

            </table>
            <input type="hidden" name="accion" value="insertar">
        </form>
    </body>
</html>
