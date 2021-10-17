<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Familiar"%>
<%@page import="modelos.Paciente"%>
<%@page import="modelos.Usuario"%>
<%@page import="modelos.Endereco"%>
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
                        Integer pidFamiliar = Integer.parseInt(request.getParameter("idFamiliar"));
                        Familiar f = new Familiar();
                        if (pidFamiliar != null) {
                            f = f.consultarFamiliar(pidFamiliar);
                        }
                    %>

                    <%
                        Usuario usuario = new Usuario();
                        List<Usuario> usu = usuario.consultarGeral();

                        Endereco endereco = new Endereco();
                        List<Endereco> end = endereco.consultarGeral();

                        Paciente paciente = new Paciente();
                        List<Paciente> pac = paciente.consultarGeral();
                    %>
                    <div class="container">
                    <form action="recebeeditafamiliar.jsp" method="POST" id="bomasilo" action="" >
                        <h3>Edit Family</h3>
                        
                        <fieldset>
                        <label>Name</label>
                        <input type="text" name="nome" 
                               value="<%out.write(f.getNome());%>" 
                               maxlength="100"/>
                        </fieldset>

                               <fieldset>
                        <label>CPF</label>
                        <input type="text" name="cpfFamiliar" 
                               value="<%out.write(f.getCpfFamiliar());%>" 
                               maxlength="14"/>
                               </fieldset>

                               <fieldset>
                        <label>RG</label>
                        <input type="text" name="rg" 
                               value="<%out.write(f.getRg());%>" 
                               maxlength="14"/>
                               </fieldset>

                               <fieldset>
                        <label>Phone Number</label>
                        <input type="text" name="foneFixo" 
                               value="<%out.write("" + f.getFoneFixo());%>" 
                               maxlength="20" onkeypress="mask(this, mphone);" onblur="mask(this, mphone);"/>
                               </fieldset>

                               <fieldset>
                        <label>Phone Number 2</label>
                        <input type="text" name="foneCelular" 
                               value="<%out.write("" + f.getFoneCelular());%>" 
                               maxlength="20" onkeypress="mask(this, mphone);" onblur="mask(this, mphone);"/>
                               </fieldset>

                               <fieldset>
                        <label>Select Patient </label> 
                        <select name="cpfPaciente">
                            <% if (f.getCpfPaciente() != null) {%>
                            <option value="<%out.write("" + f.getCpfPaciente());%>"><%out.write("" + f.getPacienteFamiliar().getNome());%></option> 
                            <%} else {%>
                            <option value="" hidden disabled selected> --Select Patient--</option>
                            <%}%>
                            <% for (Paciente p : pac) { %>
                            <option value="<%out.write("" + p.getCpfPaciente());%>">
                                <% out.write(p.getNome()); %></option><%}%>
                        </select>
                               </fieldset>

                        <fieldset>
                        <label>Login</label>
                        <select name="loginFamiliar">
                            <% if (f.getLoginFamiliar() != null) {%>
                            <option value="<%out.write("" + f.getLoginFamiliar());%>"><%out.write("" + f.getLoginFamiliar());%></option> 
                            <%} else {%>
                            <option value="" hidden disabled selected> --Select Login--</option>
                            <%}%>
                            <% for (Usuario u : usu) {     %>
                            <option value="<%out.write("" + u.getLogin());%>">
                                <% out.write(u.getLogin()); %></option><%}%>
                        </select> 
                        </fieldset>

                        <fieldset>
                        <label>Select Address </label> 
                        <select name="enderecoFamiliar">
                                <% if (f.getEnderecoFamiliar() != null) {%>
                                <option value="<%out.write("" + f.getEnderecoFamiliar());%>"><%out.write(""
                                        + f.getEnderecoCompletoFamiliar().getCep() + " - " + f.getEnderecoCompletoFamiliar().getRua() + " - " + f.getEnderecoCompletoFamiliar().getNr());%></option> 
                                <%} else {%>
                            <option value="" hidden disabled selected> --Select Address--</option>
                            <%}%>
                            <% for (Endereco e : end) { %>
                            <option value="<%out.write("" + e.getIdEndereco());%>">
                                <% out.write(e.getCep() + " - " + e.getRua() + " - " + e.getNr()); %></option><%}%>
                        </select> 
                        </fieldset>

                        <input type="hidden" name="idFamiliar" 
                               value="<%out.write("" + f.getIdFamiliar());%>" /><br />

                        <input type="submit" value="Edit" onclick="location.href = 'consultafamiliarEN.jsp';"/>
                        <input type="reset" value="Cancel" onclick="location.href = 'consultafamiliarEN.jsp';" />
                    </form>
                               </div>
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
