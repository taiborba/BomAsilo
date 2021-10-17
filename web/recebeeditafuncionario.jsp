<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Funcionario" %>
<%@page import="modelos.Cargo" %>
<%@page import="java.sql.Date"%>
<%@page import="java.net.URLEncoder"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
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
        
        <h1>Funcionário Editado</h1>
        
    <%
        //recebe os valores da tela HTML 
            Integer idFuncionario  = Integer.parseInt(request.getParameter("idFuncionario"));
            String nome            = request.getParameter("nome");
            String cpfFuncionario  = request.getParameter("cpfFuncionario");
            String rg              = request.getParameter("rg");
            Integer idCargo        = Integer.parseInt(request.getParameter("idCargo"));
            String regProfissional = request.getParameter("regProfissional");
            Date dataAdmissao    =  Date.valueOf(request.getParameter("dataAdmissao"));
            Date dataDesliga = null;
            if (!request.getParameter("dataDesliga").isEmpty()) {
                dataDesliga = Date.valueOf(request.getParameter("dataDesliga"));
            }
            String emailFuncionario    = request.getParameter("emailFuncionario");
            String foneFuncionario = request.getParameter("foneFuncionario");
            Integer enderecoFuncionario = Integer.parseInt(request.getParameter("enderecoFuncionario"));
            
            
            //instancia o Usuario
            Funcionario fun = new Funcionario();
            fun.setIdFuncionario(idFuncionario);
            fun.setNome(nome);
            fun.setCpfFuncionario(cpfFuncionario);
            fun.setRg(rg);
            fun.setIdCargo(idCargo);
            fun.setRegProfissional(regProfissional);
            fun.setDataAdmissao(dataAdmissao);
            if (dataDesliga != null) {
                fun.setDataDesliga(dataDesliga);
            }    
            fun.setEmailFuncionario(emailFuncionario);
            fun.setFoneFuncionario(foneFuncionario);
            fun.setEnderecoFuncionario(enderecoFuncionario);
          
            if(fun.alterarFuncionario()){
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultafuncionario.jsp?pmensagem=" +URLEncoder.encode("Funcionário editado com sucesso", "UTF-8"));
            } else {
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultafuncionario.jsp?pmensagem=" +URLEncoder.encode("Problemas ao editar funcionário", "UTF-8"));
            }          
        %>        
      </body>
</html>

