<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();

            sesion.invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
