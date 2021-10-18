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
                    alert("You need to login first!");
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
            <a href="menuEN.jsp" class="active"> Home <i class="fa fa-solid fa-house-user"></i></a>

            <div class="dropdown">
                <button class="dropbtn">User <i class="fa fa-solid fa-caret-down"></i></button>
                <div class="dropdown-content">
                    <a href="cadastrausuarioEN.jsp" target="janela_prog">Register User</a>
                </div>
            </div> 
            <div class="dropdown">
                <button class="dropbtn"> Worker <i class="fa fa-caret-down"></i></button>
                <div class="dropdown-content">
                    <a href="cadastraenderecoEN.jsp" target="janela_prog">Register Address</a>
                    <a href="cadastrafuncionarioEN.jsp" target="janela_prog">Register Worker</a>
                    <a href="cadastracargoEN.jsp" target="janela_prog">Register Job Position</a>                     
                </div>
            </div>  
            <div class="dropdown">
                <button class="dropbtn"> Patient <i class="fa fa-caret-down"></i></button>
                <div class="dropdown-content">
                    <a href="cadastraenderecoEN.jsp" target="janela_prog">Register Address</a>
                    <a href="cadastrapacienteEN.jsp" target="janela_prog">Register Patient</a>
                    <a href="cadastrafamiliarEN.jsp" target="janela_prog">Register Family</a>                     
                    <a href="cadastraprontuarioEN.jsp" target="janela_prog">Register Prontuary</a>
                    <a href="cadastraquartoEN.jsp" target="janela_prog">Register Room</a>
                    <a href="cadastrarotinaEN.jsp" target="janela_prog">Register Routine</a>
                </div>
            </div>  
            <div class="dropdown">
                <button class="dropbtn"> Medical Prescription <i class="fa fa-caret-down"></i></button>
                <div class="dropdown-content">
                    <a href="cadastraprescricaoEN.jsp" target="janela_prog">Register Prescription</a>
                    <a href="cadastramedicamentoEN.jsp" target="janela_prog">Register Medicine</a>
                    <a href="cadastraclinicoEN.jsp" target="janela_prog">Register Doctor</a>                     
                    <a href="cadastraespecialidadeEN.jsp" target="janela_prog">Register Medical Speciality</a>
                </div>
            </div>
            <div class="dropdown">
                <button class="dropbtn"> List <i class="fa fa-caret-down"></i></button>
                <div class="dropdown-content">
                    <a href="consultacargoEN.jsp" target="janela_prog">Job Position</a>
                    <a href="consultaclinicoEN.jsp" target="janela_prog">Doctor</a>
                    <a href="consultaenderecoEN.jsp" target="janela_prog">Address</a>                     
                    <a href="consultaespecialidadeEN.jsp" target="janela_prog">Medical Speciality</a>
                    <a href="consultafamiliarEN.jsp" target="janela_prog">Family</a>
                    <a href="consultafuncionarioEN.jsp" target="janela_prog">Worker</a>
                    <a href="consultamedicamentoEN.jsp" target="janela_prog">Medicine</a>
                    <a href="consultapacienteEN.jsp" target="janela_prog">Patient</a>                     
                    <a href="consultaprescricaoEN.jsp" target="janela_prog">Prescription</a>
                    <a href="consultaprontuarioEN.jsp" target="janela_prog">Prontuary</a>
                    <a href="consultarotinaEN.jsp" target="janela_prog">Routine</a>
                    <a href="consultausuarioEN.jsp" target="janela_prog">User</a>
                </div> 
            </div>
            <div class="dropdown">
                <a href="logoutEN.jsp" class="active"> Logout <i class='fa-solid fa-house' style='font-size:8px;color:white'></i></a>
            </div>    
             <a type="button" id="ingles" href="menuEN.jsp">
                 <img src="imagens/eua.png" width="24" align="center"/></a>
           
            <a type="button" id="brasil" href="menu.jsp"> 
                <img src="imagens/br2.png" width="24" align="center"/></a>            
                        
        </div>
        <div class="main">
            <iframe name="janela_prog" element.mozRequestFullScreen()></iframe>
        </div>
    </body>
</html>