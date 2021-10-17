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
    //Instancia o paciente
    Paciente pac = new Paciente();
    
    //Recebe os valores da tela HTML
    pac.setNome            (request.getParameter("nome"));
    pac.setCpfPaciente     (request.getParameter("cpfPaciente"));
    pac.setRg              (request.getParameter("rg"));
    pac.setDataNascimento  (Date.valueOf(request.getParameter("dataNascimento")));
    pac.setIdQuarto        (Integer.parseInt(request.getParameter("idQuarto")));
    pac.setEnderecoPaciente(Integer.parseInt(request.getParameter("enderecoPaciente")));
    pac.setNomeContato     (request.getParameter("nomeContato"));
    pac.setFoneContato     (request.getParameter("foneContato"));
          
        if(pac.incluirPaciente())
        {
          response.sendRedirect("cadastrapaciente.jsp?pmensagem=" +URLEncoder.encode("Paciente salvo com sucesso", "UTF-8"));
        }
        else 
        {
          response.sendRedirect("cadastrapaciente.jsp?pmensagem=" +URLEncoder.encode("Problemas ao salvar paciente", "UTF-8"));
        }
        %>
    </body>
</html>
