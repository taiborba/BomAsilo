<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Familiar"%>
<%@page import="java.sql.Date"%>
<%@page import="modelos.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
        //recebe os valores da tela HTML 
         
            //instancia o Paciente
            Familiar familiar = new Familiar();
            familiar.setIdFamiliar       (Integer.parseInt(request.getParameter("idFamiliar")));
            familiar.setNome             (request.getParameter("nome"));
            familiar.setCpfFamiliar      (request.getParameter("cpfFamiliar"));
            familiar.setRg               (request.getParameter("rg"));
            familiar.setFoneFixo         (request.getParameter("foneFixo"));
            familiar.setFoneCelular      (request.getParameter("foneCelular"));
            familiar.setLoginFamiliar    (request.getParameter("loginFamiliar"));
            familiar.setEnderecoFamiliar (Integer.parseInt(request.getParameter("enderecoFamiliar")));
            familiar.setCpfPaciente      (request.getParameter("cpfPaciente"));
          
            if(familiar.AlterarFamiliar()){
                response.sendRedirect("familiarvisualizarfamiliar.jsp?pmensagem=Paciente editado com sucesso");
            } else {
                response.sendRedirect("familiarvisualizarfamiliar.jsp?pmensagem=Problemas ao editar paciente");
            }          
        %>        
       <hr />
       <a href="consultapaciente.jsp">Consulta Paciente</a> 
    </body>
</html>
