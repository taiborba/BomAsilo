<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Clinico"%>
<%@page import="modelos.Especialidade"%>
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
                } else if (p1 !== "adm") {
                    alert("Voc� n�o possui acesso a esta p�gina!");
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
                        Integer idClinico = Integer.parseInt(request.getParameter("idClinico"));

                        Clinico c = new Clinico();
                        if (idClinico != null) {
                            c = c.consultarClinico(idClinico);
                        }

                        Especialidade especialidade = new Especialidade();
                        List<Especialidade> esp = especialidade.consultarGeral();
                    %>
                    <div class="container">
                    <form action="recebeeditaclinico.jsp" method="POST" id="bomasilo" action="" >
                        <h3>Editar Cl�nico</h3>
                        <input type="hidden" name="idClinico" value="<%out.write("" + c.getIdClinico());%>" />

                        <fieldset>
                        <label>Nome</label>
                        <input type="text" name="nomeClinico"
                               value="<%out.write("" + c.getNomeClinico());%>" maxlength="100"/>
                        <label id="validanomeclinico" class="validacampos"></label>
                        </fieldset>

                        <fieldset>
                        <label>C�d. Registro Prossicional</label>
                        <input type="text" name="codRegistro" value="<%out.write("" + c.getCodRegistro());%>" maxlength="40"/><br />
                        </fieldset>
                        
                        <fieldset>
                        <label>Especialidade </label> 
                        <select name="idEspecialidade">
                                <% if (c.getIdEspecialidade() != null) {%>
                                <option value="<%out.write("" + c.getIdEspecialidade());%>"><%out.write(""
                                        + c.getEspecialidadeClinico().getDescEspecialidade());%></option> 
                                <%} else {%>
                            <option value="" hidden disabled selected> --Selecione Especialidade--</option>
                            <%}%>
                            <% for (Especialidade e : esp) { %>
                            <option value="<%out.write("" + e.getIdEspecialidade());%>">
                                <% out.write(e.getDescEspecialidade()); %></option><%}%>
                        </select> 
                        </fieldset>
                        </br>

                        <input type="submit" value="Salvar" onclick="location.href = 'consultaclinico.jsp';" />
                        <input type="reset" value="Cancelar" onclick="location.href = 'consultaclinico.jsp';" />
                    </form>
                        </div>
                </body>
</html>
