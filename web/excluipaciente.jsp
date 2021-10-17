<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->

<%@page import="modelos.Paciente"%>
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
                    alert("Realize o acesso!");
                    window.top.location.href = "index.html";
                } else if (p1 !== "adm") {
                    alert("Você não possui acesso a esta página!");
                    window.top.location.href = "menu.jsp";
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

        <%
            Integer idPaciente = Integer.parseInt(request.getParameter("idPaciente"));
            Paciente p = new Paciente();
            if (idPaciente != null) {
                p = p.consultarPacienteId(idPaciente);
                if (p.excluirPaciente()) {
                    response.sendRedirect("consultapaciente.jsp?pmensagem=" + URLEncoder.encode("Paciente excluido com sucesso", "UTF-8"));
                } else {
                    response.sendRedirect("consultapaciente.jsp?pmensagem=" + URLEncoder.encode("Problemas ao excluir paciente", "UTF-8"));
                }
            } else {
                response.sendRedirect("consultapaciente.jsp?pmensagem=" + URLEncoder.encode("PACIENTE NAO ENCONTRADO", "UTF-8"));
            }
        %>
        <hr /> 
    </body>
</html>
