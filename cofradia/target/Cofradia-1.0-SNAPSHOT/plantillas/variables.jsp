<%@page import="java.text.SimpleDateFormat"%>
<%
    HttpSession sesion = request.getSession();

    if (sesion.getAttribute("logeado") == null || sesion.getAttribute("logeado").equals("0")) {
        response.sendRedirect("../index.jsp");
    }
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/cofradia?user=javaweb&password=javaweb");
    Statement st = con.createStatement();
    Statement st1 = con.createStatement();
    Statement st2 = con.createStatement();
    Statement st3 = con.createStatement();
    Statement st4 = con.createStatement();
    Statement st5 = con.createStatement();
    ResultSet rs = null;
    ResultSet rs1 = null;
    ResultSet rs3 = null;
    ResultSet rs4 = null;
    ResultSet rs5 = null;
    
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String hoy = sdf.format(new java.util.Date());
%>