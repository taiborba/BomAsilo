<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Paciente"%>
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
                
                <label class="cabecalho" id="msg" id="bomasilo" action=""> 
                    <%
                        if (request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));
                    %>
                </label>

                <%
                    Paciente paciente = new Paciente();
                    List<Paciente> pac = paciente.consultarGeral();
                %>
                <div class="container">
                <form action="recebedadosprontuario.jsp" method="POST" id="bomasilo" action="">
                        <h3>Cadastro de Prontuário </h3><br />
                        
                    <fieldset>
                        <label>Selecione o Paciente <br />
                            <select name="cpfPaciente">
                                <option value="" hidden disabled selected> --Selecione o Paciente--</option>
                                <% for (Paciente p : pac) { %>
                                <option value="<%out.write("" + p.getCpfPaciente());%>">
                                    <% out.write(p.getCpfPaciente() + " - " + p.getNome()); %></option><%}%>
                            </select>
                        </label>
                        <a href="cadastrapaciente.jsp" target="_blank"> Cadastrar Paciente </a>
                    </fieldset><br />

                   <fieldset>
                    <label>Data da Consulta</label>
                    <input id="dataConsulta" name="dataConsulta" type="date" required="required" min="1900-01-01" max="2999-12-31"/> <br/>
                    <input id="validadataConsulta" class="validacampos" type="hidden"/>
                    </fieldset><br />
                    
                    <fieldset>
                        <label>Tipo Sanguíneo</label>
                        <input type="text"  name="tipoSangue" maxlength="3" />
                    </fieldset>

                    <fieldset>
                        <label>Peso</label>
                        <input type="text" name="peso" maxlength="5"/>
                    </fieldset>

                    <fieldset>
                        <label>Altura</label>
                        <input type="text" name="altura"  placeholder="1.00" step="0.01" maxlength="5" />
                    </fieldset>

                    <fieldset>
                        <label>Alergia</label>
                        <input type="text" name="descAlergia" maxlength="75" /> 
                    </fieldset>

                    <fieldset>
                        <label>Ocupação</label>
                        <input type="text" name="descOcupacao" maxlength="75" /> 
                    </fieldset>
                    
                     <fieldset>
                        <label>Outra Limitação</label>
                        <input type="text" name="limitOutras" maxlength="40" />
                    </fieldset>
                    
                    <fieldset>
                        <label><input type="checkbox" id="limitCognitiva" name="limitCognitiva"/> Limitação Cognitiva?</label>
                    </fieldset>

                    <fieldset>
                        <label><input type="checkbox" id="limitLocomocao" name="limitLocomocao"/> Limitação Locomotiva?</label>
                    </fieldset>

                    <fieldset>
                        <label><input type="checkbox" id="limitVisao" name="limitVisao"/> Limitação Visual?</label>
                    </fieldset>

                    <fieldset>
                        <label><input type="checkbox" id="limitAudicao" name="limitAudicao"/> Limitação Auditiva?</label>    
                    </fieldset><br/>
                   
                        <input type="button" value="Salvar" onclick="enviarDados()" />
                        <input type="reset" value="Cancelar" onclick= "window.top.location.href = 'menu.jsp';" />
                    
                </form>
                </div>
        <script>
            function enviarDados() {
                var tipoSangue = document.getElementsByName("tipoSangue");
                if (tipoSangue[0].value === "") {
                    tipoSangue[0].focus();
                    alert("Informe o Tipo Sanguineo");
                    exit();
                }

                var peso = document.getElementsByName("peso");
                if (peso[0].value === "") {
                    peso[0].focus();
                    alert("Informe o Peso ");
                    exit();
                }

                var altura = document.getElementsByName("altura");
                if (altura[0].value === "") {
                    altura[0].focus();
                    alert("Informe a Altura");
                    exit();
                }

                document.forms[0].submit();
            }

        </script>    
    </body>
</html>