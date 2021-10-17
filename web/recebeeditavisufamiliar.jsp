<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Familiar"%>
<%@page import="java.sql.Date"%>
<%@page import="modelos.Paciente"%>
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
        //recebe os valores da tela HTML 
         
            //instancia o Paciente
            Familiar familiar = new Familiar();
            familiar.setIdFamiliar       (Integer.parseInt(request.getParameter("idFamiliar")));
            familiar.setNome             (request.getParameter("nome"));
            familiar.setCpfFamiliar      (request.getParameter("cpfFamiliar"));
            familiar.setRg               (request.getParameter("rg"));
            familiar.setFoneFixo         (request.getParameter("foneFixo"));
            familiar.setFoneCelular      (request.getParameter("foneCelular"));
            familiar.setLoginFamiliar    (request.getParameter("loginFamiliar"));
            familiar.setEnderecoFamiliar (Integer.parseInt(request.getParameter("enderecoFamiliar")));
            familiar.setCpfPaciente      (request.getParameter("cpfPaciente"));
          
            if(familiar.alterarFamiliar()){
                response.sendRedirect("familiarvisualizarfamiliar.jsp?pmensagem=Familiar editado com sucesso");
            } else {
                response.sendRedirect("familiarvisualizarfamiliar.jsp?pmensagem=Problemas ao editar familiar");
            }          
        %>        
       <hr />
       <a href="consultapaciente.jsp">Consulta Paciente</a> 
    </body>
</html>
