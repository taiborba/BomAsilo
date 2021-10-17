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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            <%
            String tipoAcesso = "";
            if (session.getAttribute("tipoAcesso") != null){
                tipoAcesso = session.getAttribute("tipoAcesso").toString();
            }
            System.out.println("Tipo:" + tipoAcesso);            
            out.write("<script>validaAcesso(\"" + tipoAcesso + "\");</script>");  
        %>
        
        <%
            
        Familiar familiar = new Familiar();
        familiar.setCpfFamiliar(request.getParameter("cpfFamiliar"));
        familiar.setNome(request.getParameter("nome"));
        familiar.setRg(request.getParameter("rg"));
        familiar.setFoneFixo(request.getParameter("foneFixo"));
        familiar.setFoneCelular(request.getParameter("foneCelular"));
        familiar.setCpfPaciente(request.getParameter("cpfPaciente"));
        familiar.setLoginFamiliar(request.getParameter("loginFamiliar"));
        familiar.setEnderecoFamiliar(Integer.parseInt(request.getParameter("enderecoFamiliar")));
        
        
        if (familiar.incluirFamiliar()) {                
            response.sendRedirect("cadastrafamiliar.jsp?pmensagem=" +URLEncoder.encode("Familiar salvo com sucesso", "UTF-8"));
        } else {
            response.sendRedirect("cadastrafamiliar.jsp?pmensagem=" +URLEncoder.encode("Problemas ao salvar Familiar", "UTF-8"));
        }
        %>
    </body>
</html>
