<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Prontuario"%>
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
                   } else if((p1 !== "adm") && (p1 !== "profsaude")){
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
    Prontuario p = new Prontuario();

    float pe = Float.parseFloat(request.getParameter("peso"));
    float a = Float.parseFloat(request.getParameter("altura"));
    float imc;
    a=a/100;    
    imc = pe / (a * a);
    
    p.setTipoSangue(request.getParameter("tipoSangue"));
    p.setAltura(a);
    p.setPeso(pe);
    p.setImc(imc);
    
    
    String limitCognitiva = request.getParameter("limitCognitiva");
    if (limitCognitiva != null) {
             p.setLimitCognitiva(true);
    }
     String limitLocomocao = request.getParameter("limitLocomocao");
    if (limitLocomocao != null) {
             p.setLimitLocomocao(true);
    }
     String limitVisao = request.getParameter("limitVisao");
    if (limitVisao != null) {
             p.setLimitVisao(true);
    }
     String limitAudicao = request.getParameter("limitAudicao");
    if (limitAudicao != null) {
             p.setLimitAudicao(true);
    }
    p.setLimitOutras(request.getParameter("limitOutras"));
    p.setDescAlergia(request.getParameter("descAlergia"));
    p.setDescOcupacao(request.getParameter("descOcupacao"));
    p.setCpfPaciente(request.getParameter("cpfPaciente"));
    if (p.incluirProntuario()) {
            response.sendRedirect("cadastraprontuario.jsp?pmensagem=" +URLEncoder.encode("Prontuario salvo com sucesso", "UTF-8"));
    } else {
            response.sendRedirect("cadastraprontuario.jsp?pmensagem=" +URLEncoder.encode("Problemas ao salvar prontuario", "UTF-8"));
    }
    
%>
