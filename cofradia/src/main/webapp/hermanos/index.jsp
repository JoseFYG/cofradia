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
                function crear() {
                    Swal.fire({
                        title: "Hermano dado de Alta",
                        text: "Este hermano ya es parte de <%=sesion.getAttribute("hermandad")%>",
                        icon: "success"
                    });
                }
                function baja() {
                    Swal.fire({
                        title: "Hermano dado de Baja",
                        text: "Este hermano ya no formará parte de <%=sesion.getAttribute("hermandad")%>",
                        icon: "success"
                    });
                }
            </script>
            <%  
                    if (sesion.getAttribute("mensaje").equals("crear")) {
            %>
            <script>crear();</script>
            <%
                    sesion.setAttribute("mensaje", "");
                }
            %>
            <%  
                    if (sesion.getAttribute("mensaje").equals("baja")) {
            %>
            <script>baja();</script>
            <%
                    sesion.setAttribute("mensaje", "");
                }
            %>
            <a href="../hermanos/crear.jsp" class="btn btn-outline-success bg-success text-white my-2 my-sm-0 ml-2"><i class="fa-solid fa-user-plus mx-1"></i> Crear Hermano</a>                 
            <form action="../hermanos/index.jsp" method="get">
                <table id="hermanos" class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col" class="text-center bg-primary text-dark"></th>
                            <th scope="col" class="text-center bg-primary text-dark">NÚMERO</th>
                            <th scope="col" class="bg-primary text-dark">APELLIDOS Y NOMBRE</th>
                            <th scope="col" class="text-center bg-primary text-dark">EDAD</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%  try {
                                String query = "SELECT * FROM hermanos";
                                String where = " WHERE CIF = '" + sesion.getAttribute("CIF") + "' AND activo = 'SI'";
                                String order = " ORDER BY apellidos asc;";

                                query += where + order;

                                rs = st.executeQuery(query);
                                while (rs.next()) {
                        %>
                        <tr>
                            <td class="text-center text-dark">
                                <a href="../hermanos/ficha.jsp?id=<%=rs.getString("id")%>" class="btn btn-outline-primary my-2 my-sm-0"><i class="fa-solid fa-id-card mx-1"></i> FICHA</a>
                            </td>
                            <th scope="row" class="text-center text-dark"><%=rs.getString("numero_hermano")%></th>
                            <td class="text-dark"><%=rs.getString("apellidos")%>, <%=rs.getString("nombre")%></td>
                            <%
                                String edad = "Desconocida";

                                DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy/MM/dd");

                                if (!rs.getString("fecha_nacimiento").equalsIgnoreCase("0000-00-00")) {

                                    LocalDate fechaNac = LocalDate.parse(rs.getString("fecha_nacimiento"));
                                    LocalDate ahora = LocalDate.now();
                                    Period periodo = Period.between(fechaNac, ahora);

                                    edad = "" + periodo.getYears();
                                }
                            %>
                            <td class="text-center text-dark"><%=edad%></td>
                        </tr>
                        <%
                                }
                            } catch (Exception e) {
                                out.print("Error mysql " + e);
                            }
                        %>
                    </tbody>
                </table>
            </form>
        </section>
        <%@include file="../plantillas/footer.jsp" %>         
    </body>
</html>
