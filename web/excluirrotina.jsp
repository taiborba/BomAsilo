<%@page import="modelos.Rotina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
    </head>
    <body>
        
        <h1>Excluir Rotina</h1>
        <%
          String pCpfpaciente = request.getParameter("cpfPaciente");
          Rotina r = new Rotina();
          if (pCpfpaciente != null){
              r.ConsultarRotina(pCpfpaciente);
              if(r.ExcluirRotina()){
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
