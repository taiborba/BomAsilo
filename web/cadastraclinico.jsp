
<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Especialidade" %>
<%@page import="modelos.Clinico"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/estilos.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>  
        <script src="scripts/formatacampos.js"></script>
    </head>
     <header>
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
                <h1>Cadastro de Clínico </h1>
                <hr /> 
                <label class="cabecalho" id="msg"> 
                    <%
                        if(request.getParameter("pmensagem") != null)         
                            out.write(request.getParameter("pmensagem"));
                    %>
                </label>
                
                    <%
                         Especialidade especialidade = new Especialidade();
                        List<Especialidade> esp = especialidade.consultarGeral();
                        %>
                <form action="recebedadosclinico.jsp" method="POST">
                    <div>
                        <label>Nome Clínico</label>
                        <input id="nomeClinico" type="text" required=requeride name="nomeClinico"/><br />
                        
                        <label>Código de Registro</label>
                        <input type="text" name="codRegistro" /><br />
                          
                        <label>Especialidade</label> 
                        <select name="idEspecialidade">
                            <option value="" hidden disabled selected> --Selecione a especialidade--</option>
                            <% for(Especialidade e: esp){ %>
                            <option value="<%out.write(""+e.getIdEspecialidade());%>">
                            <% out.write(""+e.getDescEspecialidade()); %></option><%}%>
                        </select> 
                        <a href="cadastraespecialidade.jsp" target="_blank"> Cadastrar Especialidade </a></br>

                        <input type="button" value="Salvar" onclick="enviarDados()" />
                        <input type="reset" value="Cancelar" onclick="location.href = 'menu.jsp';" />
                    </div>   
                </form>
            </article>
        </section>
<script>
    function enviarDados(){
            var nomeClinico = document.getElementsByName("nomeClinico");
            if(nomeClinico[0].value === ""){
                nomeClinico[0].focus();
                alert("Informe o nome do clínico");
                exit();
            }
            var codRegistro = document.getElementsByName("codRegistro");
            if(codRegistro[0].value === ""){
                codRegistro[0].focus();
                alert("Informe o código do registro");
                exit();
            }
            var idEspecialidade = document.getElementsByName("idEspecialidade");
            if(idEspecialidade[0].value === ""){
                idEspecialidade[0].focus();
                alert("Informe o código da especialidade");
                exit();
            }
            document.forms[0].submit();
    }        
    
</script>    
    </body>
</html>
