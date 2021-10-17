
<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="modelos.Especialidade" %>
<%@page import="modelos.Clinico"%>
<%@page import="java.util.List"%>
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
        <%
            Especialidade especialidade = new Especialidade();
            List<Especialidade> esp = especialidade.consultarGeral();
        %>

        <div class="container">
            <form action="recebedadosclinicoEN.jsp" method="POST" id="bomasilo" action="">
                <h3>Doctor Register</h3><br/>

                <fieldset>
                    <label>Name</label>
                    <input id="nomeClinico" type="text" required=requeride name="nomeClinico" maxlength="100"/><br />
                </fieldset>

                <fieldset>
                    <label>Registration Code</label>
                    <input type="text" name="codRegistro" maxlength="40"/><br />
                </fieldset>

                <fieldset>    
                    <label>Medical Speciality <br/>
                        <select name="idEspecialidade">
                            <option value="" hidden disabled selected> --Select a Medical Speciality--</option>
                            <% for (Especialidade e : esp) { %>
                            <option value="<%out.write("" + e.getIdEspecialidade());%>">
                                <% out.write("" + e.getDescEspecialidade()); %></option><%}%>
                        </select>
                    </label>
                </fieldset>
                <a href="cadastraespecialidadeEN.jsp" target="_blank"> Register Medical Speciality </a><br/><br/>


                <input type="button" value="Save" onclick="enviarDados()" />
                <input type="reset" value="Cancel" onclick= "window.top.location.href = 'menuEN.jsp';" />    
            </form>
        </div>
    </article>
</section>
<script>
    function enviarDados() {
        var nomeClinico = document.getElementsByName("nomeClinico");
        if (nomeClinico[0].value === "") {
            nomeClinico[0].focus();
            alert("Enter the Doctor's Name!");
            exit();
        }
        var codRegistro = document.getElementsByName("codRegistro");
        if (codRegistro[0].value === "") {
            codRegistro[0].focus();
            alert("Enter the Registration Code!");
            exit();
        }
        var idEspecialidade = document.getElementsByName("idEspecialidade");
        if (idEspecialidade[0].value === "") {
            idEspecialidade[0].focus();
            alert("Enter the Medical Speciality!");
            exit();
        }
        document.forms[0].submit();
    }

</script>    
</body>
</html>