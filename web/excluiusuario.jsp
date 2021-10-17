
<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Usuario"%>
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

        <h1>Excluir Usuário</h1>
        <%
            String login = request.getParameter("login");
            Usuario u = new Usuario();
            if (login != null) {
                u = u.consultarUsuario(login);
                if (u.excluirUsuario()) {
                    response.setCharacterEncoding("UTF-8");
                    response.sendRedirect("consultausuario.jsp?pmensagem=" + URLEncoder.encode("Usuário excluido com sucesso", "UTF-8"));
                } else {
                    response.setCharacterEncoding("UTF-8");
                    response.sendRedirect("consultausuario.jsp?pmensagem=" + URLEncoder.encode("Problemas ao excluir usuário", "UTF-8"));
                }
            }
        %>
    </body>
</html>
