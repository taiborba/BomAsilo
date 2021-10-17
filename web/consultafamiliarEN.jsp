<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Familiar"%>
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
        <h1>Family List</h1>
        <hr />
        <label><%
            if (request.getParameter("pmensagem") != null) {
                out.write(request.getParameter("pmensagem"));
            }%>
        </label><br/>

        <%
            Familiar fam = new Familiar();
            List<Familiar> familiar = fam.consultarGeral();
        %>

        <table class="table table-striped">
            <thead>
            <th scope="col">Name</th>
            <th scope="col">CPF</th>
            <th scope="col">Rg</th>
            <th scope="col">Phone Number</th>
            <th scope="col">Phone Number 2</th>
            <th scope="col">Patient</th>
            <th scope="col">Login</th>
            <th scope="col">Address</th>
            <th scope="col"> Edit </th>
            <th scope="col"> Delete </th>
        </thead>
        <tbody>
            <% for (Familiar f : familiar) { %>
            <tr>
                <td><% out.write(f.getNome());  %></td>
                <td><% out.write(f.getCpfFamiliar());   %></td>
                <td><% out.write(f.getRg()); %></td>
                <td><% out.write(f.getFoneFixo()); %></td>
                <td><% out.write(f.getFoneCelular()); %></td>
                <td><% out.write("" + f.getPacienteFamiliar().getNome()); %></td>
                <td><% out.write(f.getLoginFamiliar()); %></td>
                <td><% out.write("" + f.getEnderecoCompletoFamiliar().getCep() + " - "
                            + f.getEnderecoCompletoFamiliar().getRua() + " - "
                            + f.getEnderecoCompletoFamiliar().getNr() + " - "
                            + f.getEnderecoCompletoFamiliar().getComplemento() + " - "
                            + f.getEnderecoCompletoFamiliar().getBairro() + " - "
                            + f.getEnderecoCompletoFamiliar().getCidade() + " - "
                                    + f.getEnderecoCompletoFamiliar().getUf()); %></td>
                  <td><%out.write("<a href=editafamiliarEN.jsp?idFamiliar=" + f.getIdFamiliar() + ">" + "<i class='fas fa-edit' style='color=black'></i>" + "</a>");%></td> 
                <td>
                    <a type="button" id="botaoexcluir"
                       onclick="mostrarExclusao(<%out.write("" + f.getIdFamiliar());%>)">
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

    function mostrarExclusao(familiar) {
        //debugger;
        document.getElementsByClassName("msg-popup2")[0].style.display = "block";
        var link = document.getElementById("exclui");
        link.href = "excluifamiliarEN.jsp?idFamiliar=" + familiar;
    }
</script>
</body>
</html>
