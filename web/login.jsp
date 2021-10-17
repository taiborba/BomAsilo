<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Usuario"%><html>
    <!DOCTYPE html>   
    <html>
        <%
            Login log = new Login();
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            boolean status = log.verificarUsuario(login, senha);

            if (status) {
                out.write("Login feito com sucesso");
            } else {
                out.write("Login ou senha invalidos");
            }
        %>