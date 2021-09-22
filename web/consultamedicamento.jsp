<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->

<%@page import="java.util.List"%>
<%@page import="modelos.Medicamento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
        <link rel="stylesheet" href="styles/estilos.css"> 
    </head>
    <header>
          
     <h>Bom Asilo</h>
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
        <h1>Consulta Medicamentos</h1>
        <hr />
         <label><%
            if(request.getParameter("pmensagem") != null) {
            out.write(request.getParameter("pmensagem"));
            }%>
        </label><br/>
        
        <%
          Medicamento med = new Medicamento();
          List<Medicamento> medicamentos = med.consultarGeral();
        %>
        <table class="table table-striped">
            <thead><th scope="col">Nome</th>
              <th scope="col">Controlado?</th>
              <th scope="col"> Editar </th>
              <th scope="col"> Excluir </th>
            </thead>
            <tbody>
                <% for(Medicamento m : medicamentos) { %>
                    <tr> <!-- para cada linha tem que ter uma <tr> -->
                        <td><% out.write(m.getNomeMedicamento());   %></td>
                        <!-- teste do indcontrolado -->
                        <% if(m.getIndControlado()){%>
                            <td>Sim</td>
                        <%}else{%>        
                             <td>Não</td>
                        <%}%>
                        <td><%out.write("<a href=editamedicamento.jsp?idMedicamento="+m.getIdMedicamento()+">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluimedicamento.jsp?idMedicamento="+m.getIdMedicamento()+">Excluir</a>");%></td> 
                    </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
