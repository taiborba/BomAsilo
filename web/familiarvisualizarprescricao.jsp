<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Prescricao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Paciente"%>
<%@page import="modelos.Familiar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/estilos.css">
        <!--        
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>  
        -->
        <script src="scripts/formatacampos.js"></script>
    </head>
    <header>
        <script>
            function validaAcesso(p1) {
                if (p1 === "") {
                    alert("Realize o acesso!");
                    window.top.location.href = "index.html";
                } else if (p1 !== "familiar") {
                    alert("Você não possui acesso a esta página!");
                    window.top.location.href = "menufamiliar.jsp";
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

        <%            
            String usuarioLogado = "";

            if (session.getAttribute("usuarioLogado") != null) {
                usuarioLogado = session.getAttribute("usuarioLogado").toString();
            }
        %>

        <%            
            Prescricao pre = new Prescricao();
            Paciente paciente = new Paciente();
            Familiar familiar = new Familiar();
            pre = pre.consultarPrescricao(
                    paciente.consultarPaciente(
                            familiar.consultarFamiliar(usuarioLogado).getCpfPaciente()));
        %>
        
        

        <label>
            <%
                if (request.getParameter("pmensagem") != null) {
                    out.write(request.getParameter("pmensagem"));
                }
            %>
        </label>

        <div class="container">
            <form method="POST" id="bomasilo" action="">
                <h3>Visualizar Prescrição</h3><br/>
                   <% if (pre != null) { %>
                <fieldset>
                    <label> Paciente: 
                        <td><% out.write(pre.getPacientePrescricao().getCpfPaciente() + " - " + pre.getPacientePrescricao().getNome()); %></td>
                    </label>
                </fieldset>

                <fieldset>
                    <label> Clinico: 
                        <td><% out.write(pre.getClinicoPrescricao().getNomeClinico()); %></td></label>
                </fieldset>

                <fieldset>
                    <label> Data da Consulta: 
                        <%
                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                            String dataCons = sdf.format(pre.getDataConsulta());
                        %>
                        <td><% out.write(dataCons); %></td></label>
                </fieldset>

                <fieldset>
                    <label> Hora da Consulta: 
                        <td><% out.write("" + pre.getHoraConsulta()); %></td></label>
                </fieldset>

                <fieldset>
                    <label> Descrição da Orientação: 
                        <td><%out.write("" + pre.getDescOrientacao());%> </td></label>
                </fieldset>

                <fieldset>
                    <label> Descrição da Posologia:
                        <td><%out.write("" + pre.getDescPosologia());%> </td> </label>
                </fieldset>

                <fieldset>
                    <label> Medicamento: 
                        <td><% out.write(pre.getMedicamentoPrescricao().getNomeMedicamento());%></td</label>
                </fieldset><br />

                <input type="reset" value="Voltar" onclick="window.top.location.href = 'menufamiliar.jsp';" /><br />  
                 <%}%>
            </form>
        </div>   
    </body>                    
</html>
