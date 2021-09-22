<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Familiar"%>
<%@page import="modelos.Usuario"%>
<%@page import="modelos.Endereco"%>
<%@page import="modelos.Paciente"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
        <link rel="stylesheet" href="styles/estilos.css">
        <script src="scripts/formatacampos.js"></script>
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
            
            <article>
                <h1>Cadastro de Familiar </h1>
                <hr /> 
             
                    <label class="cabecalho" id="msg"> 
                    <%
                        if(request.getParameter("pmensagem") != null)         
                            out.write(request.getParameter("pmensagem"));
                    %>
                     </label>
                     
                    <%
                        Usuario usuario = new Usuario();
                        List<Usuario> usu = usuario.consultarGeral();
                             
                        Endereco endereco = new Endereco();
                        List<Endereco> end = endereco.consultarGeral();
                            
                        Paciente paciente = new Paciente();
                        List<Paciente> pac = paciente.consultarGeral();
                    %>
               
                    <form action="recebedadosfamiliar.jsp" method="POST">
                      <div>
                        
                        <label>Nome</label>
                        <input id="nome" name="nome" type="text" required="required" maxlength="100"/> <br />
                        <label id="validanome" class="validacampos"></label>

                        <label>Cpf</label>
                        <input id="cpfFamiliar" name="cpfFamiliar"   type="text" required="required" maxlength="14"/> <br/>
                        <label id="validacpf" class="validacampos"></label> 

                        <label>Rg</label>
                        <input id="rg" name="rg" type="text" required="required" maxlength="14" /> <br />
                        <label id="validarg" class="validacampos"></label>

                        <label>Fone Fixo</label>
                        <input id="foneFixo" name="foneFixo" type="text" required="required" maxlength="15" 
                               onkeypress="mask(this, mphone);" onblur="mask(this, mphone);"/> <br />
                        <label id="validaFoneFixo" class="validacampos"></label>

                        <label>Fone Celular</label>
                        <input id="foneCelular" name="foneCelular" type="text" required="required" maxlength="15" 
                               onkeypress="mask(this, mphone);" onblur="mask(this, mphone);"/> <br />
                        <label id="validaFoneCelular" class="validacampos"></label>

                        <label>Login Familiar</label>
                        <select name="loginFamiliar">
                            <option value="" hidden disabled selected> --Selecione o Login--</option>
                            <% for(Usuario u: usu){     %>
                            <option value="<%out.write(""+u.getLogin());%>">
                            <% out.write(u.getLogin()); %></option><%}%>
                        </select> 
                        <a href="cadastrarusuario.jsp" target="_blank"> Cadastrar Login </a>
                        
                        <label>Selecione o Endereco </label> 
                        <select name="enderecoFamiliar">
                            <option value="" hidden disabled selected> --Selecione o Endereço--</option>
                            <% for(Endereco e: end){ %>
                            <option value="<%out.write(""+e.getIdEndereco());%>">
                            <% out.write(e.getCep()+ " - " + e.getRua()+ " - " +e.getNr()); %></option><%}%>
                        </select> 
                         <a href="cadastraendereco.jsp" target="_blank"> Cadastrar Endereço </a> <br />
                        
                        <label>Selecione o Paciente </label> 
                        <select name="cpfPaciente">
                            <option value="" hidden disabled selected> --Selecione o Paciente--</option>
                            <% for(Paciente p: pac){ %>
                            <option value="<%out.write(""+p.getCpfPaciente());%>">
                            <% out.write(p.getCpfPaciente()+ " - " + p.getNome()); %></option><%}%>
                        </select> 
                        <a href="cadastrapaciente.jsp" target="_blank"> Cadastrar Paciente </a> <br />
                     
                        <input type="button" value="Salvar" onclick="enviarDados()" />
                        <input type="reset" value="Cancelar" onclick="location.href = 'menu.jsp';" />
                    </div>
                </form>
            </article>
        </section>
                
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer> 
                
<script>
    function enviarDados(){
            var nome = document.getElementsByName("nome");
            if(nome[0].value === ""){
                nome[0].focus();
                alert("Informe o nome");
                exit(0);
            }

            var cpfFamiliar = document.getElementsByName("cpfFamiliar");
            if(cpfFamiliar[0].value === ""){
                cpfFamiliar[0].focus();
                alert("Informe o cpf");
                exit(0);
            }

            var rg = document.getElementsByName("rg");
            if(rg[0].value === ""){
                rg[0].focus();
                alert("Informe o rg");
                exit(0);
            }

          
             var foneCelular = document.getElementsByName("foneCelular");
            if(foneCelular[0].value === ""){
                foneCelular[0].focus();
                alert("Informe o Número do Celular");
                exit(0);
            }
              
             var cpfPaciente = document.getElementsByName("cpfPaciente");
            if(cpfPaciente[0].value === ""){
                cpfPaciente[0].focus();
                alert("Informe o Paciente");
                exit(0);
            }
              
             var enderecoFamiliar = document.getElementsByName("enderecoFamiliar");
            if(enderecoFamiliar[0].value === ""){
                enderecoFamiliar[0].focus();
                alert("Informe o id do endereco do familiar");
                exit(0);
            }
            document.forms[0].submit();
    }        
    function mask(o, f) {
       setTimeout(function() {
        var v = mphone(o.value);
        if (v != o.value) {
          o.value = v;
            }
        }, 1);
    }

    function mphone(v) {
        var r = v.replace(/\D/g, "");
            r = r.replace(/^0/, "");
        if (r.length > 10) {
            r = r.replace(/^(\d\d)(\d{5})(\d{4}).*/, "($1) $2-$3");
        } else if (r.length > 5) {
            r = r.replace(/^(\d\d)(\d{4})(\d{0,4}).*/, "($1) $2-$3");
        } else if (r.length > 2) {
             r = r.replace(/^(\d\d)(\d{0,5})/, "($1) $2");
        } else {
            r = r.replace(/^(\d*)/, "($1");
        } return r;
    }
    
</script>    
</body>
</html>