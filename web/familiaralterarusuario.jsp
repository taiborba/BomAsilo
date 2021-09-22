<%@page import="modelos.Usuario"%>
<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Endereco"%>
<%@page import="modelos.Paciente"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Familiar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
    </head>
    <body>
        <script src="scripts/menu.js"></script>  
         <label><%
            if(request.getParameter("pmensagem") != null) {
            out.write(request.getParameter("pmensagem"));
            }
         
          Usuario us = new Usuario();
          List<Usuario> usu = us.consultarGeral();%>
        </label>
        <h1>Visualizar Usuario</h1>
        <div>
             <form action="recebeeditavisuusuario.jsp" method="POST">
            <% for(Usuario u : usu) { %>
                        <label> Login: </label>
                        <td><% out.write(u.getLogin()); %></td> 
                        <input type="hidden" name="login" value="<%out.write("" + u.getLogin());%>" /><br />
                        
                        <label> E-mail: </label>
                        <input type="email" name="emailUsuario" required="required" value="<%out.write(""+u.getEmailUsuario());%>" />
                        <label id="validaemailusuario" class="validacampos"></label><br />
                        
                        <label> Senha: </label>
                        <input type="password" name="senha" required="required" value="<%out.write(""+u.getSenha());%>" />
                        <label id="validasenha" class="validacampos"></label><br />

                        <input type="hidden" name="tipoAcesso" value="<%out.write("" + u.getTipoAcesso());%>" /><br />
                        <input type="submit" value="Alterar" /><br /><br />
                      <form/>
                  <%}%>
            </div>   
     </body>
<script>
            if (document.getElementByName("senha").value === ""){                    
                document.getElementByName("validasenha").innerHTML = "Informe a SENHA";
                senha[0].focus();
                exit(0);
            }            

            if (document.getElementByName("emailUsuario").value === "") {                    
                document.getElementByName("validaemailusuario").innerHTML = "Informe o EMAIL";
                emailUsuario[0].focus();
                exit(0);
            }                            
        </script>                       
</html>
