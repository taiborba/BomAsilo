<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page import="modelos.Especialidade"%>
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
            <body>
                    <h1>Editar Especialidade</h1>
                    <hr />
                    
                    <%
                      Integer idEspecialidade = Integer.parseInt(request.getParameter("idEspecialidade"));
                      Especialidade e = new Especialidade();
                      if (idEspecialidade != null){
                          e = e.consultarEspecialidade (idEspecialidade);
                      } 
                    %>
                    <form action="recebeeditaespecial.jsp" method="POST">
                        <label>Descrição Especialidade</label>
                      
                          <input type="text" name="descEspecialidade" 
                               value="<%out.write(""+e.getDescEspecialidade());%>" />
                        <input type="hidden" name="idEspecialidade" 
                               value="<%out.write("" + e.getIdEspecialidade());%>" />
                        
                        <br />
                        <input type="submit" value="Alterar" onclick="location.href = 'consultaespecialidade.jsp';" />
                        <input type="reset" value="Cancelar" onclick="location.href = 'consultaespecialidade.jsp';" />
                    </form>
                </body>
           
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>                    
</html>