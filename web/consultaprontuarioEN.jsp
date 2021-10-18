<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Prontuario"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
                    alert("You need to login first!");
                    window.top.location.href = "indexEN.html";
                } else if ((p1 !== "adm") && (p1 !== "profsaude")) {
                    alert("You don't have the acess to this page!");
                    window.top.location.href = "menuEN.jsp";
                }
            }
        </script> 
    </header>
    <h1>Prontuary List</h1>
    <hr />
    <label>
        <%
            if (request.getParameter("pmensagem") != null)
                out.write(request.getParameter("pmensagem"));
        %>
    </label><br/>
    <%
        Prontuario pro = new Prontuario();
        List<Prontuario> prontuario = pro.consultarGeral();
    %>
    <table class="table table-striped">
        <thead>
        <th scope="col">Doctor Appointment Date</th>
        <th scope="col">Blood Type </th>
        <th scope="col">Weight </th>
        <th scope="col">Height </th>
        <th scope="col">BMI </th>
        <th scope="col">Cognitive Limitation </th>
        <th scope="col">Locomotive Limitation </th>
        <th scope="col">Visual Limitation </th>
        <th scope="col">Auditory Limitation </th>
        <th scope="col">Other Limitation </th>
        <th scope="col">Allergy </th>
        <th scope="col">Occupation </th>
        <th scope="col"> Edit </th>
        <th scope="col"> Delete </th>
        <th scope="col">Patient </th>
        </thead>
    <tbody>
        <% for (Prontuario pr : prontuario) { %>
        <tr>
            <td><% out.write("" + pr.getDataConsulta());   %></td>
            <td><% out.write(pr.getTipoSangue());  %></td>
            <td><% out.write("" + pr.getPeso()); %></td>
            <td><% out.write("" + pr.getAltura()); %></td>
            <td><% out.write("" + pr.getImc()); %></td>
                <td><% if (pr.isLimitCognitiva()) {
                                out.write("Yes");
                            } else {
                                out.write("No");
                            } %></td>
                <td><% if (pr.isLimitLocomocao()) {
                                out.write("Yes");
                            } else {
                                out.write("No");
                            } %></td>
                <td><% if (pr.isLimitVisao()) {
                                out.write("Yes");
                            } else {
                                out.write("No");
                            } %></td>
                <td><% if (pr.isLimitAudicao()) {
                                out.write("Yes");
                            } else {
                                out.write("No");
                            } %></td>
            <td><% out.write("" + pr.getLimitOutras()); %></td>
            <td><% out.write(pr.getDescAlergia()); %></td>
            <td><% out.write(pr.getDescOcupacao()); %></td>
            <td><% out.write("" + pr.getPacienteProntuario().getNome()); %></td>
              <td><%out.write("<a href=editaprontuarioEN.jsp?idProntuario=" + pr.getIdProntuario() + ">" + "<i class='fas fa-edit' style='color=black'></i>" + "</a>");%></td> 
            <td>
                <a type="button" id="botaoexcluir"
                   onclick="mostrarExclusao(<%out.write("" + pr.getIdProntuario());%>)">
                    <i class="fas fa-trash-alt" style='color:red'></i> 
                </a>
            </td>                             
        </tr> 
        <%}%>
    </tbody>
</table>
</form> 
<!-- POPUP DE CONFIRMAÇÃO DE EXCLUSÃO -->                

<div class="msg-popup2">
    <h5 class="text-center" style="color: #ffffff; font-family: arial-bold ">DELETE</h5>
    <h5 class="text-center" style="color: #ffffff;">Are you sure that you want to <b>delete</b> this register?</h5>
    <div class="text-center">                
        <a href=""><button class="btn btn-dark" onclick="cancela()"> No </button></a>
        <a id="exclui" href="#"><button class="btn btn-danger" id="excluir"> Yes </button></a>                    
    </div>
</div>                   

<script>
    function cancela() {
        document.getElementsByClassName("msg-popup2")[0].style.display = "none";
    }

    function mostrarExclusao(prontuario) {
        //debugger;
        document.getElementsByClassName("msg-popup2")[0].style.display = "block";
        var link = document.getElementById("exclui");
        link.href = "excluiprontuarioEN.jsp?idProntuario=" + prontuario;
    }
</script>
</body>
</html>
