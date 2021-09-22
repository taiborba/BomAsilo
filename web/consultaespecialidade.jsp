<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Especialidade"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
        <link rel="stylesheet" href="styles/estilos.css"> 
    </head>
    <header>
          
        <h1>Bom Asilo</h1>
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
        
        <script src="scripts/menu.js"></script>          
        <h1>Consulta Especialidade</h1>
        <hr />
        
        <%
          if(request.getParameter("pmensagem") != null) {
            out.write(request.getParameter("pmensagem"));
            }
             
          Especialidade esp = new Especialidade();
          List<Especialidade> especialidade = esp.consultarGeral();
         
        %>
        
        
        <table class="table table-striped">
            <thead>
              <th scope="col">Descrição</th>
              <th scope="col"> Editar </th>
              <th scope="col"> Excluir </th>
            </thead>
            <tbody>
                <% for(Especialidade e : especialidade) { %>
                
                   <tr>
                        <td><% out.write(e.getDescEspecialidade());   %></td>
                        <td><%out.write("<a href=editaespecialidade.jsp?idEspecialidade="+e.getIdEspecialidade()+">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluiespecialidade.jsp?idEspecialidade="+e.getIdEspecialidade()+">Excluir</a>");%></td>                         
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>