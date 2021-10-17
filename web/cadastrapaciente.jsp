<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="java.util.List"%>
<%@page import="modelos.Endereco"%>
<%@page import="modelos.Quarto"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
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
    <body>
        <header>
            <script>
                function validaAcesso(p1) {
                    if (p1 === "") {
                        alert("Realize o acesso!");
                        window.top.location.href = "index.html";
                    } else if ((p1 !== "adm") && (p1 !== "profsaude")) {
                        alert("Você não possui acesso a esta página!");
                        window.top.location.href = "menu.jsp";
                    }
                }
            </script> 
        </header>
                <label class="cabecalho" id="msg" id="bomasilo" action=""> 
                    <%
                        if (request.getParameter("pmensagem") != null) {
                            out.write(request.getParameter("pmensagem"));
                        }
                    %>
                </label>

                <%
                    Endereco endereco = new Endereco();
                    List<Endereco> end = endereco.consultarGeral();

                    Quarto quarto = new Quarto();
                    List<Quarto> qua = quarto.consultarGeral();

                %>  

                <script>
                    function ValidaCPF() {
                        var RegraValida = document.getElementById("RegraValida").value;
                        var cpfValido = /^(([0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2})|([0-9]{11}))$/;
                        if (cpfValido.test(RegraValida) == true) {
                            console.log("CPF Válido");
                        } else {
                            console.log("CPF Inválido");
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
                <div class="container">
                <form action="recebedadospaciente.jsp" method="POST" id="bomasilo" action="">
                    <h3>Cadastro de Pacientes </h3><br />

                    <fieldset>
                        <label>Nome
                            <input type="text" name="nome" required="required" maxlength="70"/> 
                        </label>
                    </fieldset>

                    <fieldset>
                        <label>Cpf
                            <input id="cpfPaciente" name="cpfPaciente" type="text" required="required" maxlength="14"
                                   onkeydown="javascript: fMasc(this, mCPF);" onclick="ValidaCPF();" >
                        </label> 
                    </fieldset>

                    <fieldset>
                        <label>RG
                            <input type="text" name="rg" required="required" maxlength="14"/> 
                        </label>
                    </fieldset>

                    <fieldset>
                        <label>Data de Nascimento <br />
                            <input type="date" name="dataNascimento" required="required" maxlength="10" min="1900-01-01" max="2999-12-31"/>
                        </label>
                    </fieldset>

                    <fieldset>
                        <label>Quarto <br />
                            <select name="idQuarto">
                                <option value="" hidden disabled selected> --Selecione o Quarto--</option>
                                <% for (Quarto q : qua) { %>
                                <option value="<%out.write("" + q.getIdQuarto());%>">
                                    <% out.write(q.getDescrQuarto()); %>
                                </option>
                                <%}%> 
                            </select>
                        </label>
                        <a href="cadastraquarto.jsp?origem=1" target="_blank"> Cadastrar Quarto </a>
                    </fieldset><br />

                    <fieldset>
                        <label>Selecione o Endereco 
                            <select name="enderecoPaciente">
                                <option value="" hidden disabled selected> --Selecione o Endereço--</option>
                                <% for (Endereco e : end) { %>
                                <option value="<%out.write("" + e.getIdEndereco());%>">
                                    <% out.write(e.getCep() + " - " + e.getRua() + " - " + e.getNr()); %></option><%}%>
                            </select>
                        </label> 
                        <a href="cadastraendereco.jsp" target="_blank"> Cadastrar Endereço </a>
                    </fieldset><br />

                    <fieldset>
                        <label>Nome para Contato
                            <input type="text" name="nomeContato" required="required" maxlength="40"/> 
                        </label>
                    </fieldset>

                    <fieldset>
                        <label>Telefone para Contato
                            <input type="text" name="foneContato" maxlength="20" 
                                   onkeypress="mask(this, mphone);" onblur="mask(this, mphone);" />
                        </label>
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
                    alert("Informe o nome");
                    exit();
                }

                var cpfPaciente = document.getElementsByName("cpfPaciente");
                if (cpfPaciente[0].value === "") {
                    cpfPaciente[0].focus();
                    alert("Informe o cpf do paciente");
                    exit();
                }

                var rg = document.getElementsByName("rg");
                if (rg[0].value === "") {
                    rg[0].focus();
                    alert("Informe o rg");
                    exit();
                }

                var dataNascimento = document.getElementsByName("dataNascimento");
                if (dataNascimento[0].value === "") {
                    dataNascimento[0].focus();
                    alert("Informe a data de nascimento");
                    exit();
                }


                var idQuarto = document.getElementsByName("idQuarto");
                if (idQuarto[0].value === "") {
                    idQuarto[0].focus();
                    alert("Informe o quarto");
                    exit();
                }

                var enderecoPaciente = document.getElementsByName("enderecoPaciente");
                if (enderecoPaciente[0].value === "") {
                    enderecoPaciente[0].focus();
                    alert("Informe o Endereco do Paciente");
                    exit();
                }

                var nomeContato = document.getElementsByName("nomeContato");
                if (nomeContato[0].value === "") {
                    nomeContato[0].focus();
                    alert("Informe o Nome para Contato");
                    exit();
                }

                var foneContato = document.getElementsByName("foneContato");
                if (foneContato[0].value === "") {
                    foneContato[0].focus();
                    alert("Informe o Telefone para Contato");
                    exit();
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