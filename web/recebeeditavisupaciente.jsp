
<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Date"%>
<%@page import="modelos.Paciente"%>
<%@page import="java.net.URLEncoder"%>
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
            paciente.setIdQuarto        (Integer.parseInt(request.getParameter("idQuarto")));
            paciente.setEnderecoPaciente(Integer.parseInt(request.getParameter("enderecoPaciente")));
            paciente.setNomeContato     (request.getParameter("nomeContato"));
            paciente.setFoneContato     (request.getParameter("foneContato"));
             System.out.println(paciente);
            if(paciente.alterarPaciente()){
                response.sendRedirect("familiarvisualizarpaciente.jsp?pmensagem=" +URLEncoder.encode("Paciente editado com sucesso", "UTF-8"));
            } else {
                response.sendRedirect("familiarvisualizarpaciente.jsp?pmensagem=" +URLEncoder.encode("Problemas ao editar paciente", "UTF-8"));
            }          
        %>        
      
    </body>
</html>
