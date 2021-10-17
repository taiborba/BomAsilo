<!--
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Prontuario"%>
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

        <%                String usuarioLogado = "";

            if (session.getAttribute("usuarioLogado") != null) {
                usuarioLogado = session.getAttribute("usuarioLogado").toString();
            }
        %>
        <%
            Prontuario prontuario = new Prontuario();
            Paciente paciente = new Paciente();
            Familiar familiar = new Familiar();
            prontuario = prontuario.consultarProntuario(
                    paciente.consultarPaciente(
                            familiar.consultarFamiliar(usuarioLogado).getCpfPaciente()).getCpfPaciente());
        %>

        <label>
            <%
                if (request.getParameter("pmensagem") != null) {
                    out.write(request.getParameter("pmensagem"));
                }
            %>
        </label>
        <div class="container">
            <form method="POST" id="bomasilo" action="">
                <h3>Visualizar Prontuário</h3><br/>

            <% if (prontuario != null) { %>
                <fieldset>
                    <label> Paciente: 
                        <td><% out.write(prontuario.getPacienteProntuario().getNome() + " - " + prontuario.getCpfPaciente()); %></td></label>
                </fieldset>

                <fieldset> 
                    <label> Tipo Sanguineo: 
                        <td><% out.write(prontuario.getTipoSangue()); %></td></label>
                </fieldset>

                <fieldset>
                    <label> Limitação Cognitiva: 
                        <td><% out.write("" + prontuario.isLimitCognitiva()); %></td></label>
                </fieldset>

                <fieldset>
                    <label> Limitação Locomotiva:  
                        <td><% out.write("" + prontuario.isLimitLocomocao()); %></td></label>
                </fieldset>

                <fieldset>
                    <label> Limitação na Visão: 
                        <td><%out.write("" + prontuario.isLimitVisao());%> </td></label>
                </fieldset>


                <fieldset>
                    <label> Limitação Auditiva: 
                        <td><%out.write("" + prontuario.isLimitAudicao());%> </td></label>
                </fieldset>


                <fieldset>
                    <label> Outras Limitações: 
                        <td><% out.write(prontuario.getLimitOutras()); %></td></label>
                </fieldset>


                <fieldset>
                    <label> Alergia: 
                        <td><% out.write(prontuario.getDescAlergia()); %></td></label>
                </fieldset>


                <fieldset>
                    <label> Ocupação: 
                        <td><% out.write(prontuario.getDescOcupacao()); %></td></label>
                </fieldset>


                <fieldset>
                    <label> Peso: 
                        <td><% out.write("" + prontuario.getPeso()); %></td></label>
                </fieldset>


                <fieldset>
                    <label> Altura: 
                        <td><% out.write("" + prontuario.getAltura()); %></td></label>
                </fieldset>

                <fieldset>
                    <label> IMC: 
                        <td><% out.write("" + prontuario.getImc());%></td></label>
                </fieldset><br/>

                <input type="reset" value="Voltar" onclick="window.top.location.href = 'menufamiliar.jsp';" /><br />
             <%}%>
            </form>
        </div>
    </body>
</html>
