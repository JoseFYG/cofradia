<%@page import="java.sql.*"%>
<%@page import="Utils.Encriptar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" >
        <title>Usuario</title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();

            if (sesion.getAttribute("logeado") == null || sesion.getAttribute("logeado").equals("0")) {
                response.sendRedirect("../index.jsp");
            }

            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            Encriptar enc = new Encriptar();
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form action="../usuario/datosUsuario.jsp" method="post">
                        <div class="form-group">
                            <label>User</label>
                            <input type="text" class="form-control" name="user" placeholder="User" value="<%=session.getAttribute("user")%>">
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="text" class="form-control" name="password1" placeholder="Password">
                        </div>
                        <div class="form-group">
                            <label>Repita su password</label>
                            <input type="text" class="form-control" name="password2" placeholder="Repita su password">
                        </div>
                        <button type="submit" class="btn btn-primary" name="guardar">Guardar</button>
                        <a href="../hermanos/index.jsp" class="btn btn-danger">Cancelar</a>
                    </form>
                </div>
            </div>
        </div>
    </body>
    <%
        if (request.getParameter("guardar") != null) {
            String user = request.getParameter("user");
            String password1 = request.getParameter("password1");
            String password2 = request.getParameter("password2");

            if (password1.equals(password2)) {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/javaweb?user=javaweb&password=javaweb");
                    st = con.createStatement();
                    st.execute("UPDATE user SET user = '" + user + "', password = '" + enc.getMD5(password1) + "' WHERE id = '" + sesion.getAttribute("id") + "';");
                    sesion.setAttribute("user", user);
                    response.sendRedirect("../hermanos/index.jsp");
                } catch (Exception e) {
                    out.print(e);
                }
            } else {
                out.print("Password no coincide");
            }
        }
    %>
</html>
