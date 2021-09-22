<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Paciente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
    </head>
    <body>
        <script src="scripts/menu.js"></script>  
         <label><%
            if(request.getParameter("pmensagem") != null) {
            out.write(request.getParameter("pmensagem"));
            }
          Paciente pac = new Paciente();
          List<Paciente> paciente = pac.consultarGeral();%>
        </label>
        <h1>Visualizar Paciente</h1>
        <div>
            <form action="recebeeditavisupaciente.jsp" method="POST">
            <% for(Paciente p : paciente) { %>
            <input type="hidden" name="idPaciente" value="<%out.write("" + p.getIdPaciente());%>" />
                        <label> Nome: </label>
                        <td><% out.write(p.getNome()); %></td>
                        <input type="hidden" name="nome" value="<%out.write("" + p.getNome());%>" /><br />
                        
                        <label> Cpf: </label>
                        <td><% out.write(p.getCpfPaciente()); %></td> 
                        <input type="hidden" name="cpfPaciente" value="<%out.write(p.getCpfPaciente());%>" /><br />
                        
                        <label> Rg: </label>
                        <td><% out.write(p.getRg()); %></td>
                        <input type="hidden" name="rg" value="<%out.write("" + p.getRg());%>" /><br />

                        <label> Data de Nascimento: </label>
                        <%
                            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                            String datanasc      = sdf.format(p.getDataNascimento());                
                        %>
                        <td><% out.write(datanasc); %></td>
                        <input type="hidden" name="dataNascimento" value="<%out.write("" + p.getDataNascimento());%>" /><br />
                        
                        <label> Quarto: </label>
                        <td><% out.write(""+p.getQuarto()); %></td>
                        <input type="hidden" name="quarto" value="<%out.write("" + p.getQuarto());%>" /><br />
                        
                        <label> Endereco: </label> 
                        <td><% out.write(""+p.getEnderecoPaciente()); %></td>
                        <input type="hidden" name="enderecoPaciente" value="<%out.write("" + p.getEnderecoPaciente());%>" /><br />

                        <label> Nome Contato: </label>
                        <input type="text" name="nomeContato" required="required" value="<%out.write(""+p.getNomeContato());%>" /> <br />
                        <label id="validanomecontato" class="validacampos"></label>
                        
                        <label> Telefone Contato: </label>
                        <input type="text" name="foneContato" required="required" value="<%out.write(""+p.getFoneContato());%>" /> <br />
                        <label id="validafonecontato" class="validacampos"></label> 
                        <input type="submit" value="Alterar" /><br /><br />
                        <form/>
                  <%}%>
            </div>   
    </body>
    <script>
            if (document.getElementByName("nomeContato").value === ""){                    
                document.getElementByName("validanomecontato").innerHTML = "Informe o NOME DE CONTATO";
                nomeContato[0].focus();
                exit(0);
            }            

            if (document.getElementByName("foneContato").value === "") {                    
                document.getElementByName("validafonecontato").innerHTML = "Informe o TELEFONE DE CONTATO";
                foneContato[0].focus();
                exit(0);
            }                            
        </script>                        
</html>
