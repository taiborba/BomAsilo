<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Usuario"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
    </head>
    <header>
            <script src="scripts/cabecalho.js"></script>
            <link rel="stylesheet" href="styles/estilos.css"> 
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
        
       <h1>Consultar Usuário</h1>
        <hr />
        <label class="cabecalho" id="msg">
        <%
          if(request.getParameter("pmensagem") != null) {
            out.write(request.getParameter("pmensagem"));
            }
             
          Usuario us = new Usuario();
          List<Usuario> usuario = us.consultarGeral();
        %>
        </label>
        <table>
            
              <th>E-mail</th>
              <th>Login</th>
              <th>Tipo de Acesso</th>
              <th> Editar </th>
              <th> Excluir </th>
            
            <tbody>
                <% for(Usuario u : usuario) { %>
                   <tr>
                        <td><% out.write(u.getEmailUsuario());   %></td>
                        <td><% out.write(u.getLogin());  %></td>
                        <td><% out.write(u.getTipoAcesso()); %></td>
                        <td><%out.write("<a href=editarusuario.jsp?login="+u.getLogin()+">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluirusuario.jsp?login="+u.getLogin()+">Excluir</a>");%></td>                         
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>

