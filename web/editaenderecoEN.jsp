<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Endereco"%>
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
        
    </head>
    <header>
        <script>
            function validaAcesso(p1) {
                if (p1 === "") {
                    alert("You need to login first!");
                    window.top.location.href = "indexEN.html";
                } else if ((p1 !== "adm") && (p1 !== "profsaude")) {
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
                <body>
                    <%
                        Integer idEndereco = Integer.parseInt(request.getParameter("idEndereco"));
                        Endereco e = new Endereco();
                        if (idEndereco != null) {
                            e = e.consultarEndereco(idEndereco);
                        }
                    %>
                    <div class="container">
                    <form action="recebeeditaenderecoEN.jsp" method="POST" id="bomasilo" action="" >
                        <h3>Edit Address</h3>
                        
                        <fieldset>
                        <label>Zip Code</label>
                        <input type="text" name="cep" 
                               value="<%out.write(e.getCep());%>" 
                               maxlength="14"/>
                        </fieldset>

                               <fieldset>
                        <label>Street</label>
                        <input type="text" name="rua" 
                               value="<%out.write(e.getRua());%>" 
                               maxlength="100"/>
                               </fieldset>

                               <fieldset>
                        <label>Number</label>
                        <input type="text" name="nr" 
                               value="<%out.write("" + e.getNr());%>" 
                               maxlength="10"/>
                               </fieldset>

                               <fieldset>
                        <label>Extra</label>
                        <input type="text" name="complemento" 
                               value="<%out.write("" + e.getComplemento());%>" 
                               maxlength="40"/>
                               </fieldset>

                               <fieldset>
                        <label>District</label>
                        <input type="text" name="bairro" 
                               value="<%out.write("" + e.getBairro());%>" 
                               maxlength="100"/>
                               </fieldset>

                               <fieldset>
                        <label>City</label>
                        <input type="text" name="cidade" 
                               value="<%out.write("" + e.getCidade());%>" 
                               maxlength="75"/>
                               </fieldset>

                               <fieldset>
                        <label>State</label>
                        <input type="text" name="uf" 
                               value="<%out.write("" + e.getUf());%>" 
                               maxlength="14"/>
                               </fieldset><br/>

                        <input type="hidden" name="idEndereco" 
                               value="<%out.write("" + e.getIdEndereco());%>" />

                        <input type="submit" value="Edit" onclick="location.href = 'consultaenderecoEN.jsp';" />
                        <input type="reset" value="Cancel" onclick="location.href = 'consultaenderecoEN.jsp';" />
                    </form>
                </div>
        </body>              
</html>
