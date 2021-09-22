
<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Cargo"%>
<%@page import="java.net.URLEncoder"%>

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
                    alert("Voc� n�o possui acesso a esta p�gina!"); 
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
    Cargo car = new Cargo();
 
    car.setDescCargo(request.getParameter("descCargo"));
    if (car.incluirCargo()) {
            response.sendRedirect("cadastracargo.jsp?pmensagem=" +URLEncoder.encode("Cargo salvo com sucesso", "UTF-8"));
    } else {
            response.sendRedirect("cadastracargo.jsp?pmensagem=" +URLEncoder.encode("Problemas ao salvar Cargo", "UTF-8"));
    }
    
%>

