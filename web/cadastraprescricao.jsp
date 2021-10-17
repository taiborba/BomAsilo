<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Clinico"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Medicamento"%>
<%@page import="modelos.Paciente"%>
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
                    Paciente pa = new Paciente();
                    List<Paciente> pac = pa.consultarGeral();

                    Clinico clinico = new Clinico();
                    List<Clinico> clin = clinico.consultarGeral();

                    Medicamento medicamento = new Medicamento();
                    List<Medicamento> med = medicamento.consultarGeral();
                %>
                <div class="container">
                <form action="recebedadosprescricao.jsp" method="POST" id="bomasilo" action="">
                    <h3>Cadastro de Prescrição </h3><br />
                    
                    <fieldset>
                        <label>Selecione o Paciente 
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
                        <label>Clinico <br />
                            <select name="idClinico">
                                <option value="" hidden disabled selected> --Selecione o Clinico--</option>
                                <% for (Clinico c : clin) { %>
                                <option value="<%out.write("" + c.getIdClinico());%>">
                                    <% out.write(c.getNomeClinico() + " - " + c.getEspecialidadeClinico().getDescEspecialidade()); %></option><%}%>
                            </select> 
                        </label> 
                        <a href="cadastraclinico.jsp" target="_blank"> Cadastrar Clinico </a>
                    </fieldset><br />

                    <fieldset>
                        <label>Medicamento <br />
                        <select name="idMedicamento">
                            <option value="" hidden disabled selected> --Selecione o Medicamento--</option>
                            <% for (Medicamento m : med) { %>
                            <option value="<%out.write("" + m.getIdMedicamento());%>">
                                <% out.write(m.getNomeMedicamento()); %></option><%}%>
                        </select><br />
                        <a href="cadastramedicamento.jsp" target="_blank"> Cadastrar Medicamento </a>
                    </fieldset><br />

                    <fieldset>
                        <label>Data Consulta</label>
                        <input id="dataConsulta" name="dataConsulta" type="date" required="required" min="1900-01-01" max="2999-12-31"/> <br />
                    </fieldset><br />
                        
                    <fieldset>
                        <label>Hora Consulta</label>
                        <input id="horaConsulta" name="horaConsulta" type="time" required="required" />
                    </fieldset><br />

                    <fieldset>    
                        <label>Descrição Orientação</label>
                        <input id="descOrientacao" name="descOrientacao" type="text" maxlength="40"/>
                    </fieldset>

                    <fieldset>    
                        <label>Descrição Posologia</label>
                        <input id="descPosologia"  name="descPosologia" type="text" maxlength="40"/>
                    </fieldset><br/>

                        <input type="button" value="Salvar" onclick="enviarDados()" />
                        <input type="reset" value="Cancelar" onclick= "window.top.location.href = 'menu.jsp';" />
                </form>
            </div>
        <script>
            function enviarDados() {
                var dataConsulta = document.getElementsByName("dataConsulta");
                if (dataConsulta[0].value === "") {
                    dataConsulta[0].focus();
                    alert("Informe a data da consulta");
                    exit();
                }

                var descPosologia = document.getElementsByName("descPosologia");
                if (descPosologia[0].value === "") {
                    descPosologia[0].focus();
                    alert("Informe a descrição da posologia");
                    exit();
                }

                var cpfPaciente = document.getElementsByName("cpfPaciente");
                if (cpfPaciente[0].value === "") {
                    cpfPaciente[0].focus();
                    alert("Informe o Cpf do Paciente");
                    exit();
                }

                var idClinico = document.getElementsByName("idClinico");
                if (idClinico[0].value === "") {
                    idClinico[0].focus();
                    alert("Informe o Clinico");
                    exit();
                }

                var idMedicamento = document.getElementsByName("idMedicamento");
                if (idMedicamento[0].value === "") {
                    idMedicamento[0].focus();
                    alert("Informe o Medicamento");
                    exit();
                }
                document.forms[0].submit();
            }
        </script>    
    </body>
</html>