<!--Pronto-->
<%@page import="modelos.Paciente"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page import="modelos.Prescricao"%>
<%@page import="modelos.Medicamento"%>
<%@page import="modelos.Clinico"%>

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
                    Integer idPrescricao = Integer.parseInt(request.getParameter("idPrescricao"));
                      Prescricao pr = new Prescricao();
                      if (idPrescricao != null){
                          pr = pr.consultarPrescricao(idPrescricao);
                      }    
                      
                        Paciente pa = new Paciente();
                        List<Paciente> pac = pa.consultarGeral();
                        
                        Clinico clinico = new Clinico();
                        List<Clinico> clin = clinico.consultarGeral();
                        
                        Medicamento medicamento = new Medicamento();
                        List<Medicamento> med = medicamento.consultarGeral();
                    %>
                    <form action="recebeeditaprescricao.jsp" method="POST">
                     <input type="hidden" name="idPrescricao" value="<%out.write("" + pr.getIdPrescricao());%>" /> 
                    <label>Selecione o Paciente </label> 
                        <select name="cpfPaciente">
                            <% if (pr.getCpfPaciente() != null){%>
                            <option value="<%out.write(""+pr.getCpfPaciente());%>"><%out.write(""+pr.getPacientePrescricao().getCpfPaciente()+ " - " +pr.getPacientePrescricao().getNome());%></option> 
                                <%} else {%>
                            <option value="" hidden disabled selected> --Selecione o Paciente--</option>
                            <%}%>
                            <% for(Paciente p: pac){ %>
                            <option value="<%out.write(""+p.getCpfPaciente());%>">
                            <% out.write(p.getCpfPaciente()+ " - " +p.getNome()); %></option><%}%>
                        </select><br />
 
                         <label>Selecione o Clinico </label> 
                        <select name="idClinico">
                            <% if ("" + pr.getIdClinico()!= null){%>
                            <option value="<%out.write(""+pr.getIdClinico());%>"><%out.write(""+pr.getClinicoPrescricao().getNomeClinico()+ " - " +pr.getClinicoPrescricao().getEspecialidadeClinico().getDescEspecialidade());%></option> 
                                <%} else {%>
                            <option value="" hidden disabled selected> --Selecione o Clinico--</option>
                            <%}%>
                            <% for(Clinico c: clin){ %>
                            <option value="<%out.write(""+c.getIdClinico());%>">
                            <% out.write(c.getNomeClinico()+ " - " + c.getEspecialidadeClinico().getDescEspecialidade()); %></option><%}%>
                        </select><br />
                        
                         <label>Selecione o Medicamento </label> 
                        <select name="idMedicamento">
                            <% if ("" + pr.getIdMedicamento()!= null){%>
                            <option value="<%out.write(""+pr.getIdMedicamento());%>"><%out.write(""
                                    +pr.getMedicamentoPrescricao().getNomeMedicamento());%></option> 
                                <%} else {%>
                            <option value="" hidden disabled selected> --Selecione o Medicamento--</option>
                            <%}%>
                            <% for(Medicamento m: med){ %>
                            <option value="<%out.write(""+m.getIdMedicamento());%>">
                            <% out.write(m.getNomeMedicamento()); %></option><%}%>
                        </select><br />
                        
                        <label>Data Consulta</label>
                        <input type="date" name="dataConsulta" value="<%out.write(""+pr.getDataConsulta());%>" /> <br/>
                     
                        <label>Hora Consulta</label><br />
                        <input type="time" name="horaConsulta" value="<%out.write(""+pr.getHoraConsulta());%>" /> <br/>
                       
                        <label>Descrição Orientação</label>
                        <input type="text" name="descOrientacao" value="<%out.write(""+pr.getDescOrientacao());%>" /> <br/>
                        
                        <label>Descrição Posologia</label>
                        <input type="text" name="descPosologia" value="<%out.write(""+pr.getDescPosologia());%>" /> <br />
                        
                        <input type="submit" value="Alterar" onclick="location.href = 'consultaprescricao.jsp';"/>
                        <input type="reset" value="Cancelar" onclick="location.href = 'consultaprescricao.jsp';" />
                    </form>
                </body>
            </article>
        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>                    
</html>
