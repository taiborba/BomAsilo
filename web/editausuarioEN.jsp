<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Usuario" %>
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
                        String login = request.getParameter("login");
                        Usuario u = new Usuario();
                        if (login != null) {
                            u = u.consultarUsuario(login);
                        }
                        String checkedAdm = "";
                        String checkedPSaude = "";
                        String checkedFamiliar = "";

                        switch (u.getTipoAcesso()) {
                            case "adm":
                                checkedAdm = "checked";
                            case "profsaude":
                                checkedPSaude = "checked";
                            case "familiar":
                                checkedFamiliar = "checked";
                        }

                    %>
                    <div class="container">
                    <form action="recebeeditausuarioEN.jsp" method="POST" id="bomasilo" action="" >
                        <h3>Edit User</h3> 
                        
                        <fieldset>
                        <label>E-mail</label>
                        <input type="text" name="emailUsuario" maxlength="100"
                               value="<%out.write(u.getEmailUsuario());%>" />
                        </fieldset>

                        <fieldset>
                        <label>Login</label>
                        <input type="text" name="login" maxlength="75"
                               value="<%out.write(u.getLogin());%>" />
                        </fieldset>

                        <fieldset>
                        <label>Password</label>
                        <input type="password" name="senha" maxlength="30"
                               value="<%out.write(u.getSenha());%>" />
                        </fieldset>

                        <fieldset>
                        <label>Acess Type:</label>
                        <label for="adm"><input type="radio" id="adm" name="tipoAcesso" value="adm" <%=checkedAdm%> >Administrator</label><br>
                                                <label for="familiar"><input type="radio" id="familiar" name="tipoAcesso" value="familiar" <%=checkedFamiliar%> >Family</label><br>
                                                <label for="profSaude"><input type="radio" id="proSaude" name="tipoAcesso" value="profsaude" <%=checkedPSaude%> >Health Professional/label><br>
                        </fieldset><br/>

                        <input type="submit" value="Edit" onclick="location.href = 'consultausuarioEN.jsp';" />
                        <input type="reset" value="Cancel" onclick="location.href = 'consultausuarioEN.jsp';" />
                    </form>
                    </div>
                </body>       
</html>
