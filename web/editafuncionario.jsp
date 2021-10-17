<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Funcionario" %>
<%@page import="modelos.Cargo" %>
<%@page import="java.sql.Date"%>
<%@page import="modelos.Cargo" %>
<%@page import="java.util.List"%>
<%@page import="modelos.Endereco"%>
<%@page import="modelos.Usuario"%>
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
                    alert("Realize o acesso!");
                    window.top.location.href = "index.html";
                } else if (p1 !== "adm") {
                    alert("Você não possui acesso a esta página!");
                    window.top.location.href = "menu.jsp";
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
            Integer idFuncionario = Integer.parseInt(request.getParameter("idFuncionario"));
            Funcionario f = new Funcionario();
            if (idFuncionario != null) {
                f = f.consultarFuncionario(idFuncionario);
            }
        %>

        <%
            Cargo cargo = new Cargo();
            List<Cargo> car = cargo.consultarGeral();

            Endereco endereco = new Endereco();
            List<Endereco> end = endereco.consultarGeral();

            Usuario usuario = new Usuario();
            List<Usuario> usu = usuario.consultarGeral();
        %>
        <div class="container">
        <form action="recebeeditafuncionario.jsp" method="POST" id="bomasilo" action="" >
             <h3>Editar Funcionário</h3>
             
             <fieldset>
            <label>Nome</label>
            <input type="text" name="nome" maxlength="100"
                   value="<%out.write(f.getNome());%>" />
             </fieldset>

             <fieldset>
            <label>CPF</label>
            <input type="text" name="cpfFuncionario" maxlength="14"
                   value="<%out.write(f.getCpfFuncionario());%>" />
             </fieldset>

             <fieldset>
            <label>RG</label>
            <input type="text" name="rg" maxlength="14"
                   value="<%out.write(f.getRg());%>" />
             </fieldset>

             <fieldset>
            <label>Cargo</label>
            <select name="idCargo">
                <option value="<%out.write("" + f.getIdCargo());%>">
                    <% out.write(f.getCargoFuncionario().getDescCargo()); %>
                </option>
                <% for (Cargo c : car) {     %>
                <option value="<%out.write("" + c.getIdCargo());%>">
                    <% out.write(c.getDescCargo()); %>
                </option><%}%>
            </select>
             </fieldset>

            <fieldset>
            <label>Registro Profissional</label>
            <input type="text" name="regProfissional" maxlength="25"
                   value="<%out.write(f.getRegProfissional());%>" />
            </fieldset>

            <fieldset>
            <label>Data de Admissão</label>
            <input type="date" name="dataAdmissao" maxlength="13"
                   value="<%out.write("" + f.getDataAdmissao());%>" />
            </fieldset>

            <fieldset>
            <label>Data de Desligamento</label>
            <input type="date" name="dataDesliga" maxlength="13"
                   value="<%if (f.getDataDesliga() != null) {
                                        out.write("" + f.getDataDesliga()); }%>" />
            </fieldset>

            <fieldset>
            <label>E-mail</label>
            <input type="email" name="emailFuncionario" maxlength="100" 
                   value="<%out.write(f.getEmailFuncionario());%>" />
            </fieldset>

            <fieldset>
            <label>Telefone</label>
            <input type="text" name="foneFuncionario" maxlength="20"
                   value="<%out.write("" + f.getFoneFuncionario());%>" 
                   onkeypress="mask(this, mphone);" onblur="mask(this, mphone);"/>
            </fieldset>

                   <fieldset>
            <label>Selecione o Endereco </label> 
            <select name="enderecoFuncionario">
                    <% if (f.getEnderecoFuncionario() != null) {%>
                    <option value="<%out.write("" + f.getEnderecoFuncionario());%>"><%out.write(""
                                        + f.getEnderecoCompletoFuncionario().getCep() + " - " + f.getEnderecoCompletoFuncionario().getRua() + " - " + f.getEnderecoCompletoFuncionario().getNr());%></option> 
                    <%} else {%>
                <option value="" hidden disabled selected> --Selecione o Endereço--</option>
                <%}%>
                <% for (Endereco e : end) { %>
                <option value="<%out.write("" + e.getIdEndereco());%>">
                    <% out.write(e.getCep() + " - " + e.getRua() + " - " + e.getNr()); %></option><%}%>
            </select>
                   </fieldset><br/>

            <input type="hidden" name="idFuncionario" 
                   value="<%out.write("" + f.getIdFuncionario());%>" /><br />

            <input type="submit" value="Alterar" onclick="location.href = 'consultafuncionario.jsp';"/>
            <input type="reset" value="Cancelar" onclick="location.href = 'consultafuncionario.jsp';" />
        </form>  
        <script>

            function mask(o, f) {
                setTimeout(function () {
                    var v = mphone(o.value);
                    if (v != o.value) {
                        o.value = v;
                    }
                }, 1);
            }

            function mphone(v) {
                var r = v.replace(/\D/g, "");
                r = r.replace(/^0/, "");
                if (r.length > 10) {
                    r = r.replace(/^(\d\d)(\d{5})(\d{4}).*/, "($1) $2-$3");
                } else if (r.length > 5) {
                    r = r.replace(/^(\d\d)(\d{4})(\d{0,4}).*/, "($1) $2-$3");
                } else if (r.length > 2) {
                    r = r.replace(/^(\d\d)(\d{0,5})/, "($1) $2");
                } else if (r.length > 1){
                    r = r.replace(/^(\d*)/, "($1");
                } else {
                    r = r.replace(/^(\d*)/, "$1");
                }
                return r;
            }
            
        </script>    
    </body>      
</html>
