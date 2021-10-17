<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Prontuario"%>
<%@page import="java.net.URLEncoder"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Excluir Prontuario</title>
    </head>
    <header>
        <script>
            function validaAcesso(p1) {
                if (p1 === "") {
                    alert("Realize o acesso!");
                    window.top.location.href = "index.html";
                } else if ((p1 !== "adm") && (p1 !== "profsaude")) {
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
            Integer idProntuario = Integer.parseInt(request.getParameter("idProntuario"));
            Prontuario p = new Prontuario();
            if (idProntuario != null) {
                p = p.consultarProntuario(idProntuario);
                if (p.excluirProntuario()) {
                    response.sendRedirect("consultaprontuario.jsp?pmensagem=" + URLEncoder.encode("Prontuario excluido com sucesso", "UTF-8"));
                } else {
                    response.sendRedirect("consultaprontuario.jsp?pmensagem=" + URLEncoder.encode("Problemas ao excluir prontuario", "UTF-8"));
                }
            }
        %>
    </body>
</body>
</html>

