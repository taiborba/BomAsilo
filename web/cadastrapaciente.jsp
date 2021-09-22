<%@page import="java.util.List"%>
<%@page import="modelos.Endereco"%>
<%@page import="modelos.Quarto"%>

<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
        <link rel="stylesheet" href="styles/estilos.css">
    </head>
    <body>
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
        
        <section>
            <nav>
                <script src="scripts/menu.js"></script> 
            </nav>
            <article>
                <h1>Cadastro de Pacientes </h1>
                <hr /> 
                <label> 
                     <%
                        if(request.getParameter("pmensagem") != null) {         
                            out.write(request.getParameter("pmensagem"));                            
                        }
                    %>
                    
                    <%

                        Endereco endereco = new Endereco();
                        List<Endereco> end = endereco.consultarGeral();
                        
                        Quarto quarto = new Quarto();
                        List<Quarto> qua = quarto.consultarGeral();

                     %>  
                </label>
                <form action="recebedadospaciente.jsp" method="POST">
                    
                    <div>
                        <label>Nome</label>
                        <input type="text" name="nome" required="required" maxlength="70"/> <br />
                        
                        
                        <label>Cpf</label>
                        <input id="cpfPaciente" name="cpfPaciente" type="text" required="required" 
                        pattern="[0-9]*" maxlength="14" /> <br/>

                        <label>Rg</label>
                        <input type="text" name="rg" required="required" maxlength="14"/> <br />
                        
                        <label>Data de Nascimento</label>
                        <input type="date" name="dataNascimento" required="required" maxlength="10" min="1900-01-01" max="2999-12-31"/> <br />
                         
                        <label>Quarto</label>
                        <select name="idQuarto">
                                <option value="" hidden disabled selected> --Selecione o Quarto--</option>
                                <% for(Quarto q: qua){ %>
                                    <option value="<%out.write(""+q.getIdQuarto());%>">
                                    <% out.write(q.getDescrQuarto()); %>
                                    </option>
                                 <%}%> 
                            </select>
                            <a href="cadastraquarto.jsp" target="_blank"> Cadastrar Quarto </a> <br />
                                                 
                        <label>Selecione o Endereco </label> 
                            <select name="enderecoPaciente">
                                <option value="" hidden disabled selected> --Selecione o Endereço--</option>
                            <% for(Endereco e: end){ %>
                            <option value="<%out.write(""+e.getIdEndereco());%>">
                            <% out.write(e.getCep()+ " - " + e.getRua()+ " - " +e.getNr()); %></option><%}%>
                        </select> 
                           <a href="cadastraendereco.jsp" target="_blank"> Cadastrar Endereço </a> <br />

                        <label>Nome para Contato</label>
                        <input type="text" name="nomeContato" required="required" maxlength="40"/> <br />
                        
                        
                        <label>Telefone para Contato</label>
                        <input type="text" name="foneContato" maxlength="20" 
                               onkeypress="mask(this, mphone);" onblur="mask(this, mphone);" /> <br />
                 
               
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
                exit();
            }
        
            var cpfPaciente = document.getElementsByName("cpfPaciente");
            if(cpfPaciente[0].value === ""){
                cpfPaciente[0].focus();
                alert("Informe o cpf do paciente");
                exit();
            }

            var rg = document.getElementsByName("rg");
            if(rg[0].value === ""){
                rg[0].focus();
                alert("Informe o rg");
                exit();
            }

            var dataNascimento = document.getElementsByName("dataNascimento");
            if(dataNascimento[0].value === ""){
                dataNascimento[0].focus();
                alert("Informe a data de nascimento");
                exit();
            }
            
           
            var idQuarto = document.getElementsByName("idQuarto");
            if(idQuarto[0].value === ""){
                idQuarto[0].focus();
                alert("Informe o quarto");
                exit();
            }
            
            var enderecoPaciente = document.getElementsByName("enderecoPaciente");
            if(enderecoPaciente[0].value === ""){
                enderecoPaciente[0].focus();
                alert("Informe o Endereco do Paciente");
                exit();
            }
            
            var nomeContato = document.getElementsByName("nomeContato");
            if(nomeContato[0].value === ""){
                nomeContato[0].focus();
                alert("Informe o Nome para Contato");
                exit();
            }
            
            var foneContato = document.getElementsByName("foneContato");
            if(foneContato[0].value === ""){
                foneContato[0].focus();
                alert("Informe o Telefone para Contato");
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