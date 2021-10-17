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
        <link rel="icon" type="image/favicon" href="imagens/favicon.ico" />
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
            Cargo cargo = new Cargo();
            List<Cargo> car = cargo.consultarGeral();

            Endereco endereco = new Endereco();
            List<Endereco> end = endereco.consultarGeral();

            Usuario usuario = new Usuario();
            List<Usuario> usu = usuario.consultarGeral();
        %>
     
         <label class="cabecalho" id="msg" id="bomasilo" action="" > 
            <%
                if (request.getParameter("pmensagem") != null) {
                    out.write(request.getParameter("pmensagem"));
                }
            %>
         </label>
            
        <div class="container">
            <form action="recebedadosfuncionario.jsp" method="POST" id="bomasilo" action="">
        <h3>Cadastrar Funcionário</h3><br />
        
          <script>
                    function ValidaCPF() {
                        var RegraValida = document.getElementById("RegraValida").value;
                        var cpfValido = /^(([0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2})|([0-9]{11}))$/;
                        if (cpfValido.test(RegraValida) === true) {
                            console.log("CPF Válido");
                        } else {
                            console.log("CPF Inválido");
                        }
                    }
                    function fMasc(objeto, mascara) {
                        obj = objeto;
                        masc = mascara;
                        setTimeout("fMascEx()", 1);
                    }

                    function fMascEx() {
                        obj.value = masc(obj.value);
                    }

                    function mCPF(cpf) {
                        cpf = cpf.replace(/\D/g, "");
                        cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
                        cpf = cpf.replace(/(\d{3})(\d)/, "$1.$2");
                        cpf = cpf.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
                        return cpf;
                    }

                </script>       

            <fieldset>
                <label>Nome </label>
                <input type="text" name="nome" /> 
            </fieldset>

            <fieldset>
                <label>CPF </label>
                <input id="cpfFuncionario" name="cpfFuncionario" type="text" required="required" maxlength="14"
                onkeydown="javascript: fMasc(this, mCPF);" onclick="ValidaCPF();" /> 
            </fieldset>

            <fieldset>
                <label>RG </label>
                <input type="text" name="rg" /> 
            </fieldset>

            <fieldset>
                <label>Cargo <br />
                    <select name="idCargo">
                        <option value="" hidden disabled selected> --Selecione o Cargo--</option>
                        <% for (Cargo c : car) {     %>
                        <option value="<%out.write("" + c.getIdCargo());%>">
                            <% out.write(c.getDescCargo()); %></option><%}%>
                    </select>
                </label>
                <a href="cadastracargo.jsp" target="_blank"> Cadastrar Cargo </a>
            </fieldset><br />

            <fieldset>
                <label>Registro Profissional </label>
                <input type="text" name="regProfissional" required="required"/>
            </fieldset>

            <fieldset>
                <label>Data de Admissao </label>
                <input type="date" name="dataAdmissao" required="required" min="1900-01-01" max="2999-12-31"/>
            </fieldset><br />

            <fieldset>
                <label>Data de Desligamento </label>
                <input type="date" name="dataDesliga"  /> 
            </fieldset><br />

            <fieldset>
                <label>E-mail: </label>
                <input type="text" name="emailFuncionario" required="required"/>
            </fieldset>

            <fieldset>
                <label>Telefone: </label>
                <input type="text" name="foneFuncionario" required="required"
                       onkeypress="mask(this, mphone);" onblur="mask(this, mphone);"/>
            </fieldset>

            <fieldset>
                <label>Login Funcionario <br />
                    <select name="loginFuncionario">
                        <br/><option value="" hidden disabled selected> --Selecione o Login--</option>                         <% for (Usuario u : usu) {     %>
                        <option value="<%out.write("" + u.getLogin());%>">
                            <% out.write(u.getLogin()); %></option><%}%>
                    </select>
                </label>
                <a href="cadastrausuario.jsp" target="_blank"> Cadastrar Login </a>
            </fieldset><br />

            <fieldset>
                <label>Selecione o Endereco 
                    <select name="enderecoFuncionario">
                        <option value="" hidden disabled selected> --Selecione o Endereço--</option>
                        <% for (Endereco e : end) { %>
                        <option value="<%out.write("" + e.getIdEndereco());%>">
                            <% out.write(e.getCep() + " - " + e.getRua() + " - " + e.getNr()); %></option><%}%>
                    </select>
                </label>
                <a href="cadastraendereco.jsp" target="_blank"> Cadastrar Endereço </a>
            </fieldset><br/>

                <input type="button" value="Salvar" onclick="enviarDados()" />
                <input type="reset" value="Cancelar" onclick= "window.top.location.href = 'menu.jsp';" />
               
        </form>
    </div>      
        <script>
            function enviarDados() {
                var nome = document.getElementsByName("nome");
                if (nome[0].value === "") {
                    nome[0].focus();
                    alert("Informe o Nome");
                    exit();
                }

                var cpfFuncionario = document.getElementsByName("cpfFuncionario");
                if (cpfFuncionario[0].value === "") {
                    cpfFuncionario[0].focus();
                    alert("Informe o CPF");
                    exit();
                }

                var rg = document.getElementsByName("rg");
                if (rg[0].value === "") {
                    rg[0].focus();
                    alert("Informe o RG");
                    exit();
                }
                var idCargo = document.getElementsByName("idCargo");
                if (idCargo[0].value === "") {
                    idCargo[0].focus();
                    alert("Informe o Id do Cargo");
                    exit();
                }

                var dataAdmissao = document.getElementsByName("dataAdmissao");
                if (dataAdmissao[0].value === "") {
                    dataAdmissao[0].focus();
                    alert("Informe a Data de Admissão");
                    exit();
                }


                var foneFuncionario = document.getElementsByName("foneFuncionario");
                if (foneFuncionario[0].value === "") {
                    foneFuncionario[0].focus();
                    alert("Informe o Telefone");
                    exit();
                }

                var loginFuncionario = document.getElementsByName("loginFuncionario");
                if (loginFuncionario[0].value === "") {
                    loginFuncionario[0].focus();
                    alert("Informe o Login");
                    exit();
                }

                var enderecoFuncionario = document.getElementsByName("enderecoFuncionario");
                if (enderecoFuncionario[0].value === "") {
                    EnderecoFuncionario[0].focus();
                    alert("Informe o Endereço");
                    exit();
                }

                document.forms[0].submit();
            }

            function mask(o, f) {
                setTimeout(function () {
                    var v = mphone(o.value);
                    if (v !== o.value) {
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

