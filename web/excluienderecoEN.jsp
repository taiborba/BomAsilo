<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Endereco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
    </head>
    <header>
        <script>
            function validaAcesso(p1) {
                if (p1 === "") {
                    alert("You need to login first!");
                    window.top.location.href = "indexEN.html";
                } else if ((p1 !== "adm") && (p1 !== "profsaude")) {
                    alert("You don't have the acess to this page!");
                    window.top.location.href = "menuEN.jsp";
                }
            }
        </script> 
    </header>
    <body>
        <%
            String tipoAcesso = "";
            if (session.getAttribute("tipoAcesso") != null) {
                tipoAcesso = session.getAttribute("tipoAcesso").toString();
            }
            System.out.println("Tipo:" + tipoAcesso);
            out.write("<script>validaAcesso(\"" + tipoAcesso + "\");</script>");
        %>

        <h1>Delete Address</h1>
        <%
            Integer idEndereco = Integer.parseInt(request.getParameter("idEndereco"));
            Endereco end = new Endereco();
            if (idEndereco != null) {
                end = end.consultarEndereco(idEndereco);
                if (end.excluirEndereco()) {
                    response.setCharacterEncoding("UTF-8");
                    response.sendRedirect("consultaendereco.jsp?pmensagem=" + URLEncoder.encode("Address Sucsessfully Deleted", "UTF-8"));
                } else {
                    response.sendRedirect("consultaendereco.jsp?pmensagem=" + URLEncoder.encode("Problems in Deleting Address", "UTF-8"));
                }
            }
        %>
        <hr />
        <a href="consultaenderecoEN.jsp">Address List</a> 

    </body>
</html>
