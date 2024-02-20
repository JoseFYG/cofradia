<%@include file="../plantillas/imports.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../plantillas/utilidades.jsp" %>
    </head>
    <body style="background-color: #F39237;">
        <%@include file="../plantillas/variables.jsp" %>
        <%@include file="../plantillas/navbar.jsp" %>
        <section class="mt-3 mx-5">
            <script>
                function editar() {
                    Swal.fire({
                        title: "Hermano editado",
                        text: "Se ha aplicado los cambios en la ficha del hermano",
                        icon: "success"
                    });
                }
            </script>
            <%  
                    if (sesion.getAttribute("mensaje").equals("editar")) {
            %>
            <script>editar();</script>
            <%
                    sesion.setAttribute("mensaje", "");
                }
            %>
            <div class="container text-center my-5">
                <a href="../hermanos/editar.jsp?id=<%=request.getParameter("id")%>" class="btn btn-outline-primary bg-primary text-white my-2 my-sm-0"><i class="fa-solid fa-user-pen mx-1"></i> Editar Hermano</a>
                <a onclick="baja()" class="btn btn-outline-danger bg-danger text-white my-2 my-sm-0"><i class="fa-solid fa-user-minus mx-1"></i> Dar de Baja Hermano</a>
            </div>
                <!-- href="../hermanos/baja.jsp?id=<%//=request.getParameter("id")%>" -->
            <%
                try {
                    String query = "SELECT * FROM hermanos";
                    String where = " WHERE id = '" + request.getParameter("id") + "'";
                    String limit = " LIMIT 1;";

                    query += where + limit;

                    rs = st.executeQuery(query);

                    String dni = "Sin Datos";
                    String fecha_nacimiento = "Sin Datos";
                    String telefono = "Sin Datos";
                    String localidad = "Sin Datos";
                    String provincia = "Sin Datos";
                    String codigo_postal = "Sin Datos";
                    String direccion = "Sin Datos";
                    String email = "Sin Datos";

                    while (rs.next()) {
                    /*
                        if (rs.getString("dni") != null || rs.getString("dni").isEmpty()) {
                            dni = rs.getString("dni");
                        }
                        if (!rs.getString("fecha_nacimiento").equalsIgnoreCase("00/00/0000")) {
                            fecha_nacimiento = rs.getString("fecha_nacimiento");
                        }
                        if (rs.getString("telefono") != null || rs.getString("telefono").equalsIgnoreCase("")) {
                            telefono = rs.getString("telefono");
                        }
                        if (rs.getString("localidad") != null || rs.getString("localidad").equalsIgnoreCase("")) {
                            localidad = rs.getString("localidad");
                        }
                        if (rs.getString("provincia") != null || rs.getString("provincia").equalsIgnoreCase("")) {
                            provincia = rs.getString("provincia");
                        }
                        if (rs.getString("codigo_postal") != null || rs.getString("codigo_postal").equalsIgnoreCase("")) {
                            codigo_postal = rs.getString("codigo_postal");
                        }
                        if (rs.getString("direccion") != null || rs.getString("direccion").equalsIgnoreCase("")) {
                            direccion = rs.getString("direccion");
                        }
                        if (rs.getString("email") != null || rs.getString("email").equalsIgnoreCase("")) {
                            email = rs.getString("email");
                        }
                    */
                    dni = rs.getString("dni");
                    fecha_nacimiento = rs.getString("fecha_nacimiento");
                    telefono = rs.getString("telefono");
                    localidad = rs.getString("localidad");
                    provincia = rs.getString("provincia");
                    codigo_postal = rs.getString("codigo_postal");
                    direccion = rs.getString("direccion");
                    email = rs.getString("email");
            %>
            <div class="card text-center" style="width: 80%; margin: auto auto;">
                <div class="card-header">
                    <h3><%=rs.getString("numero_hermano")%> - <%=rs.getString("nombre")%> <%=rs.getString("apellidos")%></h3>
                </div>
                <div class="card-body">
                    <div class="row py-2">
                        <div class="col-sm-6">
                            <b>DNI:</b> <%=dni%>
                        </div>
                        <div class="col-sm-6">
                            <b>Fecha de Nacimiento:</b> <%=fecha_nacimiento%>
                        </div>  
                    </div>
                    <div class="row py-2">
                        <div class="col-sm-6">
                            <b>Teléfono:</b> <%=telefono%>
                        </div>
                        <div class="col-sm-6">
                            <b>Localidad:</b> <%=localidad%>
                        </div>
                    </div>
                    <div class="row py-2">
                        <div class="col-sm-6">
                            <b>Provincia:</b> <%=provincia%>
                        </div>
                        <div class="col-sm-6">
                            <b>Código Postal:</b> <%=codigo_postal%>
                        </div>
                    </div>
                    <div class="row py-2">
                        <div class="col-sm-6">
                            <b>Dirección:</b> <%=direccion%>
                        </div>
                        <div class="col-sm-6">
                            <b>Email:</b> <%=email%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%
                }
            } catch (Exception e) {
                out.print("Error mysql " + e);
            }
        %>
    </section>
    <%@include file="../plantillas/footer.jsp" %>         
</body>
</html>
