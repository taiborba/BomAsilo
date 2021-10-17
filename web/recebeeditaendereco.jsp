<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Endereco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.net.URLEncoder"%>
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
        
        <h1>Endereco editado</h1>
        <hr />
        <%
        //recebe os valores da tela HTML
            Integer idEndereco  = Integer.parseInt(request.getParameter("idEndereco")); 
            String cep            = request.getParameter("cep");
            String rua            = request.getParameter("rua");
            Integer nr            = Integer.parseInt(request.getParameter("nr"));
            String complemento    = request.getParameter("complemento");
            String bairro         = request.getParameter("bairro");
            String cidade         = request.getParameter("cidade");
            String uf             = request.getParameter("uf");
          
            //instancia o Cliente
            Endereco endereco = new Endereco();
            endereco.setIdEndereco(idEndereco);
            endereco.setCep(cep);
            endereco.setRua(rua);
            endereco.setNr(nr);
            endereco.setComplemento(complemento);
            endereco.setBairro(bairro);
            endereco.setCidade(cidade);
            endereco.setUf(uf);
          
            if(endereco.alterarEndereco()){
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultaendereco.jsp?pmensagem=" +URLEncoder.encode("Endereço editado com sucesso", "UTF-8"));
            } else {
                response.setCharacterEncoding("UTF-8");
                response.sendRedirect("consultaendereco.jsp?pmensagem=" +URLEncoder.encode("Problemas ao editar endereço", "UTF-8"));
            }          
        %>        
       <hr />
       <a href="consultaendereco.jsp">Consulta endereco</a> 
    </body>
</html>
