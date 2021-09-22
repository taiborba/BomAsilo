<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Clinico"%>
<%@page import="modelos.Especialidade"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
        <link rel="stylesheet" href="styles/estilos.css"> </head>
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
    <header>
          
     <h>Bom Asilo</h>
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
        
        <h1>Consulta Clínico</h1>
        <hr />
        <label class="cabecalho" id="msg"> 
                    <%
                        if(request.getParameter("pmensagem") != null)         
                            out.write(request.getParameter("pmensagem"));
                    %>
        </label>
        <%
          Clinico cli = new Clinico();
          List<Clinico> clinico = cli.consultarGeral();
          Especialidade esp = new Especialidade();
        %>
        <table class="table table-striped">
            <thead> <th scope="col">Nome do Clinico</th>
              <th scope="col">Código de Registro</th>
              <th scope="col">Especialidade</th>
              <th scope="col"> Editar </th>
              <th scope="col"> Excluir </th>
            </thead>
            <tbody>
                <% for(Clinico c : clinico) { %>
                   <tr>
                        <td><% out.write(""+c.getNomeClinico());   %></td>
                        <td><% out.write(""+c.getCodRegistro());  %></td>
                        <td><% out.write(""+c.getEspecialidadeClinico().getDescEspecialidade());%></td>
                        <td><%out.write("<a href=editaclinico.jsp?idClinico="+c.getIdClinico()+">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluiclinico.jsp?idClinico="+c.getIdClinico()+">Excluir</a>");%></td>                         
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>