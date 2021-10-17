<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/favicon" href="imagens/favicon.ico" />
        <title>Bom Asilo</title>
    </head>
    <body>
        <h1>Account Recovery</h1>
    </body>
    <form action="checkesquece.jsp" method="POST">
        <div>
            <label>Insert your Registered E-mail: </label>
            <input type="text" name="emailUsuario" /> <br />
            <input type="button" value="Send E-mail" onclick="enviarDados()" />
        </div>   
    </form>
    <script>
        function enviarDados() {
            var emailUsuario = document.getElementsByName("emailUsuario");
            if (emailUsuario[0].value === "") {
                emailUsuario[0].focus();
                alert("INSERT YOUR E-MAIL!");
                exit();
            }
            document.forms[0].submit();
        }
    </script>    
</html>
