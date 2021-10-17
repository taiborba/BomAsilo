<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
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
                } else if (p1 !== "adm") {
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
                        Integer idQuarto = Integer.parseInt(request.getParameter("idQuarto"));
                        Quarto q = new Quarto();
                        if (idQuarto != null) {
                            q = q.consultarQuarto(idQuarto);
                        }
                    %>
                    <div class="container">
                    <form action="recebeeditaquarto.jsp" method="POST" id="bomasilo" action="" >
                        <h3>Editar Quarto</h3> 
                        
                        <input type="hidden" name="idQuarto" value="<%out.write("" + q.getIdQuarto());%>" />

                        <fieldset>
                        <label>Descrição do Quarto</label>
                        <input type="text" name="descrQuarto" maxlength="40"
                               value="<%out.write("" + q.getDescrQuarto());%>" />
                        </fieldset><br/>

                        <input type="submit" value="Alterar" onclick="location.href = 'consultaquarto.jsp';" />
                        <input type="reset" value="Cancelar" onclick="location.href = 'consultaquarto.jsp';" />
                    </form>
                </body>             
</html>
