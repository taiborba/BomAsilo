<%@page import="modelos.Usuario"%>
<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->

<%@page import="java.sql.Date"%>
<%@page import="modelos.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
        //recebe os valores da tela HTML 
        
            String login = request.getParameter("login");
         
            //instancia o Paciente
            Usuario u = new Usuario();
            u.setEmailUsuario  (request.getParameter("emailUsuario"));
            u.setLogin         (login);
            u.setSenha         (request.getParameter("senha"));
            u.setTipoAcesso    (request.getParameter("tipoAcesso"));
          
            if(u.alterarUsuario()){
                response.sendRedirect("familiaralterarusuario.jsp?login=" + login + "&pmensagem=Usuario editado com sucesso");
            } else {
                response.sendRedirect("familiaralterarusuario.jsp?login=" + login +" &pmensagem=Problemas ao editar usuario");
            }          
        %>        
       <hr />
       <a href="consultapaciente.jsp">Consulta Paciente</a> 
    </body>
</html>
