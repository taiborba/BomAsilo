<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Clinico"%>
<%@page import="modelos.Especialidade"%>
<%@page import="java.util.List"%>
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
        <article>
            <body>
                <h1>Editar Clínico</h1>
                <hr />

                <%
                    Integer idClinico = Integer.parseInt(request.getParameter("idClinico"));

                    Clinico c = new Clinico();
                    if (idClinico != null) {
                        c = c.consultarClinico(idClinico);
                    } 
                    
                %>
                
                <%
                    Especialidade especialidade = new Especialidade();
                    List<Especialidade> esp = especialidade.consultarGeral();
                %>

                <form action="recebeeditaclinico.jsp" method="POST">

                    <input type="hidden" name="idClinico" value="<%out.write("" + c.getIdClinico());%>" />
                   
                    <label>Nome</label>
                    <input type="text" name="nomeClinico"
                           value="<%out.write("" + c.getNomeClinico());%>" />
                    <label id="validanomeclinico" class="validacampos"></label>
                    <br />
                    
                    <label>Cód. Registro Prossicional</label>
                    <input type="text" name="codRegistro" value="<%out.write(""+ c.getCodRegistro());%>" />
                    <br />
                   
                    <label>Especialidade </label> 
                        <select name="idEspecialidade">
                            <% if (c.getIdEspecialidade() != null){%>
                            <option value="<%out.write(""+c.getIdEspecialidade());%>"><%out.write(""
                                +c.getEspecialidadeClinico().getDescEspecialidade());%></option> 
                            <%} else {%>
                            <option value="" hidden disabled selected> --Selecione o Endereço--</option>
                            <%}%>
                            <% for(Especialidade e: esp){ %>
                            <option value="<%out.write(""+e.getIdEspecialidade());%>">
                            <% out.write(e.getDescEspecialidade()); %></option><%}%>
                        </select> 
                        <br />
                        
                    <input type="submit" value="Salvar" onclick="location.href = 'consultaclinico.jsp';" />
                    <input type="reset" value="Cancelar" onclick="location.href = 'consultaclinico.jsp';" />
                </form>
            </body>
        </article>
    </section>
    <footer>
        <script src="scripts/rodape.js"></script>
    </footer>    
</html>
