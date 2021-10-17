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
<%@page import="modelos.Rotina"%>
<%@page import="java.sql.Date"%>
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
        
    </head>
    <header>
        <script>
            function validaAcesso(p1) {
                if (p1 === "") {
                    alert("You need to login first!");
                    window.top.location.href = "indexEN.html";
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
                <body>
                    <%
                        Integer idEvento = Integer.parseInt(request.getParameter("idEvento"));
                        Rotina r = new Rotina();
                        if (idEvento != null) {
                            r = r.ConsultarRotina(idEvento);
                        }
                    %>

                    <%
                        Paciente paciente = new Paciente();
                        List<Paciente> pa = paciente.consultarGeral();

                        Prescricao prescricao = new Prescricao();
                        List<Prescricao> pre = prescricao.consultarGeral();
                    %>
                    <div class="container">
                    <form action="recebeeditarotinaEN.jsp" method="POST" id="bomasilo" action="" >
                        <h3>Edit Routine</h3>
                        
                        <input type="hidden" name="idEvento" 
                               value="<%out.write("" + r.getIdEvento());%>" />

                        <fieldset>
                        <label>Select Patient </label> 
                        <select name="cpfPaciente">
                            <% if (r.getCpfPaciente() != null) {%>
                            <option value="<%out.write("" + r.getCpfPaciente());%>"></option> 
                            <%} else {%>
                            <option value="" hidden disabled selected> --Select Patient-- </option>
                            <%}%>
                            <% for (Paciente p : pa) { %>
                            <option value="<%out.write("" + p.getCpfPaciente());%>">
                                <% out.write(p.getNome() + " - " + p.getCpfPaciente()); %></option><%}%>
                        </select>
                        </fieldset>

                        <fieldset>
                        <label>Event Date</label>
                        <input type="date" name="dataInicial" 
                               value="<%out.write("" + r.getDataInicial());%>" 
                               maxlength="13"/>
                        </fieldset>

                               <fieldset>
                        <label>Start Time</label>
                        <input type="time" name="horaInicio" 
                               value="<%out.write(r.getHoraInicio());%>" />
                               </fieldset>

                               <fieldset>
                        <label>Final Time</label>
                        <input type="time" name="horaFinal" 
                               value="<%out.write("" + r.getHoraFinal());%>" />
                               </fieldset>

                               <fieldset>
                        <label>Event Description</label>
                        <input type="text" name="descEvento" 
                               value="<%out.write("" + r.getDescEvento());%>" 
                               maxlength="100"/>
                               </fieldset>

                        <input type="hidden" name="status" value="<%out.write("" + r.getStatus());%>"/>
                        <input type="hidden" name="dataFinal" value="<%out.write("" + r.getDataFinal());%>"/>

                        <fieldset>
                        <label>Quantity of Days</label>
                        <input type="text" name="qtdeIntervalo" 
                               value="<%out.write("" + r.getQtdIntervalo());%>" 
                               maxlength="10"/>
                        </fieldset>

                               <fieldset>
                        <label>Select Prescription </label> 
                        <select name="idPrescricao">
                            <% if ("" + r.getIdPrescricao() != null) {%>
                            <option value="<%out.write("" + r.getIdPrescricao());%>"></option> 
                            <%} else {%>
                            <option value="" hidden disabled selected> --Select Prescription-- </option>
                            <%}%>
                            <% for (Prescricao pr : pre) { %>
                            <option value="<%out.write("" + pr.getIdPrescricao());%>">
                                <% out.write(pr.getDescOrientacao() + " - " + pr.getDataConsulta() + " - " + pr.getHoraConsulta() + " - " + pr.getDescPosologia()); %></option><%}%>
                        </select>
                               </fieldset><br/>

                        <input type="submit" value="Edit" onclick="location.href = 'consultarotinaEN.jsp';" />
                        <input type="reset" value="Cancel" onclick="location.href = 'consultarotinaEN.jsp';" />
                    </form>
                    </div>
                </body>
</html>
