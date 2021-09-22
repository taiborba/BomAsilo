<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="styles/padraotelacadastro.css" rel="stylesheet" type="text/css">
<%@page import="java.util.List"%>
<%@page import="modelos.Cargo"%>
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
        
       <h1>Consultar Cargo</h1>
        <hr />
        <label>
        <%
          if(request.getParameter("pmensagem") != null) {
            out.write(request.getParameter("pmensagem"));
            }
        %>
        </label>
        
         <%
          Cargo car = new Cargo();
          List<Cargo> cargo = car.consultarGeral();
         
        %>
        <table>
            <thead>
              <th scope="col">Descrição do Cargo</th>
              <th scope="col"> Editar </th>
              <th scope="col"> Excluir </th>
            </thead>
            <tbody>
              <% for(Cargo c : cargo) { %>
                <tr>   
                <td><% out.write(c.getDescCargo());  %></td>
                <td><%out.write("<a href=editarcargo.jsp?idCargo="+c.getIdCargo()+">Editar</a>");%></td> 
                <td><%out.write("<a href=excluircargo.jsp?idCargo="+c.getIdCargo()+">Excluir</a>");%></td>                         
                </tr>     
                <%}%>
            </tbody>    
        </table>
    </body>
</html>

