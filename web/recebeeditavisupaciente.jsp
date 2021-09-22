<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->

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
            Paciente paciente = new Paciente();
            paciente.setIdPaciente      (Integer.parseInt(request.getParameter("idPaciente")));
            paciente.setNome            (request.getParameter("nome"));
            paciente.setCpfPaciente     (request.getParameter("cpfPaciente"));
            paciente.setRg              (request.getParameter("rg"));
            paciente.setDataNascimento  (Date.valueOf(request.getParameter("dataNascimento")));
            paciente.setQuarto          (request.getParameter("quarto"));
            paciente.setEnderecoPaciente(Integer.parseInt(request.getParameter("enderecoPaciente")));
            paciente.setNomeContato     (request.getParameter("nomeContato"));
            paciente.setFoneContato     (request.getParameter("foneContato"));
          
            if(paciente.alterarPaciente()){
                response.sendRedirect("familiarvisualizarpaciente.jsp?pmensagem=Paciente editado com sucesso");
            } else {
                response.sendRedirect("familiarvisualizarpaciente.jsp?pmensagem=Problemas ao editar paciente");
            }          
        %>        
       <hr />
       <a href="consultapaciente.jsp">Consulta Paciente</a> 
    </body>
</html>
