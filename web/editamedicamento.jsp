<!-- 
***********************************************************************************************************
* ENTRA21 - JAVA WEB MATUTINO 2021                                                                        *
* PROJETO BOM ASILO                                                                                       *
* EQUIPE: EDUARDA STEFFEN, LUCAS RAFAEL BOOZ, TAINARA DA SILVA BORBA, LEONARDO LUIZ MOREIRA PINHEIRO      *
***********************************************************************************************************
-->

<%@page import="modelos.Medicamento"%>
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
        
            <nav>
                <script src="scripts/menu.js"></script> 
            </nav>
            
                <h1>Editar Medicamento</h1>
                <hr />
                    
                    <%
                      Integer idMedicamento = Integer.parseInt(request.getParameter("idMedicamento"));
                      Medicamento m = new Medicamento();
                      if (idMedicamento != null){
                          m = m.consultarMedicamentos(idMedicamento);
                      } 
                    %>
                    <form action="recebeeditamedic.jsp" method="POST">
                        
                    <input type="hidden" name="idMedicamento" value="<%out.write("" + m.getIdMedicamento());%>" />
                    
                        <label>Nome</label>
                        <input type="text" name="nomeMedicamento" 
                               value="<%out.write(m.getNomeMedicamento());%>" />

                        <br />
                       
                         <input type="checkbox" 
                               name="indControlado" 
                               <%
                                   if (m.isIndControlado()) {
                                       out.write("checked");
                                   }
                               %>
                               >Uso Contínuo?  </input> 
                                
                        
                              
                             
                        <hr />
                        <br />
                        <input type="submit" value="Alterar" onclick="location.href = 'consultamedicamento.jsp';"/>
                        <input type="reset" value="Cancelar" onclick="location.href = 'consultamedicamento.jsp';" />
                    </form>
                </body>
            
        
        <footer>
            <script src="scripts/rodape.js"></script>
        </footer>                    
</html>
