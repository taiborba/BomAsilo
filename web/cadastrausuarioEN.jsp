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
                    alert("You need to login first!");
                    window.top.location.href = "index.html";
                } else if (p1 !== "adm") {
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

        <label class="cabecalho" id="msg" id="bomasilo" action="" >
            <%
                if (request.getParameter("pmensagem") != null) {
                    out.write(request.getParameter("pmensagem"));
                }
            %>
        </label>
        <div class="container">
            <form action="recebedadosusuarioEN.jsp" method="POST" id="bomasilo" action="" >
                <h3>Register User</h3><br />

                <fieldset>
                    <label>E-mail </label>
                    <input type="text" name="emailUsuario" maxlength="100" />
                </fieldset>

                <fieldset>
                    <label>Login </label>
                    <input type="text" name="login" maxlength="75" />
                </fieldset>

                <fieldset>
                    <label>Password </label>
                    <input type="password" name="senha" maxlength="30" />
                </fieldset>

                <fieldset>
                    <label>Acess Type: </label>
                    <fieldset> 
                        <label for="adm"><input type="radio" id="adm" name="tipoAcesso" value="adm"> Administrator</label>
                    </fieldset>
                    <fieldset>
                        <label for="familiar"><input type="radio" id="familiar" name="tipoAcesso" value="familiar"> Family Member</label>
                    </fieldset>
                    <fieldset>
                        <label for="profSaude"><input type="radio" id="proSaude" name="tipoAcesso" value="profsaude"> Health Professional</label>
                    </fieldset>
                </fieldset>
                <br />
                <input type="button" value="Save" onclick="enviarDados()" />
                <input type="reset" value="Cancel" onclick= "window.top.location.href = 'menuEN.jsp';" />
            </form>
        </div>
        <script>
            function enviarDados() {
                var emailUsuario = document.getElementsByName("emailUsuario");
                if (emailUsuario[0].value === "") {
                    emailUsuario[0].focus();
                    alert("Enter User's E-mail");
                    exit();
                }

                var login = document.getElementsByName("login");
                if (login[0].value === "") {
                    login[0].focus();
                    alert("Enter Login");
                    exit();
                }

                var senha = document.getElementsByName("senha");
                if (senha[0].value === "") {
                    senha[0].focus();
                    alert("Enter New Password");
                    exit();
                }

                var tipoAcesso = document.getElementsByName("tipoAcesso");
                if (tipoAcesso[0].value === "") {
                    tipoAcesso[0].focus();
                    alert("Enter Type of Acess");
                    exit();
                }
                document.forms[0].submit();
            }
            function enviaForm() {
                document.forms[0].submit();
                response.sendRedirect("nulo.html");
            }
        </script>
    </body>
</html>
