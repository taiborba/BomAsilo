<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Familiar"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/estilos.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstraf.getPacienteFamiliar().min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstraf.getPacienteFamiliar().min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>  
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
        <label>
            <%
                if (request.getParameter("pmensagem") != null) {
                    out.write(request.getParameter("pmensagem"));
                }
            %>
        </label>

        <%            
            String usuarioLogado = "";

            if (session.getAttribute("usuarioLogado") != null) {
                usuarioLogado = session.getAttribute("usuarioLogado").toString();

            }
            System.out.println("usuario: " + usuarioLogado);
        %>

        <%                   
            Familiar f = new Familiar();
            f = f.consultarFamiliar(usuarioLogado);
        %>

        <div class="container">
            <form action="recebeeditavisupaciente.jsp" method="POST" id="bomasilo" action="">
                <h3>Visualizar Paciente</h3><br/>

                <% if (f != null) { %>

                <input type="hidden" name="idPaciente" value="<%out.write("" + f.getPacienteFamiliar().getIdPaciente());%>" />


                <fieldset>
                    <label> Nome: 
                        <td><% out.write(f.getPacienteFamiliar().getNome()); %></td>
                        <input type="hidden" name="nome" value="<%out.write("" + f.getPacienteFamiliar().getNome());%>" />
                    </label>
                </fieldset>

                <fieldset>
                    <label> Cpf: 
                        <td><% out.write(f.getPacienteFamiliar().getCpfPaciente()); %></td> 
                        <input type="hidden" name="cpfPaciente" value="<%out.write(f.getPacienteFamiliar().getCpfPaciente());%>" />
                    </label>
                </fieldset>

                <fieldset>
                    <label> Rg: 
                        <td><% out.write(f.getPacienteFamiliar().getRg()); %></td>
                        <input type="hidden" name="rg" value="<%out.write("" + f.getPacienteFamiliar().getRg());%>" /> 
                    </label>
                </fieldset>

                <fieldset>
                    <label> Data de Nascimento: 
                        <%
                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                            String datanasc = sdf.format(f.getPacienteFamiliar().getDataNascimento());
                        %>
                        <td><% out.write(datanasc); %></td>
                        <input type="hidden" name="dataNascimento" value="<%out.write("" + f.getPacienteFamiliar().getDataNascimento());%>" />
                    </label>
                </fieldset>

                <fieldset>
                    <label> Quarto: 
                        <td><% out.write("" + f.getPacienteFamiliar().getQuartoPaciente().getDescrQuarto()); %></td>
                        <input type="hidden" name="idQuarto" value="<%out.write("" + f.getPacienteFamiliar().getIdQuarto());%>" />
                    </label>
                </fieldset>

                <fieldset>
                    <label> Endereco:  
                        <td><% out.write("" + f.getPacienteFamiliar().getEnderecoCompletoPaciente().getCep()
                                    + " - " + f.getPacienteFamiliar().getEnderecoCompletoPaciente().getRua()
                                    + " - " + f.getPacienteFamiliar().getEnderecoCompletoPaciente().getNr()
                                    + " - " + f.getPacienteFamiliar().getEnderecoCompletoPaciente().getComplemento()
                                    + " - " + f.getPacienteFamiliar().getEnderecoCompletoPaciente().getCidade()
                                    + " - " + f.getPacienteFamiliar().getEnderecoCompletoPaciente().getUf()); %></td>
                        <input type="hidden" name="enderecoPaciente" value="<%out.write("" + f.getPacienteFamiliar().getEnderecoPaciente());%>" />
                    </label> 
                </fieldset>

                <fieldset>
                    <label> Nome Contato: 
                        <input type="text" name="nomeContato" required="required" value="<%out.write("" + f.getPacienteFamiliar().getNomeContato());%>" /> 
                </fieldset>

                <fieldset>
                    <label> Telefone Contato: </label>
                    <input type="text" name="foneContato" required="required" value="<%out.write("" + f.getPacienteFamiliar().getFoneContato());%>" 
                           onkeypress="mask(this, mphone);" onblur="mask(this, mphone);"/>  
                    </label>
                </fieldset><br/>

                <input type="submit" value="Alterar" onclick="window.top.location.href = 'familiarvisualizarpaciente.jsp';"/>
                <input type="reset" value="Voltar" onclick="window.top.location.href = 'menufamiliar.jsp';" /><br />
                <%}%>
                <form/>
        </div>   
    </body>
    <script>
        if (document.getElementByName("nomeContato").value === "") {
            document.getElementByName("validanomecontato").innerHTML = "Informe o NOME DE CONTATO";
            nomeContato[0].focus();
            exit(0);
        }

        if (document.getElementByName("foneContato").value === "") {
            document.getElementByName("validafonecontato").innerHTML = "Informe o TELEFONE DE CONTATO";
            foneContato[0].focus();
            exit(0);
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
</html>
