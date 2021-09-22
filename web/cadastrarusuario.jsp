<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Usuario" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
    </head>
     <header>
            <script src="scripts/cabecalho.js"></script> 
             <script>
                function validaAcesso(p1){
                   if(p1 === ""){
                     alert("Realize o acesso!");
                     window.location.href = "index.html";
                   } else if(p1 !== "adm"){
                    alert("Você não possui acesso a esta página!"); 
                    window.location.href = "menu.jsp";
                   }
                }   
            </script> 
    </header>
    <body>
             <%
            String tipoAcesso = "";
            if (session.getAttribute("tipoAcesso") != null){
                tipoAcesso = session.getAttribute("tipoAcesso").toString();
            }
            System.out.println("Tipo:" + tipoAcesso);            
            out.write("<script>validaAcesso(\"" + tipoAcesso + "\");</script>");  
        %>
        <h1>Cadastrar Usuário</h1>
        
                <label class="cabecalho" id="msg"> 
                    <%
                        if(request.getParameter("pmensagem") != null) {         
                            out.write(request.getParameter("pmensagem"));
                        }
                    %>
                </label>
                <form action="recebedadosusuario.jsp" method="POST">
                    <div>
                        
                        <label>E-mail: </label>
                        <input type="text" name="emailUsuario" /> <br />

                        <label>Login: </label>
                        <input type="text" name="login" /> <br />

                        <label>Senha: </label>
                        <input type="password" name="senha" /> <br />
                        
                        <label>Tipo de Acesso: </label><br>
                       
                            <input type="radio" id="adm" name="tipoAcesso" value="adm">
                            <label for="adm">Administrador</label><br>
                            <input type="radio" id="familiar" name="tipoAcesso" value="familiar">
                            <label for="familiar">Familiar</label><br>
                            <input type="radio" id="proSaude" name="tipoAcesso" value="profsaude">
                            <label for="profSaude">Prof. Saúde</label><br><br>
                             <br>
                            
                           
                        <input type="button" value="Salvar" onclick="enviarDados()" />
                        <input type="reset" value="Cancelar" onclick="location.href = 'menu.jsp';" />
                    </div>   
                </form>
            </article>
        </section>
                            
<script>
    function enviarDados(){
            var emailUsuario = document.getElementsByName("emailUsuario");
            if(emailUsuario[0].value === ""){
                emailUsuario[0].focus();
                alert("Informe o e-mail do Usuário");
                exit();
            }

            var login = document.getElementsByName("login");
            if(login[0].value === ""){
                login[0].focus();
                alert("Informe o Login");
                exit();
            }

            var senha = document.getElementsByName("senha");
            if(senha[0].value === ""){
                senha[0].focus();
                alert("Informe uma Senha");
                exit();
            }

            var tipoAcesso = document.getElementsByName("tipoAcesso");
            if(tipoAcesso[0].value === ""){
                tipoAcesso[0].focus();
                alert("Informe o Tipo de Acesso");
                exit();
            }
            document.forms[0].submit();
    }        
    function enviaForm(){
        document.forms[0].submit();
        response.sendRedirect("nulo.html");
    }        
</script>    
    </body>
</html>
