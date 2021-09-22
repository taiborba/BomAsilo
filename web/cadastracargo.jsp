<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Cargo" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

        <h1>Cadastrar Cargo</h1>
        <label class="cabecalho" id="msg"> 
                    <%
                        if(request.getParameter("pmensagem")  != null) {         
                            out.write(request.getParameter("pmensagem"));
                        }
                    %>
                </label>
                <form action="recebedadoscargo.jsp" method="POST">
                    <div>
                        
                        <label>Descrição do Cargo: </label>
                        <input type="text" name="descCargo" /> <br />

                        <input type="button" value="Salvar" onclick="enviarDados()" />
                        <input type="reset" value="Cancelar" onclick="location.href = 'menu.jsp';" />
                    </div>   
                </form>
                                       
<script>
    function enviarDados(){
            var descCargo = document.getElementsByName("descCargo");
            if(descCargo[0].value === ""){
                descCargo[0].focus();
                alert("Informe a Descrição do Cargo");
                exit();
            }

            document.forms[0].submit();
    }
</script>    
    </body>
</html>
