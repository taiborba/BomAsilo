
<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->

<%@page import="java.util.List"%>
<%@page import="modelos.Paciente"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <h1>Consulta Pacientes</h1>
        <hr />
        <label><%
            if(request.getParameter("pmensagem") != null) {
            out.write(request.getParameter("pmensagem"));
            }%>
        </label><br/>
        
        <%
          Paciente pac = new Paciente();
          List<Paciente> paciente = pac.consultarGeral();
        %>
        <table class="table table-striped">
            <thead>
              <th scope="col">Nome</th>
              <th scope="col">Cpf</th>
              <th scope="col">Rg</th>
              <th scope="col">Data Nascimento</th>
              <th scope="col">Quarto</th>
              <th scope="col">Endereço</th>
              <th scope="col">Nome Contato</th>
              <th scope="col">Fone Contato</th>
              <th scope="col"> Editar </th>
              <th scope="col"> Excluir </th>
            </thead>
            <tbody>
                <% for(Paciente p : paciente) { %>
                   <tr>
                        <td><% out.write(p.getNome()); %></td>
                        <td><% out.write(p.getCpfPaciente());   %></td>
                        <td><% out.write(p.getRg());  %></td>
                        <%
                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                            String datanasc      = sdf.format(p.getDataNascimento());                
                        %>
                        <td><%out.write(datanasc); %></td>
                     
                        <td><% out.write(""+p.getQuartoPaciente().getDescrQuarto()); %></td>
                        <td><% out.write(""+ p.getEnderecoCompletoPaciente().getCep() + " - "
                                           + p.getEnderecoCompletoPaciente().getRua() + " - "
                                           + p.getEnderecoCompletoPaciente().getNr() + " - "
                                           + p.getEnderecoCompletoPaciente().getComplemento() + " - "
                                           + p.getEnderecoCompletoPaciente().getBairro() + " - "
                                           + p.getEnderecoCompletoPaciente().getCidade() + " - "
                                           + p.getEnderecoCompletoPaciente().getUf()); %></td>
                        <td><% out.write(p.getNomeContato()); %></td>
                        <td><% out.write(p.getFoneContato()); %></td>
                        <td><% out.write("<a href=editarpaciente.jsp?idPaciente="+p.getIdPaciente()+">Editar</a>");%></td> 
                        <td><% out.write("<a href=excluirpaciente.jsp?idPaciente="+p.getIdPaciente()+">Excluir</a>");%></td>                         
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
