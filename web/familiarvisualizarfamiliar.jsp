<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Endereco"%>
<%@page import="modelos.Paciente"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Familiar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            Familiar f = new Familiar();
            f = f.consultarFamiliar(usuarioLogado);

        %>

        <div class="container">
            <form action="recebeeditavisufamiliar.jsp"  method="POST" id="bomasilo" action="">
                <h3>Visualizar Meus Dados</h3><br/>

                <% if (f != null) { %>
                <input type="hidden" name="idFamiliar" value="<%out.write("" + f.getIdFamiliar());%>" />

                <fieldset>
                    <label> Nome: 
                        <td><% out.write(f.getNome()); %></td> 
                        <input type="hidden" name="nome" value="<%out.write("" + f.getNome());%>" /></label>
                </fieldset>

                <fieldset>
                    <label> Cpf: 
                        <td><% out.write(f.getCpfFamiliar()); %></td>
                        <input type="hidden" name="cpfFamiliar" value="<%out.write("" + f.getCpfFamiliar());%>" /></label>
                </fieldset

                <fieldset>
                    <label> Rg: 
                        <td><% out.write(f.getRg()); %></td>
                        <input type="hidden" name="rg" value="<%out.write("" + f.getRg());%>" /></label>
                </fieldset>

                <fieldset>
                    <label> Login: 
                        <td><% out.write(f.getLoginFamiliar()); %></td> 
                        <input type="hidden" name="loginFamiliar" value="<%out.write("" + f.getLoginFamiliar());%>" /></label>
                </fieldset>

                <fieldset>
                    <label> Endereco:  
                        <td><% out.write(f.getEnderecoCompletoFamiliar().getUf() + " - " + f.getEnderecoCompletoFamiliar().getCidade() + " - " + f.getEnderecoCompletoFamiliar().getBairro() + " - " + f.getEnderecoCompletoFamiliar().getNr()); %></td>
                        <input type="hidden" name="enderecoFamiliar" value="<%out.write("" + f.getEnderecoFamiliar());%>" /></label>
                </fieldset>

                <fieldset>
                    <label> Paciente: 
                        <td><% out.write(f.getCpfPaciente() + " - " + f.getPacienteFamiliar().getNome()); %></td>
                        <input type="hidden" name="cpfPaciente" value="<%out.write("" + f.getCpfPaciente());%>" /></label>
                </fieldset>
                
                 <fieldset>
                    <label> Fone Fixo: 
                        <input type="text" name="foneFixo" required="required" value="<%out.write("" + f.getFoneFixo());%>" 
                               onkeypress="mask(this, mphone);" onblur="mask(this, mphone);"/></label>
                    <label id="validafonefixo" class="validacampos"></label>
                </fieldset>

                <fieldset>
                    <label> Fone Celular: 
                        <input type="text" name="foneCelular" required="required" value="<%out.write("" + f.getFoneCelular());%>" 
                                onkeypress="mask(this, mphone);" onblur="mask(this, mphone);"/> </label>
                    <label id="validafonecelular" class="validacampos"></label>
                </fieldset><br/>

                <input type="submit" value="Alterar" onclick="window.top.location.href = 'familiarvisualizarfamiliar.jsp';"/>
                <input type="reset" value="Voltar" onclick="window.top.location.href = 'menufamiliar.jsp';" /><br />
                <%}%>
                <form/>

        </div>   
    </body>
    <script>
        if (document.getElementByName("foneFixo").value === "") {
            document.getElementByName("validafonefixo").innerHTML = "Informe o TELEFONE FIXO";
            foneFixo[0].focus();
            exit(0);
        }

        if (document.getElementByName("foneCelular").value === "") {
            document.getElementByName("validafonecelular").innerHTML = "Informe o TELEFONE CELULAR";
            foneCelular[0].focus();
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
