<%@page import="java.sql.*"%>
<%@page import="Utils.Encriptar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../plantillas/utilidades.jsp" %>
    </head>
    <body style="background-color: #F39237;">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg sticky-top bg-dark text-light navbar-light">
            <div class="container">
                <a class="navbar-brand" href="#" style="color: white;"><i class="fa-solid fa-church pe-2"></i>Cofradia</a>
                <button
                    class="navbar-toggler"
                    type="button"
                    data-mdb-toggle="collapse"
                    data-mdb-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <i class="fas fa-bars"></i>
                </button>
            </div>
        </nav>
        <!-- Navbar -->
        <title>Cofradía</title>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form method="post" action="index.jsp">
                        <div class="form-group">
                            <label>Usuario</label>
                            <input type="text" class="form-control" name="usuario" placeholder="Humano pon tu usuario">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password" placeholder="Humano pon tu password">
                        </div>
                        <button type="submit" class="btn btn-primary" name="login">Login</button>
                        <%
                            Connection con = null;
                            Statement st = null;
                            Statement st1 = null;
                            ResultSet rs = null;
                            ResultSet rs1 = null;
                            Encriptar enc = new Encriptar();

                            if (request.getParameter("login") != null) {
                                String usuario = request.getParameter("usuario");
                                String contraseña = request.getParameter("password");

                                HttpSession sesion = request.getSession();
                                sesion.setAttribute("mensaje", "");

                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    con = DriverManager.getConnection("jdbc:mysql://localhost/cofradia?user=javaweb&password=javaweb");
                                    st = con.createStatement();
                                    rs = st.executeQuery("SELECT * FROM usuarios WHERE usuario = '" + usuario + "' AND contraseña = '" + enc.getMD5(contraseña) + "';");
                                    while (rs.next()) {
                                        sesion.setAttribute("usuario", rs.getString("usuario"));
                                        sesion.setAttribute("CIF", rs.getString("CIF"));

                                        st1 = con.createStatement();
                                        rs1 = st1.executeQuery("SELECT * FROM hermandades WHERE CIF = '" + rs.getString("CIF") + "';");
                                        while (rs1.next()) {
                                            sesion.setAttribute("logeado", "1");
                                            sesion.setAttribute("hermandad", rs1.getString("hermandad"));
                                            if (rs1.getString("activo").equalsIgnoreCase("SI")) {
                                                response.sendRedirect("hermanos/index.jsp");
                                            }
                                        }
                                    }
                        %>

                        <%
                                } catch (Exception e) {
                                    out.print(e);
                                }
                            }
                        %>
                    </form>
                </div>
            </div>
        </div>
        <footer class="bg-body-tertiary fixed-bottom text-center text-lg-start">
            <!-- Copyright -->
            <div class="bg-dark text-light text-center p-3">
                <b>Copyright © 2024</b> | Todos los derechos reservados.
            </div>
            <!-- Copyright -->
        </footer>
    </body>
</html>
<!--<!-- INSERT INTO hermanos (nombre, direccion, telefono) values ('" + nombre + "', '" + direccion + "', '" + telefono + "'); -->