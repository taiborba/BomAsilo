<%@page import="java.text.SimpleDateFormat"%>
<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Rotina"%>
<%@page import="java.sql.Date"%>
<%@page import="modelos.Familiar"%>
<%@page import="modelos.Paciente"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/estilos.css">
        <script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>  
        <script src="scripts/formatacampos.js"></script>
    </head>
    <header>
         <script>
            function validaAcesso(p1) {
                if (p1 === "") {
                    alert("Realize o acesso!");
                    window.top.location.href = "index.html";
                } else if (p1 !== "familiar") {
                    alert("Você não possui acesso a esta página!");
                    window.top.location.href = "menufamiliar.jsp";
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

        <h1>Visualizar Rotinas</h1>
        <hr />
        
        <%            
            String usuarioLogado = "";

            if (session.getAttribute("usuarioLogado") != null) {
                usuarioLogado = session.getAttribute("usuarioLogado").toString();
            }
        %>

        <%
            Rotina rot = new Rotina();
            Familiar familiar = new Familiar();
            Paciente paciente = new Paciente();
           
        %>
        
         <%
         
        List<Rotina> rotina = rot.consultarRotinaPaciente(paciente.consultarPaciente(familiar.consultarFamiliar(usuarioLogado).getCpfPaciente()));
       
        %>
    
        <table class="table table-striped">
            <thead>
            <th scope="col">Data Inicial</th>
            <th scope="col">Data Final</th>
            <th scope="col">Paciente</th>
            <th scope="col">hora de Inicio</th>
            <th scope="col">Hora Final</th>
            <th scope="col">Descricao do Evento</th>
            <th scope="col">Status</th>
            <th scope="col">Quantidade Dias</th>
            <th scope="col">Prescricao </th>
            </thead>
        <tbody>
                <% for (Rotina r : rotina) {
                     String classe = r.getStatus().toUpperCase().equals("P") ? "Pendente" : "Efetivado";
                 %>
                  <tr class="<%out.write(classe);%>">
                <%
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    String dataInicial = sdf.format(r.getDataInicial());
                    String dataFinal = sdf.format(r.getDataFinal());
                %>

                <td><% out.write("" + dataInicial); %></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;<% out.write("" + dataFinal); %></td>
                <td><% out.write("" + r.getCpfPaciente() + " - " + r.getPacienteRotina().getNome()); %></td>
                <td><% out.write("" + r.getHoraInicio()); %></td>
                <td><% out.write("" + r.getHoraFinal()); %></td>
                <td><% out.write("" + r.getDescEvento()); %></td>
                <td><% out.write("" + classe); %></td>
                <td><% out.write("" + r.getQtdIntervalo()); %></td>
                <td>
                    <% if(r.getPrescricaoRotina() != null) { 
                        out.write("" + r.getPrescricaoRotina().getDescOrientacao() + " - "
                                    + r.getPrescricaoRotina().getDescPosologia() + " - "
                                    + r.getPrescricaoRotina().getHoraConsulta()); 
                    }
                    %>
                </td>
                </tr> 
            <%}%>
        </tbody>
    </table>
</form> 

<!-- POPUP DE CONFIRMAÇÃO DE EXCLUSÃO -->   

<div class="msg-popup2">
    <h5 class="text-center" style="color: #ffffff; font-family: arial-bold ">EXCLUSÃO</h5>
    <h5 class="text-center" style="color: #ffffff;">Confirma a <b>exclusão</b> do registro ?</h5>
    <div class="text-center">                
        <a href=""><button class="btn btn-dark" onclick="cancela()"> Não </button></a>
        <a id="exclui" href="#"><button class="btn btn-danger" id="excluir"> Sim </button></a>                    
    </div>
</div>        

<script>
    function cancela() {
        document.getElementsByClassName("msg-popup2")[0].style.display = "none";
    }

    function mostrarExclusao(rotina) {
        //debugger;
        document.getElementsByClassName("msg-popup2")[0].style.display = "block";
        var link = document.getElementById("exclui");
        link.href = "excluirotina.jsp?idEvento=" + rotina;
    }
</script>
</body>
</html>
