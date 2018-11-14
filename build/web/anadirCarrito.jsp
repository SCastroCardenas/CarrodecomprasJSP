

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>

<%-- Este fragmento de código nos permite llamar la funcion obtener producto, que trae los datos desde
un procedimiento almacenado en MySQL--%>

<%
    Productos p = ProductoDB.obtenerProducto(Integer.parseInt(request.getParameter("id")));
    HttpSession sesion = request.getSession();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h3>
            <table border="1" width="1000" align="center">
                <tr bgcolor="skyblue">
                    <th><a href="indexUser.jsp">Catálogo</a></th>
                    <th><a href="carrito.jsp">Carro de compras</a></th>
                    <th><a href="login.jsp?cerrar=true">Cerrar Sesión</a></th>
                    <th width="200"><%= sesion.getAttribute("user").toString()%></th>
                </tr>
            </table>
        </h3>

        <h2 align="center">Añadir producto al carrito</h2>

        <table border="0" width="500" align="center">
            <form method="post" action="ServletAgregarCarrito">
                <tr>
                    <th rowspan="5"><img src="imagenes/<%= p.getImagen()%>" width="120px"</th>
                    <th>Código</th>
                    <th><input type="text" name="txtCodigo" value="<%= p.getCodigoProducto()%>" readonly></th>
                </tr>
                <tr>
                    <th>Nombre</th>
                    <th><input type="text" name="txtNombre" value="<%= p.getNombre()%>" readonly></th>
                </tr>
                <tr>
                    <th>Precio</th>
                    <th><input type="text" name="txtPrecio" value="<%= p.getPrecio()%>" readonly></th>
                </tr>
                <tr>
                    <th>Cantidad</th>
                    <th><input type="number" value="0" min="0" name="txtCantidad"></th>
                </tr>
                <tr>
                    <th colspan="3"><input type="submit" value="Añadir" name="btnAnadir"></th>
                </tr>
                <input type="hidden" name="codigoProducto" value="<%= p.getCodigoProducto()%>"  />
            </form>
        </table>


    </body>
</html>
