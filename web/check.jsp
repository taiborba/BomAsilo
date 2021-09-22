<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Login" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <% Login log = new Login();
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        boolean status = log.verificarUsuario(login,senha);
        
        if(status == true){
           //out.print("Login realizado com sucesso. Usuario:" + log.emailUsuario + " Tipo Acesso: " + log.tipoAcesso);
            
              session.setAttribute("tipoAcesso", log.tipoAcesso);
              response.sendRedirect("menu.jsp"); 
        }else{
            out.println("login ou senha invalidos");
         }
        %>
    </body>
</html>