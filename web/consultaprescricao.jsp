<!--Pronto-->
<%@page import="java.util.List"%>
<%@page import="modelos.Prescricao"%>
<%@page import="modelos.Clinico"%>
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
    
        <h1>Consulta Prescricao</h1>
        <hr />
        <%
            if(request.getParameter("pmensagem") != null)         
                out.write(request.getParameter("pmensagem"));
        %>
        
        <%
          Prescricao pre = new Prescricao();
          List<Prescricao> prescricao = pre.consultarGeral();
        %>
         <table class="table table-striped">
            <thead>
              <th scope="col">Clinico</th>
              <th scope="col">Medicamento</th>
              <th scope="col">Data Consulta</th>
              <th scope="col">Hora Consulta</th>
              <th scope="col">Descrição Orientação</th>
              <th scope="col">Descrição Posologia</th>
              <th scope="col">Paciente</th>
              <th scope="col"> Editar </th>
              <th scope="col"> Excluir </th>
            </thead>
            <tbody>
                <% for(Prescricao p : prescricao) { %>
                   <tr>
                        <td><% out.write(""+p.getClinicoPrescricao().getNomeClinico() + " - " 
                                + p.getClinicoPrescricao().getEspecialidadeClinico().getDescEspecialidade());%></td>
                        <td><% out.write(""+p.getMedicamentoPrescricao().getNomeMedicamento());   %></td>
                        <td><% out.write(""+p.getDataConsulta());   %></td>
                        <td><% out.write(""+p.getHoraConsulta());  %></td>
                        <td><% out.write(""+p.getDescOrientacao());  %></td>
                        <td><% out.write(""+p.getDescPosologia());  %></td>
                        <td><% out.write(p.getCpfPaciente() + " - " + p.getPacientePrescricao().getNome());%></td>
                        <td><%out.write("<a href=editarprescricao.jsp?idPrescricao="+p.getIdPrescricao()+">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluirprescricao.jsp?idPrescricao="+p.getIdPrescricao()+">Excluir</a>");%></td>                         
                   </tr> 
                <%}%>
            </tbody>
    </table>
    </body>
</html>