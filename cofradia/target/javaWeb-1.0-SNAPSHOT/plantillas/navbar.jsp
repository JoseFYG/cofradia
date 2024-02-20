<!-- Navbar -->
<nav class="navbar navbar-expand-lg sticky-top bg-dark text-light navbar-light">
    <div class="container">
        <a class="navbar-brand" href="#" style="color: white;"><i class="fa-solid fa-church pe-2"></i><%=sesion.getAttribute("hermandad")%></a>
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
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item">
                    <a class="bg-light text-dark btn-rounded nav-link mx-2" href="../hermanos/index.jsp" style="color: white;"><i class="fa-solid fa-users pe-2"></i>Gestión de Hermanos</a>
                </li>
                <li class="nav-item ms-3">
                    <form class="form-inline" action="../logout.jsp">
                        <button class="btn btn-outline-danger btn-rounded my-2 my-sm-0 ml-2" type="submit">Cerrar Sesión</button>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>
<!-- Navbar -->
<title>Cofradía</title>
