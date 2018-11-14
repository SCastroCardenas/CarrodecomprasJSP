

<%@page import="Modelo.ProductoDB"%>
<%@page import="Modelo.Productos"%>
<%@page import="Controlador.ServletAgregarCarrito"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Articulo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%-- Recuperamos la variable de sesion que trae los productos --%>
<%
    HttpSession sesion = request.getSession(true);
    ArrayList<Articulo> articulos = sesion.getAttribute("carrito") == null ? null : (ArrayList) sesion.getAttribute("carrito");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/carro.js"></script> 
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

        <h2 align="center">Carro de compras</h2>

        <table border="1" width="1000" align="center">
            <thead>
                <tr align="center">
                    <td>Item</td>
                    <td>Descripción</td>
                    <td>Precio</td>
                    <td>Cantidad</td>
                    <td>Total</td>
                </tr>
            </thead>

            <tbody>
                <%--Mostramos los productos seleccionados para el carrito de compras--%>
                <%
                    ServletAgregarCarrito ac = new ServletAgregarCarrito();
                    int total = 0;
                    if (articulos != null) {
                        for (Articulo a : articulos) {
                            Productos producto = ProductoDB.obtenerProducto(a.getCodigoProducto());
                            total += a.getCantidad() * producto.getPrecio();

                %>
                <tr align="center">
                    <td>
                        <a align="center"><img src="imagenes/<%= producto.getImagen()%>" width="100px"></a>

                    </td>
                    <td>
                        <a> <%= producto.getNombre()%></a><br>
                        <a> Código: <%= producto.getCodigoProducto()%></a>
                    </td>
                    <td>
                        <a>$<%= producto.getPrecio()%></a>
                    </td>
                    <td>
                        <a><%= a.getCantidad()%></a>
                    </td>
                    <td>
                        <a>$<%= Math.round(producto.getPrecio() * a.getCantidad())%></a>
                    </td>


                </tr>

                <% }
                } else {%>
            <h1 align="center"> No hay articulos en el carro</h1>


            <%}%>
            <tr align="center">
                <td colspan="5">
                    <a>El valor total de su compra es: $<%= total%></a>

                </td>

            </tr>
        </tbody>
    </table>
    <%-- Usamos el historial del usuario para devolverlo dos paginas atras --%>
    <h1 align="center"> <a  href="indexUser.jsp">Seguir Comprando</a></h1>

    <script src="js/carro.js"></script>




</body>
</html>
