<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/favicon" href="imagens/favicon.ico" />
        <title>Bom Asilo</title>
    </head>
    <body>
        <h1>Recuperação de Conta</h1>
    </body>
    <form action="checkesquece.jsp" method="POST">
        <div>
            <label>Insira seu E-mail Cadastrado: </label>
            <input type="text" name="emailUsuario" /> <br />
            <input type="button" value="Enviar E-mail" onclick="enviarDados()" />
        </div>   
    </form>
    <script>
        function enviarDados() {
            var emailUsuario = document.getElementsByName("emailUsuario");
            if (emailUsuario[0].value === "") {
                emailUsuario[0].focus();
                alert("INFORME SEU E-MAIL!");
                exit();
            }
            document.forms[0].submit();
        }
    </script>    
</html>
