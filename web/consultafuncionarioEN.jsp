<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Funcionario"%>
<%@page import="modelos.Cargo"%>
<%@page import="modelos.Endereco"%>
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

        <h1>Worker List</h1>
        <hr />
        <label>
            <%
                if (request.getParameter("pmensagem") != null) {
                    out.write(request.getParameter("pmensagem"));
                }
            %>
        </label>
        <%
            Funcionario fun = new Funcionario();
            List<Funcionario> funcionario = fun.consultarGeral();
        %>
        <table class="table table-striped">
            <thead>
            <th scope="col">Name</th>
            <th scope="col">CPF</th>
            <th scope="col">RG</th>
            <th scope="col">Job Position</th>
            <th scope="col">Professional Registration</th>
            <th scope="col">Admission Date</th>
            <th scope="col">Termination Date</th>
            <th scope="col">E-mail</th>
            <th scope="col">Phone Number</th>
            <th scope="col">Login</th>
            <th scope="col">Address</th>
            <th scope="col"> Edit </th>
            <th scope="col"> Delete </th>
        </thead>
        <tbody>
            <% for (Funcionario f : funcionario) { %>
            <%
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                String dataadm = sdf.format(f.getDataAdmissao());
                String datadeslig = "";
                if (f.getDataDesliga() != null) {
                    datadeslig = sdf.format(f.getDataDesliga());
                }
            %>
            <tr>   
                <td><% out.write(f.getNome());  %></td>
                <td><% out.write(f.getCpfFuncionario()); %></td>
                <td><% out.write(f.getRg());   %></td>
                <td><% out.write("" + f.getCargoFuncionario().getDescCargo());  %></td>
                <td><% out.write(f.getRegProfissional()); %></td>
                <td><% out.write(dataadm);   %></td>
                <td><% out.write(datadeslig); %></td>
                <td><% out.write(f.getEmailFuncionario()); %></td>
                <td><% out.write(f.getFoneFuncionario());   %></td>
                <td><% out.write(f.getLoginFuncionario());  %></td>
                <td><% out.write("" + f.getEnderecoCompletoFuncionario().getCep() + " - "
                            + f.getEnderecoCompletoFuncionario().getRua() + " - "
                            + f.getEnderecoCompletoFuncionario().getNr() + " - "
                            + f.getEnderecoCompletoFuncionario().getComplemento() + " - "
                            + f.getEnderecoCompletoFuncionario().getBairro() + " - "
                            + f.getEnderecoCompletoFuncionario().getCidade() + " - "
                            + f.getEnderecoCompletoFuncionario().getUf()); %></td>
                  <td><%out.write("<a href=editafuncionarioEN.jsp?idFuncionario=" + f.getIdFuncionario() + ">" + "<i class='fas fa-edit' style='color=black'></i>" + "</a>");%></td> 
                <td>
                    <a type="button" id="botaoexcluir"
                       onclick="mostrarExclusao(<%out.write("" + f.getIdFuncionario());%>)">
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

    function mostrarExclusao(funcionario) {
        //debugger;
        document.getElementsByClassName("msg-popup2")[0].style.display = "block";
        var link = document.getElementById("exclui");
        link.href = "excluifuncionarioEN.jsp?idFuncionario=" + funcionario;
    }
</script>
</body>
</html>

