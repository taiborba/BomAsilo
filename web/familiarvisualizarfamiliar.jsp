<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Endereco"%>
<%@page import="modelos.Paciente"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Familiar"%>
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
          Familiar fam = new Familiar();
          List<Familiar> fa = fam.consultarGeral();
         
          Paciente pac = new Paciente();
          List<Paciente> paciente = pac.consultarGeral();%>
        </label>
        <h1>Visualizar Familiar</h1>
        <div>
             <form action="recebeeditavisufamiliar.jsp" method="POST">
            <% for(Familiar f : fa) { %>
                        <input type="hidden" name="idFamiliar" value="<%out.write("" + f.getIdFamiliar());%>" />
                        <label> Nome: </label>
                        <td><% out.write(f.getNome()); %></td> 
                        <input type="hidden" name="nome" value="<%out.write("" + f.getNome());%>" /><br />
                        
                        <label> Cpf: </label>
                        <td><% out.write(f.getCpfFamiliar()); %></td>
                        <input type="hidden" name="cpfFamiliar" value="<%out.write("" + f.getCpfFamiliar());%>" /><br />
                        
                        <label> Rg: </label>
                        <td><% out.write(f.getRg()); %></td>
                        <input type="hidden" name="rg" value="<%out.write("" + f.getRg());%>" /><br />

                        <label> Fone Fixo: </label>
                         <input type="text" name="foneFixo" required="required" value="<%out.write(""+f.getFoneFixo());%>" /> <br />
                        <label id="validafonefixo" class="validacampos"></label>
                        
                        <label> Fone Celular: </label>
                        <input type="text" name="foneCelular" required="required" value="<%out.write(""+f.getFoneCelular());%>" /> <br />
                        <label id="validafonecelular" class="validacampos"></label>
                        
                        <label> Login: </label> 
                        <td><% out.write(f.getLoginFamiliar()); %></td> 
                        <input type="hidden" name="loginFamiliar" value="<%out.write("" + f.getLoginFamiliar());%>" /><br />

                        <label> Endereco: </label> 
                        <td><% out.write(f.getEnderecoCompletoFamiliar().getUf()+ " - " + f.getEnderecoCompletoFamiliar().getCidade()+ " - " + f.getEnderecoCompletoFamiliar().getBairro()+ " - " + f.getEnderecoCompletoFamiliar().getNr()); %></td>
                        <input type="hidden" name="enderecoFamiliar" value="<%out.write("" + f.getEnderecoFamiliar());%>" /><br />

                        <label> Paciente: </label>
                        <td><% out.write(f.getCpfPaciente() + " - " + f.getPacienteFamiliar().getNome()); %></td>
                        <input type="hidden" name="cpfPaciente" value="<%out.write("" + f.getCpfPaciente());%>" /><br />
                        <input type="submit" value="Alterar" /><br /><br />
                      <form/>
                  <%}%>
            </div>   
     </body>
<script>
            if (document.getElementByName("foneFixo").value === ""){                    
                document.getElementByName("validafonefixo").innerHTML = "Informe o TELEFONE FIXO";
                foneFixo[0].focus();
                exit(0);
            }            

            if (document.getElementByName("foneCelular").value === "") {                    
                document.getElementByName("validafonecelular").innerHTML = "Informe o TELEFONE CELULAR";
                foneCelular[0].focus();
                exit(0);
            }                            
        </script>                       
</html>
