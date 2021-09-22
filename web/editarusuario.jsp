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
        <link rel="stylesheet" href="styles/estilos.css">
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
        <section>
            
            <article>
                <body>
                    <h1>Editar Usuário</h1>
                    <hr />
                    <%
                      String login = request.getParameter("login");
                      Usuario u = new Usuario();
                      if (login != null){
                          u = u.consultarUsuario(login);
                      } 
                    String checkedAdm = "";
                    String checkedPSaude = "";
                    String checkedFamiliar = "";
                    
                    switch(u.getTipoAcesso()){
                        case "adm":
                            checkedAdm = "checked";
                        case "profsaude":
                            checkedPSaude = "checked";
                        case "familiar":
                            checkedFamiliar = "checked";                    
                    }

                    %>
                    <form action="recebeeditausuario.jsp" method="POST">
                        <label>E-mail</label>
                        <input type="text" name="emailUsuario" 
                                value="<%out.write(u.getEmailUsuario());%>" />

                        <br />
                        <label>Login</label>
                        <input type="text" name="login" 
                               value="<%out.write(u.getLogin());%>" />
                        <br />
                        <label>Senha</label>
                        <input type="password" name="senha" 
                               value="<%out.write(u.getSenha());%>" />

                        <br />
                        <label>Tipo de Acesso:</label><br>
                        <label for="adm"><input type="radio" id="adm" name="tipoAcesso" value="adm" <%=checkedAdm%> >Administrador</label><br>
                        <label for="familiar"><input type="radio" id="familiar" name="tipoAcesso" value="familiar" <%=checkedFamiliar%> >Familiar</label><br>
                        <label for="profSaude"><input type="radio" id="proSaude" name="tipoAcesso" value="profsaude" <%=checkedPSaude%> >Prof. Saúde</label><br><br>
                        <br />
                        <hr />
                        <input type="submit" value="Alterar" onclick="location.href = 'consultausuario.jsp';" />
                        <input type="reset" value="Cancelar" onclick="location.href = 'consultausuario.jsp';" />
                    </form>
                </body>
            </article>
        </section>               
</html>
