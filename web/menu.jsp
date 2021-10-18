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
            <div class="active">                 
                <a href="home.jsp"  target="janela_prog">Home <i class="fa fa-solid fa-house-user"></i></a> 
            </div>
            <div class="dropdown">
                <button class="dropbtn">Usuário <i class="fa fa-solid fa-caret-down"></i></button>
                <div class="dropdown-content">
                    <a href="cadastrausuario.jsp" target="janela_prog">Cadastrar Usuário</a>
                </div>
            </div> 
            <div class="dropdown">
                <button class="dropbtn"> Funcionário <i class="fa fa-caret-down"></i></button>
                <div class="dropdown-content">
                    <a href="cadastraendereco.jsp" target="janela_prog">Cadastrar Endereço</a>
                    <a href="cadastracargo.jsp" target="janela_prog">Cadastrar Cargo</a>
                    <a href="cadastrafuncionario.jsp" target="janela_prog">Cadastrar Funcionário</a>
                </div>
            </div>  
            <div class="dropdown">
                <button class="dropbtn"> Paciente <i class="fa fa-caret-down"></i></button>
                <div class="dropdown-content">
                    <a href="cadastraendereco.jsp" target="janela_prog">Cadastrar Endereço</a>
                    <a href="cadastraquarto.jsp" target="janela_prog">Cadastrar Quarto</a>
                    <a href="cadastrapaciente.jsp" target="janela_prog">Cadastrar Paciente</a>
                    <a href="cadastrafamiliar.jsp" target="janela_prog">Cadastrar Familiar</a>                     
                    <a href="cadastraprontuario.jsp" target="janela_prog">Cadastrar Prontuário</a>
                    <a href="cadastrarotina.jsp" target="janela_prog">Cadastrar Rotina</a>
                </div>
            </div>  
            <div class="dropdown">
                <button class="dropbtn"> Prescrição <i class="fa fa-caret-down"></i></button>
                <div class="dropdown-content">
                    <a href="cadastramedicamento.jsp" target="janela_prog">Cadastrar Medicamentos</a>
                    <a href="cadastraespecialidade.jsp" target="janela_prog">Cadastrar Especialidade</a>
                    <a href="cadastraclinico.jsp" target="janela_prog">Cadastrar Clínico</a>  
                    <a href="cadastraprescricao.jsp" target="janela_prog">Cadastrar Prescrição</a>
                </div>
            </div>
            <div class="dropdown">
                <button class="dropbtn"> Relatórios <i class="fa fa-caret-down"></i></button>
                <div class="dropdown-content">
                    <a href="consultacargo.jsp" target="janela_prog">Cargo</a>
                    <a href="consultaclinico.jsp" target="janela_prog">Clínico</a>
                    <a href="consultaendereco.jsp" target="janela_prog">Endereço</a>                     
                    <a href="consultaespecialidade.jsp" target="janela_prog">Especialidade</a>
                    <a href="consultafamiliar.jsp" target="janela_prog">Familiar</a>
                    <a href="consultafuncionario.jsp" target="janela_prog">Funcionário</a>
                    <a href="consultamedicamento.jsp" target="janela_prog">Medicamento</a>
                    <a href="consultapaciente.jsp" target="janela_prog">Paciente</a>                     
                    <a href="consultaprescricao.jsp" target="janela_prog">Prescrição</a>
                    <a href="consultaprontuario.jsp" target="janela_prog">Prontuário</a>
                    <a href="consultarotina.jsp" target="janela_prog">Rotina</a>
                    <a href="consultausuario.jsp" target="janela_prog">Usuário</a>
                </div> 
            </div>
            <div class="dropdown">
                <a href="logout.jsp" class="active"> Sair <i class='fa-solid fa-house' style='font-size:8px;color:white'></i></a>
            </div>  
            <div class="language"> 
                <a type="button" id="ingles" href = "menuEN.jsp">
                    <img src="imagens/eua.png" width="24" align="center"/></a>

                    <a type="button" id="brasil" href = "menu.jsp">
                        <img src="imagens/br2.png" width="24" align="center"/></a>
            </div>

        </div>
        
        <div class="main">
            <iframe name="janela_prog" src="home.jsp" element.mozRequestFullScreen()></iframe>
        </div>
    </body>
</html>