<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Prescricao"%>
<%@page import="modelos.Clinico"%>
<%@page import="modelos.Medicamento"%>
<%@page import="modelos.Familiar"%>
<%@page import="modelos.Paciente"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/estilos.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>  
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

        <h1>Relatório de Prescrições</h1>
        <hr />
        <%
        String usuarioLogado = "";

        if (session.getAttribute("usuarioLogado") != null) {
            usuarioLogado = session.getAttribute("usuarioLogado").toString();
        }
        %>

        <%
            Prescricao pre = new Prescricao();
            Familiar familiar = new Familiar();
            Paciente paciente = new Paciente();
        
            List<Prescricao> prescricao = pre.consultarPrescricaoPaciente(paciente.consultarPaciente(familiar.consultarFamiliar(usuarioLogado).getCpfPaciente()));
         %>
        <table class="table table-striped">
            <thead>
            <th scope="col">Data Consulta</th>
            <th scope="col">Clinico</th>
            <th scope="col">Medicamento</th>
            <th scope="col">Hora Consulta</th>
            <th scope="col">Descrição Orientação</th>
            <th scope="col">Descrição Posologia</th>
            <th scope="col">Paciente</th>
        </thead>
        <tbody>
            <% for (Prescricao p : prescricao) { %>
             <%
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                String dataConsulta = "";
                   if (p.getDataConsulta() != null) {
                    dataConsulta = sdf.format(p.getDataConsulta());
                }
            %>
            <tr>
                <td><% out.write(dataConsulta); %></td>
                <td><% out.write("" + p.getClinicoPrescricao().getNomeClinico() + " - "
                                    + p.getClinicoPrescricao().getEspecialidadeClinico().getDescEspecialidade());%></td>
                <td><% out.write("" + p.getMedicamentoPrescricao().getNomeMedicamento());   %></td>
                <td><% out.write("" + p.getHoraConsulta());  %></td>
                <td><% out.write("" + p.getDescOrientacao());  %></td>
                <td><% out.write("" + p.getDescPosologia());  %></td>
                <td><% out.write(p.getCpfPaciente() + " - " + p.getPacientePrescricao().getNome());%></td>
                                    
            </tr> 
            <%}%>
        </tbody>
    </table>
</form> 
 
</body>
</html>