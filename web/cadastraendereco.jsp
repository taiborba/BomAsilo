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
        <title>Endereco</title>
        <link rel="stylesheet" href="styles/estilos.css">
        <script src="scripts/formatacampos.js"></script>
        
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
                <h1>Cadastro de Endereco </h1>
                 <label> 
                    <%
                        if(request.getParameter("pmensagem") != null)         
                            out.write(request.getParameter("pmensagem"));
                    %>
                </label>
               
                <hr /> 
            <div class="container" >
           
                   
                    <form action="recebedadosendereco.jsp" method="POST">
                        <label>Cep</label>
                        <input id="cep" name="cep"   type="text" required="required"  maxlength="9"/> <br/>
                        <label id="validacep" class="validacampos"></label> 
                   
                        <label>Rua</label>
                        <input id="rua" name="rua" type="text" required="required" maxlength="100" /> <br />
                        <label id="validarua" class="validacampos"></label>
                   
                        <label>Nr</label>
                        <input id="nr" name="nr" type="text" required="required" maxlength="10" /> <br />
                        <label id="validaNr" class="validacampos"></label>
                    
                        <label>Complemento</label>
                        <input id="complemento" name="complemento" type="text" required="required" maxlength="40" /> <br />
                        <label id="validacomplemento" class="validacampos"></label>
                    
                        <label>Bairro</label>
                        <input id="bairro" name="bairro" type="text" required="required"  maxlength="75" /> <br />
                        <label id="validaBairro" class="validacampos"></label>
                   
                        <label>Cidade</label>
                        <input id="cidade" name="cidade" type="text" required="required" maxlength="60" /> <br />
                        <label id="validaCidade" class="validacampos"></label>
                    
                        <label>Uf</label>
                        <input id="uf" name="uf" type="text" required="required" pmaxlength="14" /> <br />
                        <label id="validaUf" class="validacampos"></label>
            </div>
                     
                        <input type="button" value="Salvar" onclick="enviarDados()" />
                        <input type="reset" value="Cancelar" onclick="location.href = 'menu.jsp';" />
                    </form>
            </article>
        </section>
                
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer> 
                
<script>
    function enviarDados(){

            var cep = document.getElementsByName("cep");
            if(cep[0].value === ""){
                cep[0].focus();
                alert("Informe o cep");
                exit(0);
            }

            var rua = document.getElementsByName("rua");
            if(rua[0].value === ""){
                rua[0].focus();
                alert("Informe a rua");
                exit(0);
            }

            var nr = document.getElementsByName("nr");
            if(nr[0].value === ""){
                nr[0].focus();
                alert("Informe o nr");
                exit(0);
            }
            
             var bairro = document.getElementsByName("bairro");
            if(bairro[0].value === ""){
                bairro[0].focus();
                alert("Informe o bairro");
                exit(0);
            }
              
             var cidade = document.getElementsByName("cidade");
            if(cidade[0].value === ""){
                cidade[0].focus();
                alert("Informe a cidade");
                exit(0);
            }
             var uf = document.getElementsByName("uf");
            if(uf[0].value === ""){
                uf[0].focus();
                alert("Informe a uf");
                exit(0);
            }
            document.forms[0].submit();
    }        
    
</script>    
    </body>
</html>