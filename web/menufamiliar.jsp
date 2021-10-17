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
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="styles/menustyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="//code-sa1.jivosite.com/widget/7BEqBwjT8Y" async></script>
        <link rel="icon" type="image/favicon" href="imagens/favicon.ico" />
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

        <div class="topnav" id="myTopnav">
            <a href="menufamiliar.jsp" class="active"> Home <i class="fa fa-solid fa-house-user"></i></a>
            <a href="familiaralterarusuario.jsp" target="janela_prog">Perfil</a>
            <a href="familiarvisualizarclinico.jsp" target="janela_prog">Clinicos</a>
            <a href="familiarvisualizarfamiliar.jsp" target="janela_prog">Meus Dados</a>                     
            <a href="familiarvisualizarpaciente.jsp" target="janela_prog">Dados Paciente</a>
            <a href="familiarvisualizarprescricao.jsp" target="janela_prog">Prescrições</a>
            <a href="familiarvisualizarprontuario.jsp" target="janela_prog">Prontuários</a>
            <a href="familiarvisualizarrotina.jsp" target="janela_prog">Rotinas</a>
            <a href="logout.jsp" class="active"> Sair <i class='fa-solid fa-house' style='font-size:8px;color:white'></i></a>
        </div>

        <div class="main">
            <iframe name="janela_prog" src="homefamiliar.jsp" element.mozRequestFullScreen()></iframe>
        </div>
    </body>
</html>