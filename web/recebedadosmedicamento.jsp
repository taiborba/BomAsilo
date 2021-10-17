<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Medicamento"%>
<%@page import="java.net.URLEncoder"%>
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
                   } else if((p1 !== "adm") && (p1 !== "profsaude")){
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
    Medicamento med = new Medicamento();
 
    med.setNomeMedicamento(request.getParameter("nomeMedicamento"));
    String indcontrolado = request.getParameter("indControlado");
    if (indcontrolado != null) {
             med.setIndControlado(true);
    }
    
    if (med.incluirMedicamento()) {
            response.sendRedirect("cadastramedicamento.jsp?pmensagem=" +URLEncoder.encode("Medicamento salvo com sucesso", "UTF-8"));
    } else {
            response.sendRedirect("cadastramedicamento.jsp?pmensagem=" +URLEncoder.encode("Problemas ao salvar medicamento", "UTF-8"));
    }
%>
    </body>
</html>
