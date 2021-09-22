<%@page import="java.text.SimpleDateFormat"%>
<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->

<%@page import="java.util.List"%>
<%@page import="modelos.Quarto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
        <link rel="stylesheet" href="styles/estilos.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
        
    </head>
    <header>
            <script src="scripts/cabecalho.js"></script> 
             <script>
                function validaAcesso(p1){
                   if(p1 === ""){
                     alert("Realize o acesso!");
                     window.location.href = "index.html";
                   } else if((p1 !== "adm") && (p1 !== "profsaude") && (p1 !== "familiar")){
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
        
        <script src="scripts/menu.js"></script>  
        <h1>Consulta Quarto</h1>
        <hr />
        <label><%
            if(request.getParameter("pmensagem") != null) {
            out.write(request.getParameter("pmensagem"));
            }%>
        </label>
        
        <%
          Quarto quar = new Quarto();
          List<Quarto> quarto = quar.consultarGeral();
        %>
        <table class="table table-striped">
            <thead>
              <th scope="col">Desrição do Quarto</th>
              <th scope="col"> Editar </th>
              <th scope="col"> Excluir </th>
            </thead>
            <tbody>
                <% for(Quarto q : quarto) { %>
                   <tr>
                        <td><% out.write(q.getDescrQuarto()); %></td>
                        
                        <td><% out.write("<a href=editarquarto.jsp?idQuarto="+q.getIdQuarto()+">Editar</a>");%></td> 
                        <td><% out.write("<a href=excluirquarto.jsp?idQuarto="+q.getIdQuarto()+">Excluir</a>");%></td>                         
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
