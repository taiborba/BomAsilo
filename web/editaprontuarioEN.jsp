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
                    alert("You need to login first!");
                    window.top.location.href = "indexEN.html";
                } else if ((p1 !== "adm") && (p1 !== "profsaude")) {
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
    <body>
        <%
            String idProntuario = request.getParameter("idProntuario");
            Prontuario p = new Prontuario();
            if (idProntuario != null) {
                p = p.consultarProntuario(Integer.parseInt(idProntuario));
            }

            Paciente paciente = new Paciente();
            List<Paciente> pac = paciente.consultarGeral();
        %>
        <div class="container">
            <form action="recebeeditaprontuarioEN.jsp" method="POST" id="bomasilo" action="" >
                <h3>Edit Prontuary</h3>

                <input type="hidden" name="idprontuario" value="<%out.write("" + p.getIdProntuario());%>">

                <fieldset>
                    <label>Select Patient </label> 
                    <select name="cpfPaciente">
                        <% if (p.getCpfPaciente() != null) {%>
                        <option value="<%out.write("" + p.getCpfPaciente());%>"><%out.write("" + p.getPacienteProntuario().getNome());%></option> 
                        <%} else {%>
                        <option value="" hidden disabled selected> --Select Patient--</option>
                        <%}%>
                        <% for (Paciente pa : pac) { %>
                        <option value="<%out.write("" + pa.getCpfPaciente());%>">
                            <% out.write(pa.getNome()); %></option><%}%>
                    </select> 
                </fieldset>

                <fieldset>
                    <label>Doctor Appointment Date</label>
                    <input type="date" name="dataConsulta" value="<%out.write("" + pr.getDataConsulta());%>" />
                </fieldset>

                <fieldset>
                    <label>Blood Type</label>
                    <input type="text"  name="tiposangue" maxlength="3" 
                           value="<%out.write(p.getTipoSangue());%>"/>
                </fieldset>

                <fieldset>
                    <label>Weight</label>
                    <input type="text" name="peso" maxlength="5"
                           value="<%out.write("" + p.getPeso());%>"/>
                </fieldset>

                <fieldset>
                    <label>Height</label>
                    <input type="text" name="altura" maxlength="5" 
                           value="<%out.write("" + p.getAltura());%>"/>
                </fieldset>

                <input type="hidden" name="imc" value="<%out.write("" + p.getImc());%>"/> 

                <fieldset>
                    <label>Allergy</label>
                    <input type="text" name="descAlergia" maxlength="75"
                           value="<%out.write(p.getDescAlergia());%>" />
                </fieldset>

                <fieldset>
                    <label>Occupation</label>
                    <input type="text" name="descOcupacao" maxlength="75"
                           value="<%out.write(p.getDescOcupacao());%>"/> 
                </fieldset>

                <fieldset>
                    <label>Other Limitation</label>
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
                           >Cognitive Limitation?  </input> 
                </fieldset>

                <fieldset>
                    <input type="checkbox" 
                           name="limitLocomocao" 
                           <%
                               if (p.isLimitLocomocao()) {
                                   out.write("checked");
                               }
                           %>
                           >Locomotive Limitation?  </input>
                </fieldset>

                <fieldset>
                    <input type="checkbox" 
                           name="limitVisao" 
                           <%
                               if (p.isLimitVisao()) {
                                   out.write("checked");
                               }
                           %>
                           >Visual Limitation?  </input> 
                </fieldset>

                <fieldset>
                    <input type="checkbox" 
                           name="limitAudicao" 
                           <%
                               if (p.isLimitAudicao()) {
                                   out.write("checked");
                               }
                           %>
                           >Auditory Limitation?  </input>
                </fieldset><br/>

                <input type="submit" value="Edit" onclick="location.href = 'consultaprontuarioEN.jsp';"/>
                <input type="reset" value="Cancel" onclick="location.href = 'consultaprontuarioEN.jsp';" />
            </form>
    </body>                     
</html>
