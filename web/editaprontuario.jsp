<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Prontuario"%>
<%@page import="modelos.Paciente"%>
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
    <body>
        <%
            String idProntuario = request.getParameter("idProntuario");
            Prontuario p = new Prontuario();
            if (idProntuario != null) {
                p = p.consultarProntuario(Integer.parseInt(idProntuario));
            }
        %>
        <%
            Paciente paciente = new Paciente();
            List<Paciente> pac = paciente.consultarGeral();
        %>
        <div class="container">
            <form action="recebeeditaprontuario.jsp" method="POST" id="bomasilo" action="" >
                <h3>Editar Prontuario</h3>

                <input type="hidden" name="idprontuario" value="<%out.write("" + p.getIdProntuario());%>">

                <fieldset>
                    <label>Selecione o Paciente </label> 
                    <select name="cpfPaciente">
                        <% if (p.getCpfPaciente() != null) {%>
                        <option value="<%out.write("" + p.getCpfPaciente());%>"><%out.write("" + p.getPacienteProntuario().getNome());%></option> 
                        <%} else {%>
                        <option value="" hidden disabled selected> --Selecione o Paciente--</option>
                        <%}%>
                        <% for (Paciente pa : pac) { %>
                        <option value="<%out.write("" + pa.getCpfPaciente());%>">
                            <% out.write(pa.getNome()); %></option><%}%>
                    </select> 
                </fieldset>

                <fieldset>
                    <label>Data da Consulta</label>
                    <input type="date" name="dataConsulta" value="<%out.write("" + p.getDataConsulta());%>" />
                </fieldset>

                <fieldset>
                    <label>Tipo Sanguineo</label>
                    <input type="text"  name="tiposangue" maxlength="3" 
                           value="<%out.write(p.getTipoSangue());%>"/>
                </fieldset>

                <fieldset>
                    <label>Peso</label>
                    <input type="text" name="peso" maxlength="5"
                           value="<%out.write("" + p.getPeso());%>"/>
                </fieldset>

                <fieldset>
                    <label>Altura</label>
                    <input type="text" name="altura" maxlength="5" 
                           value="<%out.write("" + p.getAltura());%>"/>
                </fieldset>

                <input type="hidden" name="imc" value="<%out.write("" + p.getImc());%>"/> 

                <fieldset>
                    <label>Alergia</label>
                    <input type="text" name="descAlergia" maxlength="75"
                           value="<%out.write(p.getDescAlergia());%>" />
                </fieldset>

                <fieldset>
                    <label>Ocupação</label>
                    <input type="text" name="descOcupacao" maxlength="75"
                           value="<%out.write(p.getDescOcupacao());%>"/> 
                </fieldset>

                <fieldset>
                    <label>Outra Limitação</label>
                    <input type="text" name="limitOutras" maxlength="40"
                           value="<%out.write(p.getLimitOutras());%>" />
                </fieldset>

                <fieldset>
                    <input type="checkbox" 
                           name="limitCognitiva" 
                           <%
                               if (p.isLimitCognitiva()) {
                                   out.write("checked");
                               }
                           %>
                           >Limitação Cognitiva?  </input> 
                </fieldset>

                <fieldset>
                    <input type="checkbox" 
                           name="limitLocomocao" 
                           <%
                               if (p.isLimitLocomocao()) {
                                   out.write("checked");
                               }
                           %>
                           >Limitação Locomotiva?  </input>
                </fieldset>

                <fieldset>
                    <input type="checkbox" 
                           name="limitVisao" 
                           <%
                               if (p.isLimitVisao()) {
                                   out.write("checked");
                               }
                           %>
                           >Limitação Visual?  </input> 
                </fieldset>

                <fieldset>
                    <input type="checkbox" 
                           name="limitAudicao" 
                           <%
                               if (p.isLimitAudicao()) {
                                   out.write("checked");
                               }
                           %>
                           >Limitação Auditiva?  </input>
                </fieldset><br/>

                <input type="submit" value="Alterar" onclick="location.href = 'consultaprontuario.jsp';"/>
                <input type="reset" value="Cancelar" onclick="location.href = 'consultaprontuario.jsp';" />
            </form>
    </body>                     
</html>
