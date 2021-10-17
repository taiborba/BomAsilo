<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Paciente"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page import="modelos.Prescricao"%>
<%@page import="modelos.Medicamento"%>
<%@page import="modelos.Clinico"%>
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
            Integer idPrescricao = Integer.parseInt(request.getParameter("idPrescricao"));
            Prescricao pr = new Prescricao();
            if (idPrescricao != null) {
                pr = pr.consultarPrescricao(idPrescricao);
            }

            Paciente pa = new Paciente();
            List<Paciente> pac = pa.consultarGeral();

            Clinico clinico = new Clinico();
            List<Clinico> clin = clinico.consultarGeral();

            Medicamento medicamento = new Medicamento();
            List<Medicamento> med = medicamento.consultarGeral();
        %>
        <div class="container">
        <form action="recebeeditaprescricaoEN.jsp" method="POST" id="bomasilo" action="" >
            <h3>Edit Medical Prescription</h3> 
            
            <input type="hidden" name="idPrescricao" value="<%out.write("" + pr.getIdPrescricao());%>" /> 
            
            <fieldset>
            <label>Select Patient </label> 
            <select name="cpfPaciente">
                <% if (pr.getCpfPaciente() != null) {%>
                <option value="<%out.write("" + pr.getCpfPaciente());%>"><%out.write("" + pr.getPacientePrescricao().getCpfPaciente() + " - " + pr.getPacientePrescricao().getNome());%></option> 
                <%} else {%>
                <option value="" hidden disabled selected> --Select Patient--</option>
                <%}%>
                <% for (Paciente p : pac) { %>
                <option value="<%out.write("" + p.getCpfPaciente());%>">
                    <% out.write(p.getCpfPaciente() + " - " + p.getNome()); %></option><%}%>
            </select>
            </fieldset>

            <fieldset>
            <label>Select Doctor </label> 
            <select name="idClinico">
                <% if ("" + pr.getIdClinico() != null) {%>
                <option value="<%out.write("" + pr.getIdClinico());%>"><%out.write("" + pr.getClinicoPrescricao().getNomeClinico() + " - " + pr.getClinicoPrescricao().getEspecialidadeClinico().getDescEspecialidade());%></option> 
                <%} else {%>
                <option value="" hidden disabled selected> --Select Doctor--</option>
                <%}%>
                <% for (Clinico c : clin) { %>
                <option value="<%out.write("" + c.getIdClinico());%>">
                    <% out.write(c.getNomeClinico() + " - " + c.getEspecialidadeClinico().getDescEspecialidade()); %></option><%}%>
            </select>
            </fieldset>

            <fieldset>
            <label>Select Medicine </label> 
            <select name="idMedicamento">
                    <% if ("" + pr.getIdMedicamento() != null) {%>
                    <option value="<%out.write("" + pr.getIdMedicamento());%>"><%out.write(""
                                        + pr.getMedicamentoPrescricao().getNomeMedicamento());%></option> 
                    <%} else {%>
                <option value="" hidden disabled selected> --Select Medicine--</option>
                <%}%>
                <% for (Medicamento m : med) { %>
                <option value="<%out.write("" + m.getIdMedicamento());%>">
                    <% out.write(m.getNomeMedicamento()); %></option><%}%>
            </select>
            </fieldset>

            <fieldset>
            <label>Doctor Appointment Date</label>
            <input type="date" name="dataConsulta" value="<%out.write("" + pr.getDataConsulta());%>" />
            </fieldset>

            <fieldset>
            <label>Doctor Appointment Time</label>
            <input type="time" name="horaConsulta" value="<%out.write("" + pr.getHoraConsulta());%>" />
            <fieldset>

                <fieldset>
            <label>Orientation Description</label>
            <input type="text" name="descOrientacao" value="<%out.write("" + pr.getDescOrientacao());%>" maxlength="40" />
                </fieldset>

                <fieldset>
            <label>Posology Description</label>
            <input type="text" name="descPosologia" value="<%out.write("" + pr.getDescPosologia());%>" maxlength="40" />
                </fieldset><br/>

            <input type="submit" value="Edit" onclick="location.href = 'consultaprescricaoEN.jsp';"/>
            <input type="reset" value="Cancel" onclick="location.href = 'consultaprescricaoEN.jsp';" />
        </form>
    </body>  
</html>
