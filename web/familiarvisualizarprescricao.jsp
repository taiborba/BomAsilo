<%@page import="modelos.Prescricao"%>
<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Paciente"%>
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
          Prescricao pre = new Prescricao();
          List<Prescricao> pr = pre.consultarGeral();%>
        </label>
        <h1>Visualizar Prescricao</h1>
         <div>
            <% for(Prescricao p : pr) { %>
                        <label> Clinico: </label>
                        <td><% out.write(p.getClinicoPrescricao().getNomeClinico()); %></td><br />
                        
                        <label> Data da Consulta: </label>
                        <%
                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                            String dataCons      = sdf.format(p.getDataConsulta());                
                        %>
                        <td><% out.write(dataCons); %></td><br />
                        
                        <label> Hora da Consulta: </label>
                        <td><% out.write("" + p.getHoraConsulta()); %></td><br />

                        <label> Descrição da Orientação: </label>
                        <td><%out.write("" + p.getDescOrientacao());%> </td><br />
                        
                        <label> Descrição da Posologia: </label>
                        <td><%out.write("" + p.getDescPosologia());%> </td><br />
                        
                        <label> Medicamento: </label> 
                        <td><% out.write(p.getMedicamentoPrescricao().getNomeMedicamento()); %></td><br />

                        <label> Paciente: </label> 
                        <td><% out.write(p.getCpfPaciente() + " - " + p.getPacientePrescricao().getNome()); %></td><br />

                  <%}%>
            </div>   
    </body>                    
</html>
