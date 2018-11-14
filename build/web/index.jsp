
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.ArrayList, Modelo.*"  %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Catalogo</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String usuario;
            String nivel;
            
            if(sesion.getAttribute("user")!= null && sesion.getAttribute("nivel")!= null){
                usuario = sesion.getAttribute("user").toString();
                nivel = sesion.getAttribute("nivel").toString();
            }else{
                out.print("<script>location.replace('login.jsp');</script>");
            }
            %>
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

        <h1 align="center">Catalogo de Productos</h1>

        <table border="0" width="700" align="center">

            <%--Metodo que permite traer los productos, los trae en un Array y los guarda en un Array--%>

            <%
                ArrayList<Productos> lista = ProductoDB.obtenerProductos();
                int salto = 0;
                for (int i = 0; i < lista.size(); i++) {
                    Productos p = lista.get(i);
            %>
            <th><img src="imagenes/<%=p.getImagen()%>" width="150px"><br>
                <%=p.getNombre()%><br>
                <%=p.getPrecio()%><br>
                <a href="modificarProducto.jsp?id=<%= p.getCodigoProducto()%>">Modificar</a>
            </th>
            <%--Con esta variable llamada salto hacemos que cada 3 productos salte de linea--%>

            <%
                salto++;
                if (salto == 3) {
            %>
            <tr>
                <%
                            salto = 0;
                        }
                    }
                %>
        </table>
    </body>
</html>
