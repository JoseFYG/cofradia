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
            <div class="card" style="width: 80%; margin: auto auto;">
                <form action="../hermanos/crear.jsp" method="post">
                    <%
                        try {
                            String query = "SELECT * FROM hermanos";
                            String where = " WHERE id = '" + request.getParameter("id") + "'";
                            String limit = " LIMIT 1;";

                            query += where + limit;

                            rs = st.executeQuery(query);
                            while (rs.next()) {
                    %>
                    <ul class="list-group list-group-light list-group-small">
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="numero_hermano">Número de Hermano</label>
                                <input type="text" class="form-control" id="numero_hermano" name="numero_hermano" placeholder="Número de Hermano" value="<%=rs.getString("numero_hermano")%>" required>
                            </div>
                        </li>
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" value="<%=rs.getString("nombre")%>" required>
                            </div>
                        </li>
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="apellidos">Apellidos</label>
                                <input type="text" class="form-control" id="apellidos" name="apellidos" placeholder="Apellidos" value="<%=rs.getString("apellidos")%>" required>
                            </div>
                        </li>
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="dni">DNI</label>
                                <input type="text" class="form-control" id="dni" name="dni" placeholder="DNI" value="<%=rs.getString("dni")%>">
                            </div>
                        </li>
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="fecha_nacimiento">Fecha de Nacimiento</label>
                                <input type="date" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento" placeholder="<%=hoy%>" value="value="<%=rs.getString("fecha_nacimiento")%>"">
                            </div>
                        </li>
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="telefono">Teléfono</label>
                                <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Teléfono" value="<%=rs.getString("telefono")%>">
                            </div>
                        </li>
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="text" class="form-control" id="email" name="email" placeholder="Email" value="<%=rs.getString("email")%>">
                            </div>
                        </li>
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="provincia">Provincia</label>
                                <input type="text" class="form-control" id="provincia" name="provincia" placeholder="Provincia" value="<%=rs.getString("provincia")%>">
                            </div>
                        </li>
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="localidad">Localidad</label>
                                <input type="text" class="form-control" id="localidad" name="localidad" placeholder="Localidad" value="<%=rs.getString("localidad")%>">
                            </div>
                        </li>
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="direccion">Dirección</label>
                                <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección" value="<%=rs.getString("direccion")%>">
                            </div>
                        </li>
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="codigo_postal">Código Postal</label>
                                <input type="text" class="form-control" id="codigo_postal" name="codigo_postal" placeholder="Código Postal" value="<%=rs.getString("codigo_postal")%>">
                            </div>
                        </li>
                        <li class="list-group-item px-3 text-center">
                            <button type="submit" name="enviar" class="btn btn-success px-5 py-3"><i class="fa-solid fa-floppy-disk mx-1"></i> Editar Hermano <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                        </li>
                    </ul>
                    <%
                            }
                        } catch (Exception e) {
                            out.print("Error mysql " + e);
                        }
                    %>
                </form>
            </div>
            <%
                if (request.getParameter("enviar") != null) {

                    String numero_hermano = request.getParameter("numero_hermano");
                    String nombre = request.getParameter("nombre");
                    String apellidos = request.getParameter("apellidos");

                    String dni = request.getParameter("dni");

                    String fecha_nacimiento = request.getParameter("fecha_nacimiento");
                    String fecha = fecha_nacimiento.split("-")[2] + "/" + fecha_nacimiento.split("-")[1] + "/" + fecha_nacimiento.split("-")[0];

                    String telefono = request.getParameter("telefono");
                    String email = request.getParameter("email");
                    String provincia = request.getParameter("provincia");
                    String localidad = request.getParameter("localidad");
                    String direccion = request.getParameter("direccion");
                    String codigo_postal = request.getParameter("codigo_postal");

                    try {
                        st.execute("UPDATE hermanos SET numero_hermano = '" + numero_hermano + "', nombre = '" + nombre + "', apellidos = '" + apellidos + "', dni = '" + dni + "', fecha_nacimiento = '" + fecha + "', telefono = '" + telefono + "', email = '" + email + "', provincia = '" + provincia + "', localidad = '" + localidad + "', direccion = '" + direccion + "', codigo_postal = '" + codigo_postal + "'"
                                + " WHERE id = '" + request.getParameter("id") + "';");
                        sesion.setAttribute("mensaje", "crear");
                        request.getRequestDispatcher("../hermanos/index.jsp").forward(request, response);
                    } catch (Exception e) {
                        out.print(e);
                    }
                }
            %>
        </section>
        <%@include file="../plantillas/footer.jsp" %>         
    </body>
</html>

