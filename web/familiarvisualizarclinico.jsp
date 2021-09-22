<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Clinico"%>
<%@page import="modelos.Prontuario"%>
<%@page import="modelos.Endereco"%>
<%@page import="modelos.Paciente"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Familiar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
    </head>
    <body>
        <script src="scripts/menu.js"></script>  
         <label><%
            if(request.getParameter("pmensagem") != null) {
            out.write(request.getParameter("pmensagem"));
            }
          Clinico cli = new Clinico();
          List<Clinico> cl = cli.consultarGeral();%>
        </label>
        <h1>Visualizar Clinico</h1>
        <div>
            <% for(Clinico c : cl){ %>
                        <label> Nome do Clinico: </label>
                        <td><% out.write(c.getNomeClinico()); %></td><br />
                        
                        <label> Especialidade: </label>
                        <td><% out.write("" + c.getIdEspecialidadeClinico().getDescEspecialidade()); %></td><br /><br />
                        
                  <%}%>
            </div>   
     </body>                  
</html>
