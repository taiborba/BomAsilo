<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Date"%>
<%@page import="modelos.Rotina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
            int qtdInt = Integer.parseInt(request.getParameter("qtdeIntervalo"));
            String dataInicial = request.getParameter("dataInicial");
            String dataFinal = request.getParameter("dataFinal");
            
            Rotina rotina = new Rotina();
            LocalDate diaseguinte = LocalDate.parse(dataInicial, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            diaseguinte = diaseguinte.plusDays(qtdInt);
            dataFinal = String.valueOf(diaseguinte);
            rotina.setDataFinal(Date.valueOf(diaseguinte));
            
        rotina.setCpfPaciente(request.getParameter("cpfPaciente"));
        rotina.setDataInicial(Date.valueOf(dataInicial));
        rotina.setDataFinal(Date.valueOf(dataFinal));
        rotina.setHoraInicio(request.getParameter("horaInicio"));
        rotina.setHoraFinal(request.getParameter("horaFinal"));
        rotina.setDescEvento(request.getParameter("descEvento"));
        rotina.setStatus("P");
        rotina.setQtdIntervalo(qtdInt);
        if (request.getParameter("idPrescricao") != null){
            rotina.setIdPrescricao(Integer.parseInt(request.getParameter("idPrescricao")));
        }
        
        if (rotina.incluirRotina()) {                
            response.sendRedirect("cadastrarotina.jsp?pmensagem=Rotina salva com sucesso");
        } else {
            response.sendRedirect("cadastrarotina.jsp?pmensagem=Problemas ao salvar Rotina");
        }
        %>
    </body>
</html>
