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
                    <h1>Editar Cargo</h1>
                    <hr />
                    <%
                      Integer idCargo = Integer.parseInt(request.getParameter("idCargo"));
                      Cargo c = new Cargo();
                      if (idCargo != null){
                          c = c.consultarCargo(idCargo);
                      } 
                    %>
                    <form action="recebeeditacargo.jsp" method="POST">
                        <label>Descrição do Cargo</label>                       
                        <input type="text" name="descCargo" 
                               value="<%out.write(c.getDescCargo());%>" />
                        <input type="hidden" name="idCargo" 
                               value="<%out.write("" + c.getIdCargo());%>" />
                        
                        

                        <br />
                        <hr />
                        <input type="submit" value="Alterar" onclick="location.href = 'consultacargo.jsp';" />
                        <input type="reset" value="Cancelar" onclick="location.href = 'consultacargo.jsp';" />
                    </form>
            </body>        
</html>
