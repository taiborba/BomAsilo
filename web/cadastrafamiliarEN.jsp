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
<%@page import="modelos.Usuario"%>
<%@page import="modelos.Endereco"%>
<%@page import="modelos.Paciente"%>
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
        <link rel="icon" type="image/favicon" href="imagens/favicon.ico" />
    </head>
    <header>
        <script>
            function validaAcesso(p1) {
                if (p1 === "") {
                    alert("You need to login first!");
                    window.top.location.href = "index.html";
                } else if (p1 !== "adm") {
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
                <label class="cabecalho" id="msg" id="bomasilo" action=""> 
                    <%
                        if (request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));
                    %>
                </label>

                <%
                    Usuario usuario = new Usuario();
                    List<Usuario> usu = usuario.consultarGeral();

                    Endereco endereco = new Endereco();
                    List<Endereco> end = endereco.consultarGeral();

                    Paciente paciente = new Paciente();
                    List<Paciente> pac = paciente.consultarGeral();
                %>

                <script>
                    function ValidaCPF() {
                        var RegraValida = document.getElementById("RegraValida").value;
                        var cpfValido = /^(([0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2})|([0-9]{11}))$/;
                        if (cpfValido.test(RegraValida) == true) {
                            console.log("Valid CPF");
                        } else {
                            console.log("Invalid CPF");
                        }
                    }
                    function fMasc(objeto, mascara) {
                        obj = objeto
                        masc = mascara
                        setTimeout("fMascEx()", 1)
                    }

                    function fMascEx() {
                        obj.value = masc(obj.value)
                    }

                    function mCPF(cpf) {
                        cpf = cpf.replace(/\D/g, "")
                        cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
                        cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2")
                        cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2")
                        return cpf
                    }

                </script>
                <div class="container" >
                <form action="recebedadosfamiliarEN.jsp" method="POST" id="bomasilo" action="">
                    <h3>Family Register </h3><br/>
                    
                    <fieldset>
                        <label>Name</label>
                        <input id="nome" name="nome" type="text" required="required" maxlength="100"/> <br />
                        <label id="validanome" class="validacampos"></label>
                    </fieldset>

                    <fieldset>
                        <label>CPF</label>
                        <input id="cpfFamiliar" name="cpfFamiliar" type="text"  value=""  maxlength="14"
                               onkeydown="javascript: fMasc(this, mCPF);" onclick="ValidaCPF();"><br />
                        <label id="validacpf" class="validacampos"></label> 
                    </fieldset>

                    <fieldset>
                        <label>Rg</label>
                        <input id="rg" name="rg" type="text" required="required" maxlength="14" /> <br />
                        <label id="validarg" class="validacampos"></label>
                    </fieldset>

                    <fieldset>
                        <label>Phone Number</label>
                        <input id="foneFixo" name="foneFixo" type="text" required="required" maxlength="15" 
                               onkeypress="mask(this, mphone);" onblur="mask(this, mphone);"/> <br />
                        <label id="validaFoneFixo" class="validacampos"></label>
                    </fieldset>

                    <fieldset>
                        <label>Phone Number 2</label>
                        <input id="foneCelular" name="foneCelular" type="text" required="required" maxlength="15" 
                               onkeypress="mask(this, mphone);" onblur="mask(this, mphone);"/> <br />
                        <label id="validaFoneCelular" class="validacampos"></label>
                    </fieldset>

                    <fieldset>
                        <label>Login<br />
                            <select name="loginFamiliar">
                                <option value="" hidden disabled selected> --Select Login--</option>
                                <% for (Usuario u : usu) {     %>
                                <option value="<%out.write("" + u.getLogin());%>">
                                    <% out.write(u.getLogin()); %></option><%}%>
                            </select>
                        </label>
                        <a href="cadastrausuarioEN.jsp" target="_blank"> Register User </a><br />
                    <fieldset><br />

                    <fieldset>
                        <label>Address 
                            <select name="enderecoFamiliar">
                                <option value="" hidden disabled selected> --Select the Address--</option>
                                <% for (Endereco e : end) { %>
                                <option value="<%out.write("" + e.getIdEndereco());%>">
                                    <% out.write(e.getCep() + " - " + e.getRua() + " - " + e.getNr()); %></option><%}%>
                            </select>
                        </label>
                        <a href="cadastraenderecoEN.jsp" target="_blank"> Register Address </a> <br />
                    </fieldset><br />

                    <fieldset>
                        <label>Patient  
                            <select name="cpfPaciente">
                                <option value="" hidden disabled selected> --Select the Patient--</option>
                                <% for (Paciente p : pac) { %>
                                <option value="<%out.write("" + p.getCpfPaciente());%>">
                                    <% out.write(p.getCpfPaciente() + " - " + p.getNome()); %></option><%}%>
                            </select>
                        </label>
                            </fieldset>
                        <a href="cadastrapacienteEN.jsp" target="_blank"> Register Patient </a> <br /><br />
                    

                        <input type="button" value="Save" onclick="enviarDados()" />
                        <input type="reset" value="Cancel" onclick= "window.top.location.href = 'menuEN.jsp';" />
                    </div>
                </form>
        <script>
            function enviarDados() {
                var nome = document.getElementsByName("nome");
                if (nome[0].value === "") {
                    nome[0].focus();
                    alert("Enter the Family Member's Name");
                    exit(0);
                }

                var cpfFamiliar = document.getElementsByName("cpfFamiliar");
                if (cpfFamiliar[0].value === "") {
                    cpfFamiliar[0].focus();
                    alert("Enter the CPF");
                    exit(0);
                }

                var rg = document.getElementsByName("rg");
                if (rg[0].value === "") {
                    rg[0].focus();
                    alert("Enter the RG");
                    exit(0);
                }


                var foneCelular = document.getElementsByName("foneCelular");
                if (foneCelular[0].value === "") {
                    foneCelular[0].focus();
                    alert("Enter the Phone Number");
                    exit(0);
                }

                var cpfPaciente = document.getElementsByName("cpfPaciente");
                if (cpfPaciente[0].value === "") {
                    cpfPaciente[0].focus();
                    alert("Enter the Patient");
                    exit(0);
                }

                var enderecoFamiliar = document.getElementsByName("enderecoFamiliar");
                if (enderecoFamiliar[0].value === "") {
                    enderecoFamiliar[0].focus();
                    alert("Enter your Address");
                    exit(0);
                }
                document.forms[0].submit();
            }
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
                } else if (r.length > 1) {
                    r = r.replace(/^(\d*)/, "($1");
                } else {
                    r = r.replace(/^(\d*)/, "$1");
                }
                return r;
            }

        </script>    
    </body>
</html>