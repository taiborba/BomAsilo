
<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Familiar"%>
<%@page import="java.net.URLEncoder"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
        <h1>Excluir Familiar</h1>
        <%
          Integer pIdFamiliar = Integer.parseInt(request.getParameter("idFamiliar"));
          Familiar f = new Familiar();
          if (pIdFamiliar != null){
              f.consultarFamiliar(pIdFamiliar);
              if(f.ExcluirFamiliar()){
                response.sendRedirect("consultafamiliar.jsp?pmensagem=" +URLEncoder.encode("Familiar excluido com sucesso", "UTF-8"));
                } else {
                    response.sendRedirect("consultafamiliar.jsp?pmensagem=" +URLEncoder.encode("Problemas ao excluir familiar", "UTF-8"));
                }
          }          
        %>
        <hr />
       <a href="consultafamiliar.jsp">Consulta Familiar</a> 
              
    </body>
</html>
