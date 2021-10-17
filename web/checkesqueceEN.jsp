<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Email"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Usuario"%>
<%@page import="modelos.Login" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/favicon" href="imagens/favicon.ico" />
        <title> Bom Asilo </title>
    </head>
    <body>
        <% Login log = new Login();
        String emailUsuario = request.getParameter("emailUsuario");
        boolean status = log.verificarEmail(emailUsuario);
        boolean manda = log.mandaEmail(emailUsuario);
       
        if(status){
            if(manda){
            out.println("Check your E-mail Box!");
            }
            else{
                out.println("Problems to send E-mail! Check if your E-mail is correctly written");
                out.println("Contact sistemabom.asilo@gmail.com for more information");
            }
        }else{
            out.println("E-mail is not registered! Check if your E-mail is correctly written");
         }
        %>
    </body>
</html>