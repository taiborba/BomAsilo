<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Usuario" %>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
    </head>
  <header>
             <script>
                function validaAcesso(p1){
                   if(p1 === ""){
                     alert("Realize o acesso!");
                     window.top.location.href = "index.html";
                   } else if(p1 !== "adm"){
                    alert("Você não possui acesso a esta página!"); 
                    window.top.location.href = "menu.jsp";
                   }
                }   
            </script> 
    </header>
    <body>
    <body>
         <%
            String TipoAcesso = "";
            if (session.getAttribute("tipoAcesso") != null){
                TipoAcesso = session.getAttribute("tipoAcesso").toString();
            }
            System.out.println("Tipo:" + TipoAcesso);            
            out.write("<script>validaAcesso(\"" + TipoAcesso + "\");</script>");  
        %>
        <h1>Usuário Editado</h1>
    <%
        //recebe os valores da tela HTML  
            String emailUsuario    = request.getParameter("emailUsuario");
            String login   = request.getParameter("login");
            String senha  = request.getParameter("senha");
            String tipoAcesso  = request.getParameter("tipoAcesso");
          
            //instancia o Usuario
            Usuario us = new Usuario();
            us.setEmailUsuario(emailUsuario);
            us.setLogin(login);
            us.setSenha(senha);
            us.setTipoAcesso(tipoAcesso);
          
            if(us.alterarUsuario()){
                response.sendRedirect("consultausuario.jsp?pmensagem=" +URLEncoder.encode("Usuário editado com sucesso", "UTF-8"));
            } else {
                response.sendRedirect("consultausuario.jsp?pmensagem=" +URLEncoder.encode("Problemas ao editar usuário", "UTF-8"));
            }          
        %>        
      
      </body>
</html>

