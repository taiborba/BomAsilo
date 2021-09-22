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
<%@page import="java.sql.Date"%>
<%@page import="modelos.Cargo" %>
<%@page import="java.util.List"%>
<%@page import="modelos.Endereco"%>
<%@page import="modelos.Usuario"%>
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
        
                    <h1>Editar Funcionário</h1>
                    <hr />
                    <%
                      Integer idFuncionario = Integer.parseInt(request.getParameter("idFuncionario"));
                      Funcionario f = new Funcionario();
                      if (idFuncionario != null){
                          f = f.consultarFuncionario(idFuncionario);
                      } 
                    %>
                    
                    <%
                            Cargo cargo = new Cargo();
                            List<Cargo> car = cargo.consultarGeral();
                             
                            Endereco endereco = new Endereco();
                            List<Endereco> end = endereco.consultarGeral();
                            
                            Usuario usuario = new Usuario();
                            List<Usuario> usu = usuario.consultarGeral();
                        %>
                    <form action="recebeeditafuncionario.jsp" method="POST">
                        <label>Nome</label>
                        <input type="text" name="nome" 
                                value="<%out.write(f.getNome());%>" />

                        <br />
                        <label>CPF</label>
                        <input type="text" name="cpfFuncionario" 
                               value="<%out.write(f.getCpfFuncionario());%>" />
                        <br />
                        <label>RG</label>
                        <input type="text" name="rg" 
                               value="<%out.write(f.getRg());%>" />
                        
                        <br />
                        <label>Cargo</label>
                        <select name="idCargo">
                            <option value="<%out.write(""+f.getIdCargo());%>">
                            <% out.write(f.getCargoFuncionario().getDescCargo()); %>
                            </option>
                            <% for(Cargo c: car){     %>
                            <option value="<%out.write(""+c.getIdCargo());%>">
                            <% out.write(c.getDescCargo()); %>
                            </option><%}%>
                        </select>

                        <br />
                        <label>Registro Profissional</label>
                        <input type="text" name="regProfissional" 
                               value="<%out.write(f.getRegProfissional());%>" />
                        <br />
                        <label>Data de Admissão</label>
                        <input type="date" name="dataAdmissao" 
                               value="<%out.write(""+f.getDataAdmissao());%>" />
                        
                        <br />
                        <label>Data de Desligamento</label>
                        <input type="date" name="dataDesliga" 
                                value="<%if (f.getDataDesliga() != null){out.write(""+f.getDataDesliga());}%>" />

                        <br />
                        <label>E-mail</label>
                        <input type="text" name="emailFuncionario" 
                               value="<%out.write(f.getEmailFuncionario());%>" />
                        
                        <br />
                        <label>Telefone</label>
                        <input type="text" name="foneFuncionario" 
                               value="<%out.write(""+f.getFoneFuncionario());%>" 
                               onkeypress="mask(this, mphone);" onblur="mask(this, mphone);"/><br />
                        
                        <label>Selecione o Endereco </label> 
                        <select name="enderecoFuncionario">
                            <% if (f.getEnderecoFuncionario() != null){%>
                            <option value="<%out.write(""+f.getEnderecoFuncionario());%>"><%out.write(""
                                    +f.getEnderecoCompletoFuncionario().getCep()+ " - " + f.getEnderecoCompletoFuncionario().getRua()+ " - " + f.getEnderecoCompletoFuncionario().getNr());%></option> 
                                <%} else {%>
                            <option value="" hidden disabled selected> --Selecione o Endereço--</option>
                            <%}%>
                            <% for(Endereco e: end){ %>
                            <option value="<%out.write(""+e.getIdEndereco());%>">
                                <% out.write(e.getCep()+ " - " + e.getRua()+ " - " + e.getNr()); %></option><%}%>
                        </select><br /> 
                        
                        <input type="hidden" name="idFuncionario" 
                               value="<%out.write(""+f.getIdFuncionario());%>" />
                        
                        <br />
                        <hr />
                        <input type="submit" value="Alterar" onclick="location.href = 'consultafuncionario.jsp';"/>
                        <input type="reset" value="Cancelar" onclick="location.href = 'consultafuncionario.jsp';" />
                    </form>  
                               <script>
    
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
