<%@page import="java.sql.*"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%@include file="../plantillas/variables.jsp" %>
        <%            
            try {
                st.execute("UPDATE hermanos SET activo = 'NO' WHERE id = '" + request.getParameter("id") + "';");
                //st.executeUpdate("DELETE FROM hermanos WHERE id = '" + request.getParameter("id") + "';");
                sesion.setAttribute("mensaje", "baja");
                request.getRequestDispatcher("../hermanos/index.jsp").forward(request, response);
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>
