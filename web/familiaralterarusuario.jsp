<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Familiar"%>
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
    </head>
    <header>
        <script>
            function validaAcesso(p1) {
                if (p1 === "") {
                    alert("Realize o acesso!");
                    window.top.location.href = "index.html";
                } else if (p1 !== "familiar") {
                    alert("Você não possui acesso a esta página!");
                    window.top.location.href = "menufamiliar.jsp";
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
            out.write("<script>validaAcesso('" + tipoAcesso + "');</script>");
        %>     
        <label>
            <%
            if (request.getParameter("pmensagem") != null) {
                out.write(request.getParameter("pmensagem"));
            }
            %>
        </label>

        <%
            String usuarioLogado = "";

            if (session.getAttribute("usuarioLogado") != null) {
                usuarioLogado = session.getAttribute("usuarioLogado").toString();

            } else {
                if (request.getParameter("login") != null) {
                    usuarioLogado = request.getParameter("login");
                }
            }
        %>

        <%
            Familiar f = new Familiar();
            f = f.consultarFamiliar(usuarioLogado);
        %>
        
        <div class="container">
            <form action="recebeeditavisuusuario.jsp" method="POST" id="bomasilo" action="">
                <h3>Visualizar Usuário</h3>
                <% if (f != null) { %>
                <input type="hidden" name="tipoAcesso" value="<%out.write("" + f.getUsuarioFamiliar().getTipoAcesso());%>" /><br />
                <input type="hidden" name="login" value="<%out.write(f.getUsuarioFamiliar().getLogin());%>"/>

                <fieldset>
                    <label> E-mail:</label> 
                    <input type="email" name="emailUsuario" required="required" value="<%out.write("" + f.getUsuarioFamiliar().getEmailUsuario());%>" />
                </fieldset>

                <fieldset>
                    <label> Senha:</label>
                    <input type="password" name="senha" required="required" value="" />
                </fieldset><br/>



                <input type="submit" value="Alterar" onclick="enviarDados()"/>
                <input type="reset" value="Voltar" onclick="window.top.location.href = 'menufamiliar.jsp';" /><br />
                 <%}%>
                <form/>

        </div>   
    </body>
    <script>
        function enviarDados() {
            var senha = document.getElementsByName("senha");
            if (senha[0].value === "") {
                alert("Informe a nova senha");
                senha[0].focus();
                exit();
            }


            var email = document.getElementsByName("emailUsuario");
            if (email[0].value === "") {
                alert("Informe o email");
                email[0].focus();
                exit();
            }
            document.forms[0].submit();
        }
    </script>                       
</html>
