<%@page import="java.util.List"%>
<%@page import="modelos.Endereco"%>
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
                   } else if(p1 !== "adm"){
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
        
        <h1>Consulta Endereco</h1>
        <hr />
        <label>
            <%
            if(request.getParameter("pmensagem") != null) {
            out.write(request.getParameter("pmensagem"));
            }
            %>
        </label>
        
            <%
          Endereco end = new Endereco();
          List<Endereco> endereco = end.consultarGeral();
             %>
        <table>
            <thead>
              <th>CEP</th>
              <th>Rua</th>
              <th>Nr</th>
              <th>Complemento</th>
              <th>Bairro</th>
              <th>Cidade </th>
              <th>Uf</th>
              <th> Editar </th>
              <th> Excluir </th>
            </thead>
            <tbody>
                <% for(Endereco e : endereco) { %>
                   <tr>
                        <td><% out.write(e.getCep());  %></td>
                        <td><% out.write(e.getRua());   %></td>
                        <td><% out.write(e.getNr()); %></td>
                        <td><% out.write(""+e.getComplemento()); %></td>
                        <td><% out.write(""+e.getBairro()); %></td>
                        <td><% out.write(""+e.getCidade()); %></td>
                        <td><% out.write(""+e.getUf()); %></td>
                        <td><%out.write("<a href=editarendereco.jsp?cep="+ e.getCep()+">Editar</a>");%></td> 
                        <td><%out.write("<a href=excluirendereco.jsp?cep="+e.getCep()+">Excluir</a>");%></td>                         
                   </tr> 
                <%}%>
            </tbody>
        </table>
    </body>
</html>
