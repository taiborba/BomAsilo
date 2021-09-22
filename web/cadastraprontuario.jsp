<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Paciente"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <a href="cadastraprontuario.jsp"></a>
        <title>Bom Asilo</title>
        <link rel="stylesheet" href="styles/estilos.css">
    </head>
        <header>
     
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
                <h1>Cadastro de Prontuario </h1>
                <hr /> 
                <label> 
                    <%
                        if(request.getParameter("pmensagem") != null)         
                            out.write(request.getParameter("pmensagem"));
                    %>
                </label>
                
                    <%
                        Paciente paciente = new Paciente();
                          List<Paciente> pac = paciente.consultarGeral();
                    %>
                
                <form action="recebedadosprontuario.jsp" method="POST">
                    <div>
                        <label>Selecione o Paciente </label> 
                        <select name="cpfPaciente">
                            <option value="" hidden disabled selected> --Selecione o Paciente--</option>
                            <% for(Paciente p: pac){ %>
                            <option value="<%out.write(""+p.getCpfPaciente());%>">
                            <% out.write(p.getCpfPaciente() + " - " + p.getNome()); %></option><%}%>
                        </select> 
                        
                        <label>Tipo Sanguineo</label>
                        <input type="text"  name="tipoSangue" maxlength="3" /> <br />

                        <label>Peso</label>
                        <input type="text" name="peso" maxlength="5"/> <br />

                        <label>Altura</label>
                        <input type="text" name="altura" maxlength="5" /> <br />
                        
                        <label for="limitCognitiva"><blockquote><input type="checkbox" id="limitCognitiva" name="limitCognitiva"/></blockquote>Limitação Cognitiva?</label>
                        <br />
                                               
                        <label for="limitLocomocao"><blockquote><input type="checkbox" id="limitLocomocao" name="limitLocomocao"/></blockquote>Limitação Locomotiva?</label>
                        <br />
                        
                        <label for="limitVisao"><blockquote><input type="checkbox" id="limitVisao" name="limitVisao"/></blockquote>Limitação Visual?</label>
                        <br />
                      
                        
                        <label for="limitAudicao"><blockquote><input type="checkbox" id="limitAudicao" name="limitAudicao"/></blockquote>Limitação Auditiva?</label>
                        <br/><br/>
                         
                        <label>Outra Limitação</label>
                        <input type="text" name="limitOutras" /> <br /> 
                        
                        <label>Alergia</label>
                        <input type="text" name="descAlergia" /> <br /> 
                        
                        <label>Ocupação</label>
                        <input type="text" name="descOcupacao" /> <br /> 
                        
                       
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
            var tipoSangue = document.getElementsByName("tipoSangue");
            if(tipoSangue[0].value === ""){
                tipoSangue[0].focus();
                alert("Informe o Tipo Sanguineo");
                exit();
            }
            
            var peso = document.getElementsByName("peso");
            if(peso[0].value === ""){
                peso[0].focus();
                alert("Informe o Peso ");
                exit();
            }
            
            var altura = document.getElementsByName("altura");
            if(altura[0].value ===""){
                altura[0].focus();
                alert("Informe a Altura");
                exit();
            }

            document.forms[0].submit();
    }        
</script>    
    </body>
</html>