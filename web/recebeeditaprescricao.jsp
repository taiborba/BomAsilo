<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="java.sql.Date"%>
<%@page import="modelos.Prescricao"%>
<%@page import="modelos.Clinico"%>
<%@page import="modelos.Medicamento"%>
<%@page import="java.net.URLEncoder"%>
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
            Prescricao prescricao = new Prescricao();
            prescricao.setIdPrescricao(Integer.parseInt(request.getParameter("idPrescricao")));
            prescricao.setIdClinico(Integer.parseInt(request.getParameter("idClinico")));
            prescricao.setIdMedicamento(Integer.parseInt(request.getParameter("idMedicamento")));
            prescricao.setDataConsulta(Date.valueOf(request.getParameter("dataConsulta")));
            prescricao.setHoraConsulta(request.getParameter("horaConsulta"));
            prescricao.setDescOrientacao(request.getParameter("descOrientacao"));
            prescricao.setDescPosologia(request.getParameter("descPosologia"));
            prescricao.setCpfPaciente(request.getParameter("cpfPaciente"));
            if(prescricao.alterarPrescricao()){
                response.sendRedirect("consultaprescricao.jsp?pmensagem=" +URLEncoder.encode("Prescrição editada com sucesso", "UTF-8"));
            } else {
                response.sendRedirect("consultaprescricao.jsp?pmensagem=" +URLEncoder.encode("Problemas ao editar prescrição", "UTF-8"));
            }          
        %>        
       <hr />
       <a href="consultaprescricao.jsp">Consulta prescrição</a> 
    </body>
</html>
