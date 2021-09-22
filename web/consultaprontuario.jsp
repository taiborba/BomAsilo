<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Prontuario"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
        <link rel="stylesheet" href="styles/estilos.css"> 
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
    
            <script src="scripts/menu.js"></script>  
        <h1>Consulta Prontuário</h1>
        <hr />
        <label>
        <%
            if(request.getParameter("pmensagem") != null)         
            out.write(request.getParameter("pmensagem"));
        %>
        </label><br/>
        <%
          Prontuario pro = new Prontuario();
          List<Prontuario> prontuario = pro.consultarGeral();
        %>
        <table class="table table-striped">
            <thead>
              <th scope="col"> Tipo Sanguíneo </th>
              <th scope="col"> Peso </th>
              <th scope="col"> Altura </th>
              <th scope="col"> IMC </th>
              <th scope="col"> Limitação Cognitiva </th>
              <th scope="col"> Limitação Locomotiva </th>
              <th scope="col"> Limitação Visual </th>
              <th scope="col"> Limitação Auditiva </th>
              <th scope="col"> Outra Limitação </th>
              <th scope="col"> Alergia </th>
              <th scope="col"> Ocupação </th>
              <th scope="col"> Paciente </th>
            </thead>
            <tbody>
                <% for(Prontuario pr : prontuario) { %>
                   <tr>
                        <td><% out.write(pr.getTipoSangue());  %></td>
                        <td><% out.write(""+pr.getPeso()); %></td>
                        <td><% out.write(""+pr.getAltura()); %></td>
                        <td><% out.write(""+pr.getImc()); %></td>
                        <td><% if (pr.isLimitCognitiva()) { out.write("Sim");
                                   } else {out.write("Não");} %></td>
                        <td><% if (pr.isLimitLocomocao()) { out.write("Sim");
                                   } else {out.write("Não");} %></td>
                        <td><% if (pr.isLimitVisao()) { out.write("Sim");
                                   } else {out.write("Não");} %></td>
                        <td><% if (pr.isLimitAudicao()) { out.write("Sim");
                                   } else {out.write("Não");} %></td>
                        <td><% out.write(""+pr.getLimitOutras()); %></td>
                        <td><% out.write(pr.getDescAlergia()); %></td>
                        <td><% out.write(pr.getDescOcupacao()); %></td>
                        <td><% out.write(""+pr.getPacienteProntuario().getNome()); %></td>
                        <td><% out.write("<a href=editarprontuario.jsp?idProntuario="+pr.getIdProntuario()+">Editar</a>");%></td> 
                        <td><% out.write("<a href=excluirprontuario.jsp?idProntuario="+pr.getIdProntuario()+">Excluir</a>");%></td>                         
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
