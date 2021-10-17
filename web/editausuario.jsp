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
                    <form action="recebeeditausuario.jsp" method="POST" id="bomasilo" action="" >
                        <h3>Editar Usuário</h3> 
                        
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
                        <label>Senha</label>
                        <input type="password" name="senha" maxlength="30"
                               value="<%out.write(u.getSenha());%>" />
                        </fieldset>

                        <fieldset>
                        <label>Tipo de Acesso:</label>
                        <label for="adm"><input type="radio" id="adm" name="tipoAcesso" value="adm" <%=checkedAdm%> >Administrador</label><br>
                                                <label for="familiar"><input type="radio" id="familiar" name="tipoAcesso" value="familiar" <%=checkedFamiliar%> >Familiar</label><br>
                                                <label for="profSaude"><input type="radio" id="proSaude" name="tipoAcesso" value="profsaude" <%=checkedPSaude%> >Prof. Saúde</label><br>
                        </fieldset><br/>

                        <input type="submit" value="Alterar" onclick="location.href = 'consultausuario.jsp';" />
                        <input type="reset" value="Cancelar" onclick="location.href = 'consultausuario.jsp';" />
                    </form>
                    </div>
                </body>       
</html>
