<%@page import="java.util.List"%>
<%@page import="modelos.Rotina"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <h1>Consulta Rotina</h1>
        <hr />
        <%
          Rotina rot = new Rotina();
          List<Rotina> rotina = rot.consultarGeral();
          %>
        <table>
            <thead>
              <th>CPF do Paciente</th>
              <th>Data do Evento</th>
              <th>hora de Inicio</th>
              <th>Hora Final</th>
              <th>Descricao do Evento</th>
              <th>Status</th>
              <th>Qtd Intervalo </th>
              <th>Prescricao </th>
              <th> Editar </th>
              <th> Excluir </th>
            </thead>
            <tbody>
                <% for(Rotina r : rotina) { %>
                   <tr>
                        <td><% out.write(r.getCpfPaciente());  %></td>
                        <td><% out.write(""+r.getDataEvento());   %></td>
                        <td><% out.write(r.getHoraInicio()); %></td>
                        <td><% out.write(""+r.getHoraFinal()); %></td>
                        <td><% out.write(""+r.getDescEvento()); %></td>
                        <td><% out.write(""+r.getStatus()); %></td>
                        <td><% out.write(""+r.getQtdIntervalo()); %></td>
                        <td><% out.write(""+r.getPrescricaoRotina().getDescOrientacao()
                                           + r.getPrescricaoRotina().getDescPosologia()+ " - "
                                           + r.getPrescricaoRotina().getHoraConsulta()); %></td>
                        <td><%out.write("<a href=editarotina.jsp?idEvento="+ r.getIdEvento()+">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluirotina.jsp?idEvento="+r.getIdEvento()+">Excluir</a>");%></td>                         
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
