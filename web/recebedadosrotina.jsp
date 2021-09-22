<%@page import="java.sql.Date"%>
<%@page import="modelos.Rotina"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        Rotina rotina = new Rotina();
        rotina.setCpfPaciente(request.getParameter("cpfPaciente"));
        rotina.setDataEvento(Date.valueOf(request.getParameter("dataEvento")));
        rotina.setHoraInicio(request.getParameter("horaInicio"));
        rotina.setHoraFinal(request.getParameter("horaFinal"));
        rotina.setDescEvento(request.getParameter("descEvento"));
        rotina.setStatus(request.getParameter("status"));
        rotina.setQtdIntervalo(Integer.parseInt(request.getParameter("qtdeIntervalo")));
        rotina.setIdPrescricao(Integer.parseInt(request.getParameter("idPrescricao")));
        
        
        if (rotina.IncluirRotina()) {                
            response.sendRedirect("cadastrarotina.jsp?pmensagem=Rotina salvo com sucesso");
        } else {
            response.sendRedirect("cadastrarotina.jsp?pmensagem=Problemas ao salvar Rotina");
        }
        %>
    </body>
</html>
