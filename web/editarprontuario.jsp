<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="modelos.Prontuario"%>
<%@page import="modelos.Paciente"%>
<%@page import="java.util.List"%>
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
            function validaAcesso(p1) {
                if (p1 === "") {
                    alert("Realize o acesso!");
                    window.location.href = "index.html";
                } else if ((p1 !== "adm") && (p1 !== "profsaude")) {
                    alert("Você não possui acesso a esta página!");
                    window.location.href = "menu.jsp";
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

        <section>
            <nav>
                <script src="scripts/menu.js"></script> 
            </nav>
            <article>
                <body>
                    <h1>Editar Prontuario</h1>
                    <hr />
                    <%
                        String idProntuario = request.getParameter("idProntuario");
                        Prontuario p = new Prontuario();
                        if (idProntuario != null) {
                            p = p.consultarProntuario(Integer.parseInt(idProntuario));
                        }
                    %>
                    <%
                        Paciente paciente = new Paciente();
                        List<Paciente> pac = paciente.consultarGeral();
                    %>
                    <form action="recebeeditaprontuario.jsp" method="POST">
                        <input type="hidden" name="idprontuario" value="<%out.write("" + p.getIdProntuario());%>">
                        
                        <label>Selecione o Paciente </label> 
                        <select name="cpfPaciente">
                            <% if (p.getCpfPaciente() != null) {%>
                            <option value="<%out.write("" + p.getCpfPaciente());%>"><%out.write("" + p.getPacienteProntuario().getNome());%></option> 
                            <%} else {%>
                            <option value="" hidden disabled selected> --Selecione o Paciente--</option>
                            <%}%>
                            <% for (Paciente pa : pac) { %>
                            <option value="<%out.write("" + pa.getCpfPaciente());%>">
                                <% out.write(pa.getNome()); %></option><%}%>
                        </select> <br/>

                        <label>Tipo Sanguineo</label>
                        <input type="text"  name="tiposangue" maxlength="3" 
                               value="<%out.write(p.getTipoSangue());%>"/> 
                        <br />
                        
                        <label>Peso</label>
                        <input type="text" name="peso"
                               value="<%out.write("" + p.getPeso());%>"/> 
                        <br />
                        
                        <label>Altura</label>
                        <input type="text" name="altura" maxlength="99" 
                               value="<%out.write("" + p.getAltura());%>"/> 
                        <br />
                         
                        
                        <input type="hidden" name="imc" value="<%out.write("" + p.getImc());%>"/> 
                        
                        <input type="checkbox" 
                               name="limitCognitiva" 
                               <%
                                   if (p.isLimitCognitiva()) {
                                       out.write("checked");
                                   }
                               %>
                               >Limitação Cognitiva?  </input> 
                        <br />
                        
                        <input type="checkbox" 
                               name="limitLocomocao" 
                               <%
                                   if (p.isLimitLocomocao()) {
                                       out.write("checked");
                                   }
                               %>
                               >Limitação Locomotiva?  </input> 
                        <br />
                        
                        <input type="checkbox" 
                               name="limitVisao" 
                               <%
                                   if (p.isLimitVisao()) {
                                       out.write("checked");
                                   }
                               %>
                               >Limitação Visual?  </input> 
                        <br />
                        
                        <input type="checkbox" 
                               name="limitAudicao" 
                               <%
                                   if (p.isLimitAudicao()) {
                                       out.write("checked");
                                   }
                               %>
                               >Limitação Auditiva?  </input> 
                        <br />
                        
                        <label>Outra Limitação</label>
                        <input type="text" name="limitOutras"
                               value="<%out.write(p.getLimitOutras());%>" />
                        <br />
                        
                        <label>Alergia</label>
                        <input type="text" name="descAlergia"
                               value="<%out.write(p.getDescAlergia());%>" />
                        <br />
                        
                        <label>Ocupação</label>
                        <input type="text" name="descOcupacao" 
                               value="<%out.write(p.getDescOcupacao());%>"/>
                        <br />
                        
                        <hr />
                        <input type="submit" value="Alterar" onclick="location.href = 'consultaprontuario.jsp';"/>
                        <input type="reset" value="Cancelar" onclick="location.href = 'consultaprontuario.jsp';" />
                    </form>
                </body>
            </article>
        </section>
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>                             
</html>
