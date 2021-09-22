<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Clinico"%>
<%@page import="modelos.Especialidade" %>
<%@page import="java.net.URLEncoder"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
        
       <%   
            Clinico cli = new Clinico();
            cli.setIdClinico(Integer.parseInt(request.getParameter("idClinico")));
            cli.setNomeClinico(request.getParameter("nomeClinico"));
            cli.setIdEspecialidade(Integer.parseInt(request.getParameter("idEspecialidade")));
            cli.setCodRegistro(request.getParameter("codRegistro"));
          
                                      
            if(cli.AlterarClinico()){
                response.sendRedirect("consultaclinico.jsp?pmensagem=" +URLEncoder.encode("Clínico editado com sucesso", "UTF-8"));
            } else {
                response.sendRedirect("consultaclinico.jsp?pmensagem=" +URLEncoder.encode("Problemas ao editar clínico", "UTF-8"));
            }          
        %>             
       <hr />
     <a href="consultaclinico.jsp">Consulta clínico</a> 
    </body>
</html>

