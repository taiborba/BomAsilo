<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Funcionario" %>
<%@page import="modelos.Cargo" %>
<%@page import="java.util.List"%>
<%@page import="modelos.Endereco"%>
<%@page import="modelos.Usuario"%>
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
        
        <h1>Cadastrar Funcionário</h1>
          <label class="cabecalho" id="msg"> 
                    <%
                        if(request.getParameter("pmensagem") != null) {         
                            out.write(request.getParameter("pmensagem"));                            
                        }%>
                </label>
                
                        <%
                            Cargo cargo = new Cargo();
                            List<Cargo> car = cargo.consultarGeral();
                             
                            Endereco endereco = new Endereco();
                            List<Endereco> end = endereco.consultarGeral();
                            
                            Usuario usuario = new Usuario();
                            List<Usuario> usu = usuario.consultarGeral();
                        %>
                            
                <form action="recebedadosfuncionario.jsp" method="POST">
                    <div>
                        
                        <label>Nome: </label>
                        <input type="text" name="nome" /> <br />

                        <label>CPF: </label>
                        <input type="text" name="cpfFuncionario" /> <br />
                        
                        <label>RG: </label>
                        <input type="text" name="rg" /> <br />

                        <label>Cargo: </label>
                         <select name="idCargo">
                             <option value="" hidden disabled selected> --Selecione o Cargo--</option>
                            <% for(Cargo c: car){     %>
                            <option value="<%out.write(""+c.getIdCargo());%>">
                            <% out.write(c.getDescCargo()); %></option><%}%>
                        </select>
                        <a href="cadastracargo.jsp" target="_blank"> Cadastrar Cargo </a> <br/>

                        <label>Registro Profissional: </label>
                        <input type="text" name="regProfissional" required="required"/> <br />

                        <label>Data de Admissao: </label>
                        <input type="date" name="dataAdmissao" required="required" min="1900-01-01" max="2999-12-31"/> <br />

                        <label>Data de Desligamento: </label>
                        <input type="date" name="dataDesliga"  /> <br />

                        <label>E-mail: </label>
                        <input type="text" name="emailFuncionario" required="required"/> <br />

                        <label>Telefone: </label>
                        <input type="text" name="foneFuncionario" required="required"
                               onkeypress="mask(this, mphone);" onblur="mask(this, mphone);"/> <br />

                        <label>Login Funcionario</label>
                        <select name="loginFuncionario">
                            <option value="" hidden disabled selected> --Selecione o Login--</option>
                            <% for(Usuario u: usu){     %>
                            <option value="<%out.write(""+u.getLogin());%>">
                            <% out.write(u.getLogin()); %></option><%}%>
                        </select>
                        <a href="cadastrarusuario.jsp" target="_blank"> Cadastrar Login </a> <br />

                        <label>Selecione o Endereco </label> 
                        <select name="enderecoFuncionario">
                            <option value="" hidden disabled selected> --Selecione o Endereço--</option>
                            <% for(Endereco e: end){ %>
                            <option value="<%out.write(""+e.getIdEndereco());%>">
                            <% out.write(e.getCep()+ " - " + e.getRua()+ " - " +e.getNr()); %></option><%}%>
                        </select>
                        <a href="cadastraendereco.jsp" target="_blank"> Cadastrar Login </a> <br /><br />
    
                           
                        <input type="button" value="Salvar" onclick="enviarDados()" />
                        <input type="reset" value="Cancelar" onclick="location.href = 'menu.jsp';" />
                    </div>   
                </form>
                                       
<script>
    function enviarDados(){
            var nome = document.getElementsByName("nome");
            if(nome[0].value === ""){
                nome[0].focus();
                alert("Informe o Nome");
                exit();
            }

            var cpfFuncionario = document.getElementsByName("cpfFuncionario");
            if(cpfFuncionario[0].value === ""){
                cpfFuncionario[0].focus();
                alert("Informe o CPF");
                exit();
            }

            var rg = document.getElementsByName("rg");
            if(rg[0].value === ""){
                rg[0].focus();
                alert("Informe o RG");
                exit();
            }
            var idCargo = document.getElementsByName("idCargo");
            if(idCargo[0].value === ""){
                idCargo[0].focus();
                alert("Informe o Id do Cargo");
                exit();
            }

            var dataAdmissao = document.getElementsByName("dataAdmissao");
            if(dataAdmissao[0].value === ""){
                dataAdmissao[0].focus();
                alert("Informe a Data de Admissão");
                exit();
            }

           
            var foneFuncionario = document.getElementsByName("foneFuncionario");
            if(foneFuncionario[0].value === ""){
                foneFuncionario[0].focus();
                alert("Informe o Telefone");
                exit();
            }
            
             var loginFuncionario = document.getElementsByName("loginFuncionario");
            if(loginFuncionario[0].value === ""){
                loginFuncionario[0].focus();
                alert("Informe o Login");
                exit();
            }

            var enderecoFuncionario = document.getElementsByName("enderecoFuncionario");
            if(enderecoFuncionario[0].value === ""){
                EnderecoFuncionario[0].focus();
                alert("Informe o Endereço");
                exit();
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

