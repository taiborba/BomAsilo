<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <!DOCTYPE html>
    <head>
     
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/home.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
      <!--        
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>  
        --> 
        <script src="scripts/formatacampos.js"></script>
          <title>Bom Asilo</title>
        </head> 
    <body>
        
        <script>
            function validaAcesso(p1) {
                if (p1 === "") {
                    alert("Realize o acesso!");
                    window.top.location.href = "index.html";
                }
            }
            
        </script> 

        <%
            String tipoAcesso = "";
            if (session.getAttribute("tipoAcesso") != null) {
                tipoAcesso = session.getAttribute("tipoAcesso").toString();
            }
            System.out.println("Tipo:" + tipoAcesso);
            out.write("<script>validaAcesso('" + tipoAcesso + "');</script>");
        %>
            
        <label class="cabecalho" id="msg" id="bomasilo" action="" > 
            <%
                if (request.getParameter("pmensagem") != null) {
                    out.write(request.getParameter("pmensagem"));
                }
            %>
        </label>
        
        
         <div>
     
             <br/>
             <blockquote><h1>Bom Asilo</h1></blockquote>

                
                <blockquote>Nossa principal missão é promover a qualidade de vida e inclusão social da pessoa <br/>
                            idosa em situação de vulnerabilidade através de moradia e atividades sociais.</blockquote>
                
                <blockquote>Contamos com a tecnologia para aproximar as familias ao nosso lar e proporcionar <br/>
                            o contato a rotina do dia a dia a qualquer momento.</blockquote>
                
                <blockquote>Estamos localizados no Endereço:<br/>
                            Rua Castro Alvez, nº 8108<br/>
                            Cep: 69327-774, Bairro São José<br/>
                            Cidade: Blumenau - SC</blockquote>
                                   
                <blockquote>Entre em contato através dos seguintes contatos:<br/>
                            Telefone para contato: (47) 90739-6474<br/>
                            E-mail: sistemabom.asilo@gmail.com</blockquote>
                                        
               
        </div> 
     
        
        </body>
        </html>