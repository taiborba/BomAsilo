<%@page import="java.sql.Date"%>
<%@page import="modelos.Rotina"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
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
        
        <h1>rotina editado</h1>
        <hr />
        <%
        //recebe os valores da tela HTML  
        Rotina rotina = new Rotina();
        rotina.setIdEvento(Integer.parseInt(request.getParameter("idEvento")));
        rotina.setCpfPaciente(request.getParameter("cpfPaciente"));
        rotina.setDataEvento(Date.valueOf(request.getParameter("dataEvento")));
        rotina.setHoraInicio(request.getParameter("horaInicio"));
        rotina.setHoraFinal(request.getParameter("horaFinal"));
        rotina.setDescEvento(request.getParameter("descEvento"));
        rotina.setStatus(request.getParameter("status"));
        rotina.setQtdIntervalo(Integer.parseInt(request.getParameter("qtdeIntervalo")));
        rotina.setIdPrescricao(Integer.parseInt(request.getParameter("idPrescricao")));
          
            if(rotina.EditarRotina()){
                response.sendRedirect("consultarotina.jsp?pmensagem=Rotina editado com sucesso");
            } else {
                response.sendRedirect("consultarotina.jsp?pmensagem=Problemas ao editar rotina");
            }          
        %>        
       <hr />
       <a href="consultarotina.jsp">Consulta rotina</a> 
    </body>
</html>
