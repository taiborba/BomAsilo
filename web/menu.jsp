<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="styles/menu.css" rel="stylesheet" type="text/css">

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            //out.println(session.getAttribute("tipoAcesso"));
        %>
       
    <ul id="nav">
        <li><a href="#">Usuário</a>
            <ul>
                <li><a href='cadastrarusuario.jsp'>Cadastrar Usuário </a></li>
                <li><a href='redefinirSenha.jsp'>Redefinir Senha </a></li>
                
            </ul>
        </li>
     </ul>
        
    <ul id="nav">
        <li><a href="#">Funcionário</a>
            <ul>
                <li><a href='cadastraendereco.jsp'>Cadastrar Endereço </a></li>
                <li><a href='cadastrarfuncionario.jsp'>Cadastrar Funcionário </a></li>
                <li><a href='cadastracargo.jsp'>Cadastrar Cargo </a></li>
                
            </ul>
        </li>
    </ul>
        
    <ul id="nav">
        <li><a href="#">Paciente</a>
            <ul>
                <li><a href='cadastraendereco.jsp'>Cadastrar Endereço </a></li>
                <li><a href='cadastrapaciente.jsp'>Cadastrar Paciente </a></li>
                <li><a href='cadastrafamiliar.jsp'>Cadastrar Familiar </a></li>
                <li><a href='cadastraprontuario.jsp'>Cadastrar Prontuario </a></li>
                <li><a href='cadastrarotina.jsp'>Cadastrar Rotina </a></li>
                <li><a href='cadastraquarto.jsp'>Cadastrar Quarto </a></li>
            </ul>
        </li>
    </ul>       
           
    <ul id="nav">
        <li><a href="#">Prescrição Médica</a>
            <ul>
                <li><a href='cadastraprescricao.jsp'>Cadastrar Prescrição </a></li>
                <li><a href='cadmedicamentos.jsp'>Cadastrar Medicamentos </a></li>
                <li><a href='cadastraclinico.jsp'>Cadastrar Clinico </a></li>
                <li><a href='cadespecialidade.jsp'>Cadastrar Especialidade </a></li>
                
            </ul>
        </li>
         <li><a href="#">Consultas</a>
            <ul>
                <li><a href='consultacargo.jsp'>Consultar Cargo </a></li>
                <li><a href='consultaclinico.jsp'>Consultar Clinico </a></li>
                <li><a href='consultaendereco.jsp'>Consultar Endereço </a></li>
                <li><a href='consultaespecialidade.jsp'>Consultar Especialide</a></li>
                <li><a href='consultafamiliar.jsp'>Consultar Familiar </a></li>
                <li><a href='consultafuncionario.jsp'>Consultar Funcionário </a></li>
                <li><a href='consultamedicamento.jsp'>Consultar Medicamentos </a></li>
                <li><a href='consultapaciente.jsp'>Consultar Paciente </a></li>
                <li><a href='consultaprescricao.jsp'>Consultar Prescrição </a></li>
                <li><a href='consultaprontuario.jsp'>Consultar Prontuário </a></li>
                <li><a href='consultaquarto.jsp'>Consultar Quarto </a></li>
                <li><a href='consultarotina.jsp'>Consultar Rotina </a></li>
                <li><a href='consultausuario.jsp'>Consultar Usuário </a></li>
                
            </ul>
        </li>
    </ul>
    </body>
</html>
