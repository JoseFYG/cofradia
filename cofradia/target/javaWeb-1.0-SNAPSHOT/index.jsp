<%@page import="java.sql.*"%>
<%@page import="Utils.Encriptar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" >
        <title>Login</title>
    </head>
    <body>
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
    </body>
</html>
<!--<!-- INSERT INTO hermanos (nombre, direccion, telefono) values ('" + nombre + "', '" + direccion + "', '" + telefono + "'); -->