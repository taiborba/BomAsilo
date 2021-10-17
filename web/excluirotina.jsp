<%@page import="modelos.Rotina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <h1>Excluir Rotina</h1>
        <%
            Integer pIdEvento = Integer.parseInt(request.getParameter("idEvento"));
            Rotina r = new Rotina();
            if (pIdEvento != null) {
                r.consultarRotina(pIdEvento);
                if (r.excluirRotina()) {
                    response.sendRedirect("cadastrarotina.jsp?pmensagem=Rotina excluido com sucesso");
                } else {
                    response.sendRedirect("cadastrarotina.jsp?pmensagem=Problemas ao excluir rotina");
                }
            }
        %>
        <hr />
        <a href="consultarotina.jsp">Consulta Rotina</a> 

    </body>
</html>
