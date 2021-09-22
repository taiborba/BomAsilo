<!--Pronto-->

<%@page import="modelos.Quarto"%>

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
            <article>
                <body>
                    <h1>Editar Quarto</h1>
                    <hr />
                    
                    <%
                    Integer idQuarto = Integer.parseInt(request.getParameter("idQuarto"));
                      Quarto q = new Quarto();
                      if (idQuarto != null){
                          q = q.consultarQuarto(idQuarto);
                      }    
                    %>
                    <form action="recebeeditaquarto.jsp" method="POST">
                     <input type="hidden" name="idQuarto" value="<%out.write("" + q.getIdQuarto());%>" />
                     
                           <label>Descrição do Quarto</label>
                        <input type="text" name="descrQuarto" 
                         value="<%out.write(""+q.getDescrQuarto());%>" />
                       
                        <br />
                        <input type="submit" value="Alterar" onclick="location.href = 'consultaquarto.jsp';" />
                        <input type="reset" value="Cancelar" onclick="location.href = 'consultaquarto.jsp';" />
                    </form>
                </body>
            </article>
        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>                    
</html>
