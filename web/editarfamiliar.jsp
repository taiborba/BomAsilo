<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Familiar"%>
<%@page import="modelos.Paciente"%>
<%@page import="modelos.Usuario"%>
<%@page import="modelos.Endereco"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/estilos.css">
        <title>Bom Asilo</title>
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
        <section>
            <nav>
                <script src="scripts/menu.js"></script> 
            </nav>
            <article>
                <body>
                    <h1>Editar Familiar</h1>
                    <hr />
                    <%
                      Integer pidFamiliar = Integer.parseInt(request.getParameter("idFamiliar"));
                      Familiar f = new Familiar();
                      if (pidFamiliar != null){
                          f = f.consultarFamiliar(pidFamiliar);
                      } 
                    %>
                      
                     <%

                        Usuario usuario = new Usuario();
                        List<Usuario> usu = usuario.consultarGeral();
                             
                        Endereco endereco = new Endereco();
                        List<Endereco> end = endereco.consultarGeral();
                            
                        Paciente paciente = new Paciente();
                        List<Paciente> pac = paciente.consultarGeral();
                    %>
                    
                    <form action="recebeeditafamiliar.jsp" method="POST">
                        <label>Nome</label>
                        <input type="text" name="nome" 
                               value="<%out.write(f.getNome());%>" 
                               maxlength="40"/>
                        <br />
                        <label>CPF</label>
                        <input type="text" name="cpfFamiliar" 
                               value="<%out.write(f.getCpfFamiliar());%>" 
                               maxlength="14"/>
                        <br />
                        <label>RG</label>
                        <input type="text" name="rg" 
                               value="<%out.write(f.getRg());%>" 
                               maxlength="14"/>
                        <br />
                        <label>Telefone Fixo</label>
                        <input type="text" name="foneFixo" 
                               value="<%out.write(""+f.getFoneFixo());%>" 
                               maxlength="20"/>
                        <br />
                        <label>Telefone Celular</label>
                        <input type="text" name="foneCelular" 
                               value="<%out.write(""+f.getFoneCelular());%>" 
                               maxlength="20"/>
                        <br />
                        <label>Selecione o Paciente </label> 
                        <select name="cpfPaciente">
                            <% if (f.getCpfPaciente() != null){%>
                            <option value="<%out.write(""+f.getCpfPaciente());%>"><%out.write(""+f.getPacienteFamiliar().getNome());%></option> 
                                <%} else {%>
                            <option value="" hidden disabled selected> --Selecione o Paciente--</option>
                            <%}%>
                            <% for(Paciente p: pac){ %>
                            <option value="<%out.write(""+p.getCpfPaciente());%>">
                            <% out.write(p.getNome()); %></option><%}%>
                        </select> 
                        <br />
                        
                        <label>Login Familiar</label>
                        <select name="loginFamiliar">
                            <% if (f.getLoginFamiliar() != null){%>
                            <option value="<%out.write(""+f.getLoginFamiliar());%>"><%out.write(""+f.getLoginFamiliar());%></option> 
                                <%} else {%>
                            <option value="" hidden disabled selected> --Selecione o Login--</option>
                            <%}%>
                            <% for(Usuario u: usu){     %>
                            <option value="<%out.write(""+u.getLogin());%>">
                            <% out.write(u.getLogin()); %></option><%}%>
                        </select> 
                        <br />
                        
                        <label>Selecione o Endereco </label> 
                        <select name="enderecoFamiliar">
                            <% if (f.getEnderecoFamiliar() != null){%>
                            <option value="<%out.write(""+f.getEnderecoFamiliar());%>"><%out.write(""
                                    +f.getEnderecoCompletoFamiliar().getCep()+ " - " + f.getEnderecoCompletoFamiliar().getRua()+ " - " + f.getEnderecoCompletoFamiliar().getNr());%></option> 
                                <%} else {%>
                            <option value="" hidden disabled selected> --Selecione o Endereço--</option>
                            <%}%>
                            <% for(Endereco e: end){ %>
                            <option value="<%out.write(""+e.getIdEndereco());%>">
                                <% out.write(e.getCep()+ " - " + e.getRua()+ " - " + e.getNr()); %></option><%}%>
                        </select> 
                        <br />
                        
                        <input type="hidden" name="idFamiliar" 
                               value="<%out.write(""+f.getIdFamiliar());%>" />
                         <br />
                        <hr />
                         <input type="submit" value="Alterar" onclick="location.href = 'consultafamiliar.jsp';"/>
                        <input type="reset" value="Cancelar" onclick="location.href = 'consultafamiliar.jsp';" />
                    </form>
                </body>
            </article>
        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>                    
</html>
