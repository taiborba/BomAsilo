<%@page import="modelos.Prescricao"%>
<%@page import="modelos.Paciente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bom Asilo</title>
        <link rel="stylesheet" href="styles/estilos.css">
        <script src="scripts/formatacampos.js"></script>
    </head>
    
    <body>
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
                <h1>Cadastro de Rotina </h1>
                <hr /> 
                <label class="cabecalho" id="msg"> 
                    <%
                        if(request.getParameter("pmensagem") != null)         
                            out.write(request.getParameter("pmensagem"));
                        
                          Paciente paciente = new Paciente();
                          List<Paciente> pac = paciente.consultarGeral();
                          
                          Prescricao prescricao = new Prescricao();
                          List<Prescricao> pre = prescricao.consultarGeral();
                    %>
                </label>
                    <form action="recebedadosrotina.jsp" method="POST">
                         <label>Selecione o Paciente </label> 
                        <select name="cpfPaciente">
                            <option value="" hidden disabled selected> --Selecione o Paciente--</option>
                            <% for(Paciente p: pac){ %>
                            <option value="<%out.write(""+p.getCpfPaciente());%>">
                            <% out.write(p.getCpfPaciente() + " - " + p.getNome()); %></option><%}%>
                        </select> 
                        <br/>
                        
                        <label>Data evento</label>
                        <input id="dataEvento" name="dataEvento"   type="date" required="required" placeholder="Informe a Data do evento"/> <br/>
                        <input id="validadataEvento" class="validacampos" type="hidden"/>
                        <br/>
                    
                        <label>Hora de Inicio</label><br/>
                        <input id="horaInicio" name="horaInicio" type="time" required="required" placeholder="Informe a Hora de inicio" maxlength="5" /> <br />
                        <label id="validahoraInicio" class="validacampos"></label>
                        <br/>
                    
                        <label>HoraFinal</label><br/>
                        <input id="horafinal" name="horaFinal" type="time" required="required" placeholder="Informe a Hora Final" maxlength="5" /> <br />
                        <label id="validaHoraFinal" class="validacampos"></label>
                        <br/>
                    
                        <label>Desc Evento</label>
                        <input id="descevento" name="descEvento" type="text" required="required" placeholder="Informe a Descricao do Evento" maxlength="40" /> <br />
                        <label id="validadescevento" class="validacampos"></label>
                        <br/>
                    
                        <label>Status</label>
                        <input id="status" name="status" type="text" required="required" placeholder="Informe o Status" maxlength="20" /> <br />
                        <label id="validastatus" class="validacampos"></label>
                        <br/>
                    
                        <label>Qtde de Intervalo</label>
                        <input id="qtdeIntervalo" name="qtdeIntervalo" type="text" required="required" placeholder="Informe a Qtde do Intervalo" maxlength="10" /> <br />
                        <label id="validaQtdeIntervalo" class="validacampos"></label>
                        <br/>
                        
                         <label>Selecione a Prescricao </label> 
                        <select name="idPrescricao">
                            <option value="" hidden disabled selected> --Selecione a Prescricao--</option>
                            <% for(Prescricao pr: pre){ %>
                            <option value="<%out.write(""+pr.getIdPrescricao());%>">
                            <% out.write(pr.getDescPosologia()+ " - " + pr.getDataConsulta()); %></option><%}%>
                        </select> 
                        <br/>
                     
                        <input type="button" value="Salvar" onclick="enviarDados()" />
                        <input type="reset" value="Cancelar" onclick="location.href = 'menu.jsp';" />
                    </div>   
                </form>
            </article>
        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer> 
<script>
    function enviarDados(){
            var cpfPaciente = document.getElementsByName("cpfPaciente");
            if(cpfPaciente[0].value === ""){
                cpfPaciente[0].focus();
                alert("Informe o Cpf do Paciente");
                exit(0);
            }

            var dataEvento = document.getElementsByName("dataEvento");
            if(dataEvento[0].value === ""){
                dataEvento[0].focus();
                alert("Informe a data do Evento");
                exit(0);
            }

            var horaInicio = document.getElementsByName("horaInicio");
            if(horaInicio[0].value === ""){
                horaInicio[0].focus();
                alert("Informe a Hora de inicio");
                exit(0);
            }

            var horaFinal = document.getElementsByName("horaFinal");
            if(horaFinal[0].value === ""){
                horaFinal[0].focus();
                alert("Informe a Hora final ");
                exit(0);
            }
            
             var descEvento = document.getElementsByName("descEvento");
            if(descEvento[0].value === ""){
                descEvento[0].focus();
                alert("Informe a descricao do evento");
                exit(0);
            }
              
             var status = document.getElementsByName("status");
            if(status[0].value === ""){
                status[0].focus();
                alert("Informe o status");
                exit(0);
            }
              
             var qtdeIntervalo = document.getElementsByName("qtdeIntervalo");
            if(qtdeIntervalo[0].value === ""){
                qtdeIntervalo[0].focus();
                alert("Informe a Qtde do Intervalo");
                exit(0);
            }
            document.forms[0].submit();
    }        
    
</script>    
    </body>
</html>