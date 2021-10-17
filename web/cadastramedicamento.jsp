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
        <link rel="icon" type="image/favicon" href="imagens/favicon.ico" />
    </head>
    <body>
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
                
                <label class="cabecalho" id="msg" id="bomasilo" action=""> 
                    <%
                        if (request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));
                    %>
                </label>
                <div class="container" >
                <form action="recebedadosmedicamento.jsp" method="POST" id="bomasilo" action="">
                    <h3>Cadastro de Medicamentos </h3> <br/>
                    
                    <fieldset>
                        <label>Nome Medicamento</label>
                        <input id="nomeMedicamento" name="nomeMedicamento" type="text" required="required"  maxlength="40"/> <br />
                        <br/>
                    </fieldset>

                    <fieldset>
                        <label for="indControlado"><input type="checkbox" id="indControlado" name="indControlado" /> Uso Contínuo?</label>
                        <br />
                    </fieldset><br/>

                        <input type="button" value="Salvar" onclick="enviarDados()" />
                        <input type="reset" value="Cancelar" onclick= "window.top.location.href = 'menu.jsp';" />
   
                </form>
                    </div>
        <script>
            function enviarDados() {
                var nomeMedicamento = document.getElementsByName("nomeMedicamento");
                if (nomeMedicamento[0].value === "") {
                    nomeMedicamento[0].focus();
                    alert("Informe o nome");
                    exit();
                }
                document.forms[0].submit();
            }

        </script>    
    </body>
</html>