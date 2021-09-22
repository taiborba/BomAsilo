<%@page import="modelos.Prontuario"%>
<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
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
          Prontuario pro = new Prontuario();
          List<Prontuario> pr = pro.consultarGeral();%>
        </label>
        <h1>Visualizar Prontuario</h1>
        <div>
            <% for(Prontuario p : pr) { %>
                        <label> Tipo Sanguineo: </label>
                        <td><% out.write(p.getTipoSangue()); %></td><br />
                        
                        <label> Limitação Cognitiva: </label>
                        <td><% out.write("" + p.isLimitCognitiva()); %></td><br />
                        
                        <label> Limitação Locomotiva: </label>
                        <td><% out.write("" + p.isLimitLocomocao()); %></td><br />

                        <label> Limitação na Visão: </label>
                        <td><%out.write("" + p.isLimitVisao());%> </td><br />
                        
                        <label> Limitação Auditiva: </label>
                        <td><%out.write("" + p.isLimitAudicao());%> </td><br />
                        
                        <label> Outras Limitações: </label> 
                        <td><% out.write(p.getLimitOutras()); %></td><br />

                        <label> Alergia: </label> 
                        <td><% out.write(p.getDescAlergia()); %></td><br />

                        <label> Ocupação: </label>
                        <td><% out.write(p.getDescOcupacao()); %></td><br />
                        
                        <label> Paciente: </label>
                        <td><% out.write(p.getPacienteProntuario().getNome() + " - " + p.getCpfPaciente()); %></td><br />
                        
                        <label> Peso: </label>
                        <td><% out.write("" + p.getPeso()); %></td><br />
                        
                        <label> Altura: </label>
                        <td><% out.write("" + p.getAltura()); %></td><br />
                        
                        <label> IMC: </label>
                        <td><% out.write("" + p.getImc()); %></td><br />
                  <%}%>
            </div>   
     </body>                  
</html>
