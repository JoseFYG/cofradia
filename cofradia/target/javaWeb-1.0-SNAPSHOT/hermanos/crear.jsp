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
                    <ul class="list-group list-group-light list-group-small">
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="numero_hermano">Número de Hermano</label>
                                <input type="text" class="form-control" id="numero_hermano" name="numero_hermano" placeholder="Número de Hermano" required>
                            </div>
                        </li>
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="nombre">Nombre</label>
                                <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" required>
                            </div>
                        </li>
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="apellidos">Apellidos</label>
                                <input type="text" class="form-control" id="apellidos" name="apellidos" placeholder="Apellidos" required>
                            </div>
                        </li>
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="dni">DNI</label>
                                <input type="text" class="form-control" id="dni" name="dni" placeholder="DNI">
                            </div>
                        </li>
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="fecha_nacimiento">Fecha de Nacimiento</label>
                                <input type="date" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento" placeholder="<%=hoy%>" value="<%=hoy%>">
                            </div>
                        </li>
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="telefono">Teléfono</label>
                                <input type="text" class="form-control" id="telefono" name="telefono" placeholder="Teléfono">
                            </div>
                        </li>
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="text" class="form-control" id="email" name="email" placeholder="Email">
                            </div>
                        </li>
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="provincia">Provincia</label>
                                <input type="text" class="form-control" id="provincia" name="provincia" placeholder="Provincia">
                            </div>
                        </li>
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="localidad">Localidad</label>
                                <input type="text" class="form-control" id="localidad" name="localidad" placeholder="Localidad">
                            </div>
                        </li>
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="direccion">Dirección</label>
                                <input type="text" class="form-control" id="direccion" name="direccion" placeholder="Dirección">
                            </div>
                        </li>
                        <li class="list-group-item px-3 py-3">
                            <div class="form-group">
                                <label for="codigo_postal">Código Postal</label>
                                <input type="text" class="form-control" id="codigo_postal" name="codigo_postal" placeholder="Código Postal">
                            </div>
                        </li>
                        <li class="list-group-item px-3 text-center">
                            <button type="submit" name="enviar" class="btn btn-success px-5 py-3"><i class="fa-solid fa-floppy-disk mx-1"></i> Dar de Alta <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                        </li>
                    </ul>
                </form>
            </div>
            <%  
                if (request.getParameter("enviar") != null) {

                    String numero_hermano = request.getParameter("numero_hermano");
                    String nombre = request.getParameter("nombre");
                    String apellidos = request.getParameter("apellidos");
                    
                    String dni = request.getParameter("dni");
                    
                    String fecha_nacimiento = request.getParameter("fecha_nacimiento");
                    String fecha = fecha_nacimiento.split("-")[2]+"/"+fecha_nacimiento.split("-")[1]+"/"+fecha_nacimiento.split("-")[0];
                    
                    String telefono = request.getParameter("telefono");
                    String email = request.getParameter("email");
                    String provincia = request.getParameter("provincia");
                    String localidad = request.getParameter("localidad");
                    String direccion = request.getParameter("direccion");
                    String codigo_postal = request.getParameter("codigo_postal");

                    try {
                        st.execute("INSERT INTO hermanos (CIF, numero_hermano, nombre, apellidos, dni, fecha_nacimiento, telefono, email, provincia, localidad, direccion, codigo_postal) "
                                + "values "
                                + "('" + sesion.getAttribute("CIF") + "', '" + numero_hermano + "', '" + nombre + "', '" + apellidos + "', '" + dni + "', '" + fecha + "', '" + telefono + "', '" + email + "', '" + provincia + "', '" + localidad + "', '" + direccion + "', '" + codigo_postal + "');");
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