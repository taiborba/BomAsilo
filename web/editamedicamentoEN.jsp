<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Medicamento"%>
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

        <%
            Integer idMedicamento = Integer.parseInt(request.getParameter("idMedicamento"));
            Medicamento m = new Medicamento();
            if (idMedicamento != null) {
                m = m.consultarMedicamentos(idMedicamento);
            }
        %>
        <div class="container">
        <form action="recebeeditamedicEN.jsp" method="POST" id="bomasilo" action="" >
            <h3>Edit Medicine</h3>
            <input type="hidden" name="idMedicamento" value="<%out.write("" + m.getIdMedicamento());%>" />

            <fieldset>
            <label>Name</label>
            <input type="text" name="nomeMedicamento" 
                   value="<%out.write(m.getNomeMedicamento());%>" maxlength="100"/>
            </fieldset>

            <fieldset>
            <input type="checkbox" 
                   name="indControlado" 
                   <%
                       if (m.isIndControlado()) {
                           out.write("checked");
                       }
                   %>
                   >Continuous Use?  </input> </fieldset><br/>

            <input type="submit" value="Edit" onclick="location.href = 'consultamedicamentoEN.jsp';"/>
            <input type="reset" value="Cancel" onclick="location.href = 'consultamedicamentoEN.jsp';" />
        </form>
    </body>                 
</html>
