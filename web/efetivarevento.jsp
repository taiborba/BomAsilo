<!--
********************************************************************************
ENTRA21 - TURMA MATURITECH 2020    
DEFINIÇÃO: EFETIVAR EVENTO
AUTOR: MARCIO SCHOENFELDER
********************************************************************************
-->

<%@page import="modelos.Rotina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            //recebe os valores da tela HTML  
            int idEvento = Integer.parseInt(request.getParameter("idEvento"));

            //instancia a classe Evento
            Rotina r = new Rotina();
            if (r.efetivar(idEvento)) {
                response.sendRedirect("consultarotina.jsp?pmensagem=Evento efetivado com sucesso");
            } else {
                response.sendRedirect("consultarotina.jsp?pmensagem=Problemas ao efetivar evento");
            }
        %>
    </body>
</html>
