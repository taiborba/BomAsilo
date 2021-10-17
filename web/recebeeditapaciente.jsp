<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="java.sql.Date"%>
<%@page import="modelos.Paciente"%>
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
        //recebe os valores da tela HTML 
         
            //instancia o Paciente
            Paciente paciente = new Paciente();
            paciente.setIdPaciente      (Integer.parseInt(request.getParameter("idPaciente")));
            paciente.setNome            (request.getParameter("nome"));
            paciente.setCpfPaciente     (request.getParameter("cpfPaciente"));
            paciente.setRg              (request.getParameter("rg"));
            paciente.setDataNascimento  (Date.valueOf(request.getParameter("dataNascimento")));
            paciente.setIdQuarto        (Integer.parseInt(request.getParameter("idQuarto")));
            paciente.setEnderecoPaciente(Integer.parseInt(request.getParameter("enderecoPaciente")));
            paciente.setNomeContato     (request.getParameter("nomeContato"));
            paciente.setFoneContato     (request.getParameter("foneContato"));
             System.out.println(paciente);
            if(paciente.alterarPaciente()){
                response.sendRedirect("consultapaciente.jsp?pmensagem=" +URLEncoder.encode("Paciente editado com sucesso", "UTF-8"));
            } else {
                response.sendRedirect("consultapaciente.jsp?pmensagem=" +URLEncoder.encode("Problemas ao editar paciente", "UTF-8"));
            }          
        %>        
       <hr />
       <a href="consultapaciente.jsp">Consulta Paciente</a> 
    </body>
</html>
