<%@page import="modelos.Rotina"%>
<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Prescricao"%>
<%@page import="modelos.Paciente"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="styles/estilos.css">
        <!--        
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>  
        -->
        <script src="scripts/formatacampos.js"></script>
        <link rel="icon" type="image/favicon" href="imagens/favicon.ico" />
    </head>
    <body>
        <header>
            <script>
                function validaAcesso(p1) {
                    if (p1 === "") {
                        alert("You need to login first!");
                        window.top.location.href = "index.html";
                    } else if ((p1 !== "adm") && (p1 !== "profsaude")) {
                        alert("You don't have the acess to this page!");
                        window.top.location.href = "menuEN.jsp";
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
        
                <label class="cabecalho" id="msg" id="bomasilo" action="" > 
                    <%
                        if (request.getParameter("pmensagem") != null) {
                            out.write(request.getParameter("pmensagem"));
                        }
                        Rotina r = new Rotina();
                        
                        Paciente paciente = new Paciente();
                        List<Paciente> pac = paciente.consultarGeral();

                        Prescricao prescricao = new Prescricao();
                        List<Prescricao> pre = prescricao.consultarGeral();
                    %>
                </label>
                <div class="container">
                <form action="recebedadosrotinaEN.jsp" method="POST" id="bomasilo" action="" >
                <h3>Routine Register</h3><br/>
                    
                <fieldset>
                    <label>Select Patient</label> 
                    <select name="cpfPaciente">
                        <option value="" hidden disabled selected> --Select Patient--</option>
                        <% for (Paciente p : pac) { %>
                        <option value="<%out.write("" + p.getCpfPaciente());%>">
                            <% out.write(p.getCpfPaciente() + " - " + p.getNome()); %></option><%}%>
                    </select></br>
                    <a href="cadastrapacienteEN.jsp" target="_blank">Register Patient</a>
                </fieldset><br />

                <fieldset>
                    <label>Start Date</label>
                    <input id="dataInicial" name="dataInicial" type="date" required="required" placeholder="Informe a Data Inicial do evento" min="1900-01-01" max="2999-12-31"/> <br/>
                    <input id="validadataInicial" class="validacampos" type="hidden"/>
                    <input name="dataFinal" type="hidden" value="<% r.getDataFinal();%>"/>
                </fieldset><br />
                    
                <fieldset>
                    <label>Start Hour</label><br/>
                    <input id="horaInicio" name="horaInicio" type="time" required="required" placeholder="Informe a Hora de inicio" maxlength="5" />
                    <label id="validahoraInicio" class="validacampos"></label>
                </fieldset>

                <fieldset>
                    <label>Final Hour</label><br/>
                    <input id="horafinal" name="horaFinal" type="time" required="required" placeholder="Informe a Hora Final" maxlength="5" />
                    <label id="validaHoraFinal" class="validacampos"></label>
                </fieldset>
                    
                <fieldset>
                    <label>Event Description</label>
                    <input id="descevento" name="descEvento" type="text" required="required"  maxlength="100" /> <br />
                    <label id="validadescevento" class="validacampos"></label>
                    <input name="status" type="hidden" value="<% r.getStatus();%>"/>
                </fieldset>

                <fieldset>
                    <label>Quantity of Days</label>
                    <input id="qtdeIntervalo" name="qtdeIntervalo" type="number" required="required" maxlength="10" /> <br />
                    <label id="validaQtdeIntervalo" class="validacampos"></label>
                </fieldset>
                   
                <fieldset>
                    <label>Select Prescription </label> 
                    <select name="idPrescricao">
                        <option value="" hidden disabled selected> --Select Prescription--</option>
                        <% for (Prescricao pr : pre) { %>
                        <option value="<%out.write("" + pr.getIdPrescricao());%>">
                            <% out.write(pr.getDescPosologia() + " - " + pr.getDataConsulta()); %></option><%}%>
                    </select> </br>
                    <a href="cadastraprescricaoEN.jsp" target="_blank"> Register Prescription </a>
                </fieldset>

                    </br>
                    <input type="button" value="Save" onclick="enviarDados()" />
                    <input type="reset" value="Cancel" onclick= "window.top.location.href = 'menuEN.jsp';" />  
                </form>
            </div>
        <script>
            function enviarDados() {
                var cpfPaciente = document.getElementsByName("cpfPaciente");
                if (cpfPaciente[0].value === "") {
                    cpfPaciente[0].focus();
                    alert("Enter Patient's CPF");
                    exit(0);
                }

                var dataInicial = document.getElementsByName("dataInicial");
                if (dataInicial[0].value === "") {
                    dataInicial[0].focus();
                    alert("Enter Start Date");
                    exit(0);
                }

                var horaInicio = document.getElementsByName("horaInicio");
                if (horaInicio[0].value === "") {
                    horaInicio[0].focus();
                    alert("Enter Start Hour");
                    exit(0);
                }

                var horaFinal = document.getElementsByName("horaFinal");
                if (horaFinal[0].value === "") {
                    horaFinal[0].focus();
                    alert("Enter Final Hour");
                    exit(0);
                }

                var descEvento = document.getElementsByName("descEvento");
                if (descEvento[0].value === "") {
                    descEvento[0].focus();
                    alert("Enter Event Description");
                    exit(0);
                }

                var qtdeIntervalo = document.getElementsByName("qtdeIntervalo");
                if (qtdeIntervalo[0].value === "") {
                    qtdeIntervalo[0].focus();
                    alert("Enter the Quantity of Days");
                    exit(0);
                }
                document.forms[0].submit();
            }
        </script>    
    </body>
</html>