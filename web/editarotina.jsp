<%@page import="modelos.Prescricao"%>
<%@page import="modelos.Paciente"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Rotina"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/estilos.css">
        <title>Bom Asilo</title>
    </head>
     <header>
            <script src="scripts/cabecalho.js"></script> 
             <script>
                function validaAcesso(p1){
                   if(p1 === ""){
                     alert("Realize o acesso!");
                     window.location.href = "index.html";
                   } else if((p1 !== "adm") && (p1 !== "profsaude")){
                    alert("Você não possui acesso a esta página!"); 
                    window.location.href = "menu.jsp";
                   }
                }   
            </script> 
        </header>
     <body>
         
            <%
            String tipoAcesso = "";
            if (session.getAttribute("tipoAcesso") != null){
                tipoAcesso = session.getAttribute("tipoAcesso").toString();
            }
            System.out.println("Tipo:" + tipoAcesso);            
            out.write("<script>validaAcesso(\"" + tipoAcesso + "\");</script>");  
        %>
        
        <section>
            <nav>
                <script src="scripts/menu.js"></script> 
            </nav>
            <article>
                <body>
                    <h1>Editar Rotina</h1>
                    <hr />
                    <%
                      Integer idEvento = Integer.parseInt(request.getParameter("idEvento"));
                      Rotina r = new Rotina();
                      if (idEvento != null){
                          r = r.ConsultarRotina(idEvento);
                      }    
                        
                        Paciente paciente = new Paciente();
                        List<Paciente> pa = paciente.consultarGeral();
                        
                        Prescricao prescricao = new Prescricao();
                        List<Prescricao> pre = prescricao.consultarGeral();
                    %>
                    <form action="recebeeditarotina.jsp" method="POST">
                        <input type="hidden" name="idEvento" 
                               value="<%out.write(""+r.getIdEvento());%>" />
                         <br /> 
                         
                        <label>Selecione o Paciente </label> 
                        <select name="cpfPaciente">
                            <% if (r.getCpfPaciente() != null){%>
                            <option value="<%out.write(""+r.getCpfPaciente());%>"></option> 
                                <%} else {%>
                            <option value="" hidden disabled selected> --Selecione o Paciente-- </option>
                            <%}%>
                            <% for(Paciente p: pa){ %>
                            <option value="<%out.write(""+p.getCpfPaciente());%>">
                            <% out.write(p.getNome()+" - "+p.getCpfPaciente()); %></option><%}%>
                        </select> 
                        <br />
                        
                        <label>Data do Evento</label>
                        <input type="text" name="dataEvento" 
                               value="<%out.write(""+r.getDataEvento());%>" 
                               maxlength="14"/>
                        <br />
                        <label>Hora de Inicio</label>
                        <br />
                        <input type="time" name="horaInicio" 
                               value="<%out.write(r.getHoraInicio());%>" 
                               maxlength="8"/>
                        <br />
                        <label>Hora Final</label>
                        <br />
                        <input type="time" name="horaFinal" 
                               value="<%out.write(""+r.getHoraFinal());%>" 
                               maxlength="13"/>
                        <br />
                        <label>Descricao do Evento</label>
                        <input type="text" name="descEvento" 
                               value="<%out.write(""+r.getDescEvento());%>" 
                               maxlength="14"/>
                         <br />
                         <label>Status</label>
                        <input type="text" name="status" 
                               value="<%out.write(""+r.getStatus());%>" 
                               maxlength="20"/>
                         <br />
                         <label>Qtde do Intervalo</label>
                        <input type="text" name="qtdeIntervalo" 
                               value="<%out.write(""+r.getQtdIntervalo());%>" 
                               maxlength="10"/>
                        <br />
                        
                        <label>Selecione a Prescricao </label> 
                        <select name="idPrescricao">
                            <% if (""+r.getIdPrescricao()!= null){%>
                            <option value="<%out.write(""+r.getIdPrescricao());%>"></option> 
                                <%} else {%>
                            <option value="" hidden disabled selected> --Selecione a Prescricao-- </option>
                            <%}%>
                            <% for(Prescricao pr: pre){ %>
                            <option value="<%out.write(""+pr.getIdPrescricao());%>">
                            <% out.write(pr.getDescOrientacao()+" - "+pr.getDataConsulta()+" - "+pr.getHoraConsulta()+" - "+pr.getDescPosologia()); %></option><%}%>
                        </select> 
                        <br />
                        <hr />
                        <input type="submit" value="Alterar" onclick="location.href = 'consultarotina.jsp';" />
                        <input type="reset" value="Cancelar" onclick="location.href = 'consultarotina.jsp';" />
                    </form>
                </body>
            </article>
        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>                    
</html>
