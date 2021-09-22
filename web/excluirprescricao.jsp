<!--Pronto-->
<%@page import="modelos.Prescricao"%>
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
             <h1>Excluir Prescrição</h1>
        <%
          Integer idPrescricao = Integer.parseInt(request.getParameter("idPrescricao"));
          Prescricao p = new Prescricao();
          if (idPrescricao != null){
              p = p.consultarPrescricao(idPrescricao);
              if(p.excluirPrescricao()){
                response.sendRedirect("consultaprescricao.jsp?pmensagem=Prescrição excluida com sucesso");
                } else {
                    response.sendRedirect("consultaprescricao.jsp?pmensagem=Problemas ao excluir prescrição");
                }
          }          
        %>
        <hr /> 
        <a href="consultaprescricao.jsp">Consulta Prescrição</a> 
    </body>
</html>
