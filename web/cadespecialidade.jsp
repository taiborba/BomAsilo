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
        <title>Cadastro Especialidade</title>
        <link rel="stylesheet" href="styles/estilos.css">
    </head>
    
    <body>
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
              
                <h1>Cadastro de Especialidade </h1>
                <hr /> 
                <label class="cabecalho" id="msg"> 
                    <%
                        if(request.getParameter("pmensagem") != null)         
                            out.write(request.getParameter("pmensagem"));
                    %>
                </label>
                
                <form action="recebedadosespecial.jsp" method="POST">
                    
                    <div>
                       
                        <label>Descrição</label>
                        <input type="text" name="descEspecialidade" />
                        <br/> <br/>

                     
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
            var descEspecialidade = document.getElementsByName("descEspecialidade");
            if(descEspecialidade[0].value === ""){
                descEspecialidade[0].focus();
                alert("Informe a descrição");
                exit();
            }

            document.forms[0].submit();
    }        
    
</script>    
    </body>
</html>