<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Especialidade"%>
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
                    Integer idEspecialidade = Integer.parseInt(request.getParameter("idEspecialidade"));
                    Especialidade e = new Especialidade();
                    if (idEspecialidade != null) {
                        e = e.consultarEspecialidade(idEspecialidade);
                    }
                %>
                <div class="container">
                <form action="recebeeditaespecial.jsp" method="POST" id="bomasilo" action="" >
                    <h3>Editar Especialidade</h3>
                    
                    <fieldset>
                    <label>Descrição Especialidade</label>
                    <input type="text" name="descEspecialidade" 
                           value="<%out.write("" + e.getDescEspecialidade());%>" maxlength="40"/>
                    </fieldset>
                    
                    <input type="hidden" name="idEspecialidade" 
                           value="<%out.write("" + e.getIdEspecialidade());%>" />

                    <input type="submit" value="Alterar" onclick="location.href = 'consultaespecialidade.jsp';" />
                    <input type="reset" value="Cancelar" onclick="location.href = 'consultaespecialidade.jsp';" />
                </form>
                </div>
            </body>
</html>