<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Endereco"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Paciente"%>
<%@page import="modelos.Quarto"%>
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
                } else if ((p1 !== "adm") && (p1 !== "profsaude")) {
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
                    Integer idPaciente = Integer.parseInt(request.getParameter("idPaciente"));
                    Paciente p = new Paciente();
                    if (idPaciente != null) {
                        p = p.consultarPacienteId(idPaciente);
                    }
                %>   

                <%
                    Endereco endereco = new Endereco();
                    List<Endereco> end = endereco.consultarGeral();

                    Quarto quarto = new Quarto();
                    List<Quarto> qua = quarto.consultarGeral();

                %>  
                <div class="container">
                <form action="recebeeditapaciente.jsp" method="POST" id="bomasilo" action="" >
                    <h3>Editar Paciente</h3> 
                    <input type="hidden" name="idPaciente" value="<%out.write("" + p.getIdPaciente());%>" />

                    <fieldset>
                    <label>CPF</label>
                    <input type="text" name="cpfPaciente" value="<%out.write("" + p.getCpfPaciente());%>" maxlength="14" /> 
                    </fieldset>

                    <fieldset>
                    <label>Rg</label>
                    <input type="text" name="rg"  value="<%out.write("" + p.getRg());%>" maxlength="14" /> 
                    </fieldset>

                    <fieldset>
                    <label>Nome</label>
                    <input type="text" name="nome" required="required" maxlength="100" value="<%out.write("" + p.getNome());%>" />
                    <label id="validanome" class="validacampos"></label>
                    </fieldset>

                    <fieldset>
                    <label>Data de Nascimento</label>
                    <input type="date" name="dataNascimento" required="required" value="<%out.write("" + p.getDataNascimento());%>" />
                    <label id="validadata" class="validacampos"></label>
                    </fieldset>

                    <fieldset>
                    <label>Selecione o Quarto</label>
                    <select name="idQuarto">
                        <option value="<%out.write("" + p.getIdQuarto());%>">
                            <% out.write(p.getQuartoPaciente().getDescrQuarto()); %>
                        </option>
                        <% for (Quarto q : qua) { %>
                        <option value="<%out.write("" + q.getIdQuarto());%>">
                            <% out.write(q.getDescrQuarto()); %>
                        </option>
                        <%}%> 
                    </select> 
                    </fieldset>

                    <fieldset>
                    <label>Nome Contato</label>
                    <input type="text" name="nomeContato" maxlength="100" required="required" value="<%out.write("" + p.getNomeContato());%>" />
                    <label id="validanomecontato" class="validacampos"></label>  
                    </fieldset>

                    <fieldset>
                    <label>Telefone Contato</label>
                    <input type="text" name="foneContato" required="required" value="<%out.write("" + p.getFoneContato());%>" 
                           onkeypress="mask(this, mphone);" onblur="mask(this, mphone);" maxlength="20" /> 
                    <label id="validafonecontato" class="validacampos"></label>
                    </fieldset>

                           <fieldset>
                    <label>Selecione o Endereco </label> 
                    <select name="enderecoPaciente">
                        <option value="<%out.write("" + p.getEnderecoPaciente());%>">
                            <% out.write(p.getEnderecoCompletoPaciente().getCep() + " - "
                                        + p.getEnderecoCompletoPaciente().getRua() + " - "
                                        + p.getEnderecoCompletoPaciente().getNr()); %>
                            <% for (Endereco e : end) { %>
                        <option value="<%out.write("" + e.getIdEndereco());%>">
                            <% out.write(e.getCep() + " - " + e.getRua() + " - " + e.getNr()); %>
                        </option>
                        <%}%> 
                    </select>
                           </fieldset><br/>

                    <input type="submit" value="Alterar" onclick="location.href = 'consultapaciente.jsp';"/>
                    <input type="reset" value="Cancelar" onclick="location.href = 'consultapaciente.jsp';" />
                </form>
                </div>
            </body>
    <script>
        if (document.getElementByName("nome").value === "") {
            document.getElementByName("validanome").innerHTML = "Informe o NOME";
            nome[0].focus();
            exit(0);
        }

        if ((document.getElementByName("datanasc").value === "")) {
            document.getElementByName("validadata").innerHTML = "Informe ao DATA";
            datanasc[0].focus();
            exit(0);
        }

        if (document.getElementByName("idquarto").value === "") {
            document.getElementByName("validaquarto").innerHTML = "Informe o QUARTO";
            quarto[0].focus();
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
                } else if (r.length > 1){
                    r = r.replace(/^(\d*)/, "($1");
                } else {
                    r = r.replace(/^(\d*)/, "$1");
                }
                return r;
            }
    </script>                         
</html>
