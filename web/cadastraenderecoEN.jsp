<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" href="styles/estilos.css">
        <!--        
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>  
        -->
        <script src="scripts/formatacampos.js"></script>
        <link rel="icon" type="image/favicon" href="imagens/favicon.ico" />
    </head>
    <header>
        <script>
            function validaAcesso(p1) {
                if (p1 === "") {
                    alert("You need to login first!");
                    window.top.location.href = "index.html";
                } else if (p1 !== "adm") {
                    alert("You don't have the acess to this page!");
                    window.top.location.href = "menuEN.jsp";
                }
            }
        </script> 
    </header>
    <body>
        <%
            String tipoAcesso = "";
            if (session.getAttribute("tipoAcesso") != null) {
                tipoAcesso = session.getAttribute("tipoAcesso").toString();
            }
            System.out.println("Tipo:" + tipoAcesso);
            out.write("<script>validaAcesso(\"" + tipoAcesso + "\");</script>");
        %>
        
                <label class="cabecalho" id="msg" id="bomasilo" action="" > 
                    <%
                        if (request.getParameter("pmensagem") != null)
                            out.write(request.getParameter("pmensagem"));
                    %>
                </label>
               
                    <script>

                        function limpa_formulário_cep() {
                            //Limpa valores do formulário de cep.
                            document.getElementById('rua').value = ("");
                            document.getElementById('bairro').value = ("");
                            document.getElementById('cidade').value = ("");
                            document.getElementById('uf').value = ("");
                        }

                        function meu_callback(conteudo) {
                            if (!("erro" in conteudo)) {
                                //Atualiza os campos com os valores.
                                document.getElementById('rua').value = (conteudo.logradouro);
                                document.getElementById('bairro').value = (conteudo.bairro);
                                document.getElementById('cidade').value = (conteudo.localidade);
                                document.getElementById('uf').value = (conteudo.uf);
                            } //end if.
                            else {
                                //CEP não Encontrado.
                                limpa_formulário_cep();
                                alert("CEP Not Found.");
                            }
                        }

                        function maskcep(valor) {

                            var cep = valor
                            if (cep.length == 5) {
                                document.getElementById('cep').value = cep + "-"

                            }
                        }

                        function pesquisacep(valor) {

                            //Nova variável "cep" somente com dígitos.
                            var cep = valor.replace(/\D/g, '');

                            //Verifica se campo cep possui valor informado.
                            if (cep != "") {

                                //Expressão regular para validar o CEP.
                                var validacep = /^[0-9]{8}$/;

                                //Valida o formato do CEP.
                                if (validacep.test(cep)) {

                                    maskcep(cep)

                                    //Preenche os campos com "..." enquanto consulta webservice.
                                    document.getElementById('rua').value = "...";
                                    document.getElementById('bairro').value = "...";
                                    document.getElementById('cidade').value = "...";
                                    document.getElementById('uf').value = "...";

                                    //Cria um elemento javascript.
                                    var script = document.createElement('script');

                                    //Sincroniza com o callback.
                                    script.src = 'https://viacep.com.br/ws/' + cep + '/json/?callback=meu_callback';

                                    //Insere script no documento e carrega o conteúdo.
                                    document.body.appendChild(script);

                                } //end if.
                                else {
                                    //cep é inválido.
                                    limpa_formulário_cep();
                                    alert("invalid CEP.");
                                }
                            } //end if.
                            else {
                                //cep sem valor, limpa formulário.
                                limpa_formulário_cep();
                            }
                        }
                        ;
                    </script>
                     <div class="container" >
                    <form action="recebedadosenderecoEN.jsp" method="POST" id="bomasilo" action="">
                        <h3>Address Register </h3><br/>
                        
                        <fieldset>
                        <label>Zip Code </label>
                        <input name="cep" type="text" id="cep" class="mascCEP" value="" size="10" maxlength="9"
                               onblur="pesquisacep(this.value);" onkeypress="maskcep(this.value);" /><br />
                        </fieldset>

                        <fieldset>
                        <label>Street</label>
                        <input id="rua" name="rua" type="text" required="required" maxlength="100" /> <br />
                        <label id="validarua" class="validacampos"></label>
                        </fieldset>

                        <fieldset>
                        <label>Number</label>
                        <input id="nr" name="nr" type="text" required="required" maxlength="10" /> <br />
                        <label id="validaNr" class="validacampos"></label>
                        </fieldset>

                        <fieldset>
                        <label>Complement</label>
                        <input id="complemento" name="complemento" type="text" required="required" maxlength="40" /> <br />
                        <label id="validacomplemento" class="validacampos"></label>
                        </fieldset>

                        <fieldset>
                        <label>District</label>
                        <input id="bairro" name="bairro" type="text" required="required"  maxlength="75" /> <br />
                        <label id="validaBairro" class="validacampos"></label>
                        </fieldset>

                        <fieldset>
                        <label>City</label>
                        <input id="cidade" name="cidade" type="text" required="required" maxlength="60" /> <br />
                        <label id="validaCidade" class="validacampos"></label>
                        </fieldset>

                        <fieldset>
                        <label>State</label>
                        <input id="uf" name="uf" type="text" required="required" maxlength="14" /> <br />
                        <label id="validaUf" class="validacampos"></label>
                        </fieldset>
 
                <input type="button" value="Save" onclick="enviarDados()" />
                <input type="reset" value="Cancel" onclick= "window.top.location.href = 'menuEN.jsp';" />
                
                </form>    
               </div>
        <script>
            function enviarDados() {

                var cep = document.getElementsByName("cep");
                if (cep[0].value === "") {
                    cep[0].focus();
                    alert("Enter the Zip Code!");
                    exit(0);
                }

                var rua = document.getElementsByName("rua");
                if (rua[0].value === "") {
                    rua[0].focus();
                    alert("Enter the Street!");
                    exit(0);
                }

                var nr = document.getElementsByName("nr");
                if (nr[0].value === "") {
                    nr[0].focus();
                    alert("Enter the Number!");
                    exit(0);
                }

                var bairro = document.getElementsByName("bairro");
                if (bairro[0].value === "") {
                    bairro[0].focus();
                    alert("Enter the District!");
                    exit(0);
                }

                var cidade = document.getElementsByName("cidade");
                if (cidade[0].value === "") {
                    cidade[0].focus();
                    alert("Enter the City!");
                    exit(0);
                }
                var uf = document.getElementsByName("uf");
                if (uf[0].value === "") {
                    uf[0].focus();
                    alert("Enter the State!");
                    exit(0);
                }
                document.forms[0].submit();
            }

        </script>    
    </body>
</html>