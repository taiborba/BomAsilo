<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Prescricao"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
    </head>
    <body>
        
        <%
          int idPresc = Integer.parseInt(request.getParameter("idpresc"));
          Prescricao p = new Prescricao();
          if (idPresc != 0){
              p = p.consultarPrescricao(idPresc);
              if(p.excluirPrescricao()){
                response.sendRedirect("consultaprescricao.jsp?pmensagem=" +URLEncoder.encode("Prescrição excluida com sucesso", "UTF-8"));
                } else {
                    response.sendRedirect("consultaprescricao.jsp?pmensagem=" +URLEncoder.encode("Problemas ao excluir prescrição", "UTF-8"));
                }
          }          
        %>
        <hr /> 
    </body>
</html>

